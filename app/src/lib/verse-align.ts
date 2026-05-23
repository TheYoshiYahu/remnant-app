/**
 * Verse-text ↔ verse-words alignment (S121, Wheel 3 — Strong's
 * tap-on-word UI).
 *
 * The canon edition's verse text carries restored sacred names with
 * parenthetical English equivalents:
 *
 *   "In the beginning Elohim (God) created the heaven and the earth."
 *
 * The source USFX tokens (loaded into verse_words at S120) carry the
 * un-restored English surfaces with Strong's numbers:
 *
 *   beginning(H7225) God(H0430) created(H1254) heaven(H8064)
 *   and(H0853) earth(H0776)
 *
 * The PWA needs to render the restored text as a mix of plain runs +
 * tappable spans (tap → Strong's modal). This module is the alignment
 * pass that turns (restoredText, verseWords[]) into Segment[] for the
 * verse renderer.
 *
 * Two cluster patterns handled explicitly:
 *
 *   1. SINGLE sacred name. "Elohim (God)" — one Hebrew token followed
 *      by a "(English)" parenthetical containing one USFX surface.
 *      The Hebrew token gets the Strong's tag; the parenthetical
 *      renders as plain orientation text.
 *
 *   2. COMPOUND sacred name. "Yahuah Elohim (the LORD God)" — two
 *      Hebrew tokens followed by a "(the LORD God)" parenthetical
 *      containing two USFX surfaces (LORD, God). Each Hebrew token
 *      claims one USFX surface in order; the parenthetical renders
 *      as plain orientation text.
 *
 * Everything else is sequential plain-string matching: walk the
 * restored tokens left-to-right; when the next restored token's core
 * word matches the next USFX surface (case-insensitive, trimmed of
 * trailing punctuation), pair them. Otherwise the restored token
 * renders as plain.
 *
 * Same naming convention as DESIGN_LANGUAGE.md §3 ("sacred-name
 * cluster"). When the alignment can't pair a USFX token (unexpected
 * word order or restoration that dropped a word entirely), that token
 * is silently skipped — the verse still renders cleanly; just a few
 * fewer tappable spans than the full Strong's catalog promised.
 * Edge cases surface as bug reports during the publish-then-edit
 * passes (S77 strategic frame); the alignment is built to degrade
 * gracefully, not to fail loudly.
 */

export interface VerseWordInput {
  position: number;
  surface: string;
  strong_number: string | null;
}

export type Segment =
  | { kind: "plain"; text: string }
  | {
      kind: "tappable";
      text: string;
      strong: string;
      surface: string;
      /** Stable key suffix for React reconciliation across re-renders. */
      key: string;
    };

/**
 * Strip trailing punctuation + brackets from a token's core word so
 * "earth." matches USFX "earth". Leading punctuation (rare) also
 * stripped. Returns the lowercased core for comparison.
 *
 * Apostrophes and hyphens are preserved (they appear inside real
 * words: "Yashar'el", "self-same").
 */
function coreLower(token: string): string {
  return token.replace(/^[^\p{L}\p{N}'-]+|[^\p{L}\p{N}'-]+$/gu, "").toLowerCase();
}

/**
 * Tokenize restored verse text into raw whitespace-separated tokens.
 * Punctuation stays attached to the adjacent token ("earth." stays
 * together) so the renderer reproduces the original spacing visually.
 * Parentheticals are kept as single tokens including the parens so
 * the sacred-name-cluster detection can identify them directly.
 *
 * The split preserves single spaces between tokens (the renderer
 * joins on " "). Multi-space runs in source text are extremely rare
 * for this corpus and are collapsed to single spaces, which is fine
 * for prose rendering.
 */
function tokenize(text: string): string[] {
  // Split on whitespace, drop empties. Parentheses cling to neighbors
  // naturally because there's no space inside "(God)" or
  // "(the LORD God)" once tokenized — but a multi-word parenthetical
  // breaks across tokens, so we re-group below.
  const raw = text.split(/\s+/).filter((t) => t.length > 0);

  // Re-group multi-word parentheticals into single tokens so cluster
  // detection sees them as units. A parenthetical opens at a "(" and
  // closes at the first ")"; everything between is one token.
  const out: string[] = [];
  let i = 0;
  while (i < raw.length) {
    const t = raw[i];
    if (t.startsWith("(") && !t.includes(")")) {
      // Multi-token parenthetical. Consume until the closing ")".
      let combined = t;
      i++;
      while (i < raw.length && !raw[i].includes(")")) {
        combined += " " + raw[i];
        i++;
      }
      if (i < raw.length) {
        combined += " " + raw[i];
        i++;
      }
      out.push(combined);
    } else {
      out.push(t);
      i++;
    }
  }
  return out;
}

/**
 * Returns the set of lowercased core surfaces inside a parenthetical
 * token. "(God)" → {"god"}; "(the LORD God)" → {"the", "lord", "god"}.
 * Used by cluster detection to test "does this paren contain the next
 * USFX surface?"
 */
function parenContents(token: string): string[] {
  if (!token.startsWith("(") || !token.endsWith(")")) return [];
  const inside = token.slice(1, -1);
  return inside.split(/\s+/).map(coreLower).filter((s) => s.length > 0);
}

/**
 * Core alignment. Walks both lists in parallel.
 *
 * The non-obvious move is sacred-name cluster handling. When we see a
 * parenthetical ahead, we look INSIDE the parenthetical to count how
 * many of its words match upcoming USFX surfaces in order — call that
 * N. The Hebrew cluster is then exactly the N tokens immediately
 * BEFORE the parenthetical (not "everything from current cursor to
 * the paren," which would over-claim interlude prose). Tokens between
 * the cursor and the cluster start are interlude — walked
 * sequentially as plain or tappable per the simple match rule.
 *
 * Bug caught at S121 test pass: original "claim everything between
 * cursor and paren" version pulled "that" into "that Yahuah Elohim
 * (the LORD God)" and mis-paired "that" with H3068 LORD. Counting N
 * inside the paren and walking back N tokens from the paren fixes
 * this — the cluster starts where it should (at "Yahuah").
 *
 * `keyPrefix` is folded into Segment.key for stable React keys across
 * verse-render cycles (use the verse_id at the call site).
 */
export function alignVerse(
  restoredText: string,
  words: VerseWordInput[],
  keyPrefix: string = ""
): Segment[] {
  const tokens = tokenize(restoredText);
  const segments: Segment[] = [];
  let w = 0; // USFX cursor

  let i = 0;
  while (i < tokens.length) {
    const tok = tokens[i];

    // Standalone parenthetical at cursor — emit plain. (Sacred-name
    // clusters are processed by walking back from the paren, not by
    // hitting the paren at the cursor first.)
    if (tok.startsWith("(") && tok.endsWith(")")) {
      segments.push({ kind: "plain", text: tok });
      i++;
      continue;
    }

    // Peek ahead a small window for a parenthetical. If found, check
    // how many of its lowercased words match upcoming USFX surfaces
    // in order — that's the cluster's pairing count N.
    let clusterStart = -1;
    let parenIdx = -1;
    let pairings: VerseWordInput[] = [];
    for (let j = i; j < Math.min(i + 6, tokens.length); j++) {
      const cand = tokens[j];
      if (cand.startsWith("(") && cand.endsWith(")")) {
        const contents = parenContents(cand);
        let tempW = w;
        const matched: VerseWordInput[] = [];
        for (const pw of contents) {
          if (
            tempW < words.length &&
            words[tempW].strong_number &&
            pw === (words[tempW].surface || "").toLowerCase()
          ) {
            matched.push(words[tempW]);
            tempW++;
          }
          // pw that doesn't match is a connective ("the", "of") — skip
          // it; don't advance USFX cursor.
        }
        if (matched.length > 0) {
          // Walk back N tokens from the paren to find the cluster
          // start, skipping any standalone parentheticals (shouldn't
          // happen mid-cluster but defensive).
          let back = matched.length;
          let cs = j - 1;
          while (cs > i - 1 && back > 0) {
            const t = tokens[cs];
            if (t.startsWith("(") && t.endsWith(")")) {
              break;
            }
            back--;
            if (back === 0) break;
            cs--;
          }
          if (cs >= i && back === 0) {
            clusterStart = cs;
            parenIdx = j;
            pairings = matched;
          }
        }
        break; // first paren in range — stop either way
      }
    }

    // If we found a valid cluster, walk the interlude sequentially up
    // to the cluster start, emit the cluster pairings, emit the paren
    // as plain, advance past it.
    if (clusterStart >= i && parenIdx > clusterStart) {
      // Interlude
      while (i < clusterStart) {
        const iTok = tokens[i];
        if (iTok.startsWith("(") && iTok.endsWith(")")) {
          segments.push({ kind: "plain", text: iTok });
        } else if (
          w < words.length &&
          words[w].strong_number &&
          coreLower(iTok) === (words[w].surface || "").toLowerCase()
        ) {
          segments.push({
            kind: "tappable",
            text: iTok,
            strong: words[w].strong_number as string,
            surface: words[w].surface,
            key: `${keyPrefix}:${words[w].position}`,
          });
          w++;
        } else {
          segments.push({ kind: "plain", text: iTok });
        }
        i++;
      }
      // Cluster pairings — each Hebrew token claims one USFX entry.
      for (let h = 0; h < pairings.length; h++) {
        const hTok = tokens[clusterStart + h];
        const pw = pairings[h];
        segments.push({
          kind: "tappable",
          text: hTok,
          strong: pw.strong_number as string,
          surface: pw.surface,
          key: `${keyPrefix}:${pw.position}`,
        });
        w++;
      }
      // The parenthetical itself — plain orientation text.
      segments.push({ kind: "plain", text: tokens[parenIdx] });
      i = parenIdx + 1;
      continue;
    }

    // No cluster — sequential plain match.
    if (
      w < words.length &&
      words[w].strong_number &&
      coreLower(tok) === (words[w].surface || "").toLowerCase()
    ) {
      segments.push({
        kind: "tappable",
        text: tok,
        strong: words[w].strong_number as string,
        surface: words[w].surface,
        key: `${keyPrefix}:${words[w].position}`,
      });
      w++;
    } else {
      segments.push({ kind: "plain", text: tok });
    }
    i++;
  }

  return segments;
}
