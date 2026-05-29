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

  // Re-group SHORT multi-token parentheticals (≤ LONG_PAREN_CAP words)
  // into single tokens so the sacred-name cluster detection sees them
  // as units — "(the LORD God)" needs to be one token for parenContents
  // to fire. LONG translator-style parentheticals like
  // "(For all the Athenians and strangers which were there...)" used
  // to be re-grouped too, which made them opaque to the alignment walk
  // and dropped every Strong's inside. S161 Part 2.1 caps re-grouping
  // so long parens stay as individual tokens and align normally; only
  // the bracket tokens "(" and ")" themselves become plain segments.
  const LONG_PAREN_CAP = 5;
  const out: string[] = [];
  let i = 0;
  while (i < raw.length) {
    const t = raw[i];
    if (t.startsWith("(") && !t.includes(")")) {
      // Scan forward to the closing ")" token to measure the paren's
      // total length in tokens.
      let endIdx = i + 1;
      while (endIdx < raw.length && !raw[endIdx].includes(")")) {
        endIdx++;
      }
      const tokensInParen = endIdx - i + 1;
      if (endIdx < raw.length && tokensInParen <= LONG_PAREN_CAP) {
        // Short paren — re-group into one token so cluster detection
        // sees the parenthetical as a unit.
        out.push(raw.slice(i, endIdx + 1).join(" "));
        i = endIdx + 1;
      } else {
        // Long paren OR unclosed — emit each token individually.
        // The alignment walk handles them as normal tokens; only the
        // opening "(For" / closing "...arm;)" brackets render as
        // plain segments (no Strong's), but everything inside aligns.
        out.push(t);
        i++;
      }
    } else {
      out.push(t);
      i++;
    }
  }
  return out;
}

/**
 * True for a token that is (a) a parenthetical and (b) at most has
 * trailing sentence punctuation after the closing ")".
 *
 *   isParenToken("(God)")    → true
 *   isParenToken("(LORD),")  → true   ← trailing comma; was the S148 bug
 *   isParenToken("(LORD).")  → true
 *   isParenToken("(God)?")   → true
 *   isParenToken("Yahuah")   → false
 *   isParenToken("(broken")  → false  (no closing ")")
 *
 * Bug locked at S148 (caught by Yoshi on Malachi 3 — `(Lord),` and
 * `(LORD).` were rendering through the tappable-Strong's path because
 * the strict `endsWith(")")` check rejected them, and the fallback
 * sequential match's coreLower stripped the parens + punctuation to
 * "lord" and paired the whole token with the next USFX surface. Result:
 * the parens rendered inside `<span class="word-tappable">`, where the
 * S144 parentheticals-strip toggle (which only applies to plain
 * segments) could not reach them. The fix is to allow trailing
 * punctuation here so the standalone-paren path recognizes these
 * tokens and emits them plain — then the strip toggle works as
 * designed.
 */
function isParenToken(token: string): boolean {
  return /^\([^)]*\)[.,;:!?]*$/.test(token);
}

/**
 * Returns the set of lowercased core surfaces inside a parenthetical
 * token. "(God)" → {"god"}; "(the LORD God)" → {"the", "lord", "god"}.
 * Trailing sentence punctuation after the closing ")" is ignored
 * (S148): "(God)?" → {"god"}; "(LORD)," → {"lord"}.
 * Used by cluster detection to test "does this paren contain the next
 * USFX surface?"
 */
function parenContents(token: string): string[] {
  if (!isParenToken(token)) return [];
  const m = token.match(/^\(([^)]*)\)/);
  if (!m) return [];
  return m[1].split(/\s+/).map(coreLower).filter((s) => s.length > 0);
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
    // hitting the paren at the cursor first.) S148: allow trailing
    // sentence punctuation via isParenToken — `(Lord),` and `(LORD).`
    // must also route to the plain-segment path so the strip toggle
    // can reach them.
    if (isParenToken(tok)) {
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
    let pairingParenWords: string[] = []; // S161 Part 2.2 — track each pairing's
                                          // paren-content word for Hebrew-aware reorder.
    for (let j = i; j < Math.min(i + 6, tokens.length); j++) {
      const cand = tokens[j];
      if (isParenToken(cand)) {
        const contents = parenContents(cand);
        let tempW = w;
        const matched: VerseWordInput[] = [];
        const matchedParenWords: string[] = [];
        for (const pw of contents) {
          if (
            tempW < words.length &&
            words[tempW].strong_number &&
            pw === (words[tempW].surface || "").toLowerCase()
          ) {
            matched.push(words[tempW]);
            matchedParenWords.push(pw);
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
            if (isParenToken(t)) {
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
            pairingParenWords = matchedParenWords;
          }
        }
        break; // first paren in range — stop either way
      }
    }

    // S161 Part 2.2 — Hebrew-aware cluster reordering.
    // The cluster pairs surfaces to Hebrew tokens POSITIONALLY by default
    // (pairings[0] → tokens[clusterStart+0], etc.). This works when Hebrew
    // and English word order align (Yahuah Elohim ↔ the LORD God, Yahuah
    // Tseva'ot ↔ LORD of hosts — same positional order).
    //
    // BUT Hebrew adj-after-noun reverses against English adj-before-noun
    // for Ruach HaKodesh ↔ Holy Spirit: positional pairing would attach
    // Ruach (Spirit) to G0040 (Holy) and HaKodesh (the Holy) to G4151
    // (Spirit) — semantically inverted. The HEBREW_PAIRING_HINTS map
    // overrides positional pairing where the framework knows the correct
    // Hebrew-to-paren-content mapping. Only fires for known Hebrew
    // tokens; falls through to positional for everything else.
    if (clusterStart >= 0 && pairings.length > 1) {
      const HEBREW_PAIRING_HINTS: Record<string, string> = {
        Ruach: "spirit",
        HaKodesh: "holy",
      };
      let anyHinted = false;
      const candidateReorder: Array<VerseWordInput | null> = pairings.map(
        () => null
      );
      const usedPairingIdx = new Set<number>();
      for (let h = 0; h < pairings.length; h++) {
        const hTok = tokens[clusterStart + h];
        const hKey = hTok.replace(/['’]s$/i, "");
        const hint = HEBREW_PAIRING_HINTS[hKey];
        if (!hint) continue;
        anyHinted = true;
        for (let p = 0; p < pairings.length; p++) {
          if (usedPairingIdx.has(p)) continue;
          if (pairingParenWords[p] === hint) {
            candidateReorder[h] = pairings[p];
            usedPairingIdx.add(p);
            break;
          }
        }
      }
      if (anyHinted) {
        // Fill any unhinted slots with the remaining pairings in original
        // order to preserve attribution for non-Hebrew Hebrew-side tokens
        // (defensive — current hint map covers the only known case).
        let p = 0;
        for (let h = 0; h < candidateReorder.length; h++) {
          if (candidateReorder[h] === null) {
            while (p < pairings.length && usedPairingIdx.has(p)) p++;
            if (p < pairings.length) {
              candidateReorder[h] = pairings[p];
              usedPairingIdx.add(p);
              p++;
            }
          }
        }
        // If every slot is filled, commit the reorder.
        if (candidateReorder.every((x) => x !== null)) {
          pairings = candidateReorder as VerseWordInput[];
        }
      }
    }

    // If we found a valid cluster, walk the interlude sequentially up
    // to the cluster start, emit the cluster pairings, emit the paren
    // as plain, advance past it.
    if (clusterStart >= i && parenIdx > clusterStart) {
      // Interlude
      while (i < clusterStart) {
        const iTok = tokens[i];
        if (isParenToken(iTok)) {
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

    // No cluster — sequential match. Two extensions to the original
    // single-token-vs-single-surface match landed at S161 alongside
    // the verse_words.surface re-modernization pass:
    //
    //   (a) MULTI-WORD SURFACE MATCH. USFX sometimes wraps a multi-
    //   word display phrase under a single Strong's tag — e.g.,
    //   <w s="G2309">wilt thou</w> in Matthew 20:21, which S149
    //   modernized in the verse text to "will you" (and the S161
    //   re-modernization pass updated the surface to match). When
    //   words[w].surface contains a space we try to match it
    //   against the concatenated next N displayed tokens before
    //   falling back to single-word. The whole multi-token range
    //   emits as ONE tappable span (one superscript, one tap target).
    //
    //   (b) CURSOR-ADVANCE ON MISMATCH (single-step orphan skip).
    //   The original algorithm sticks the USFX cursor `w` whenever
    //   a displayed token fails to match the current surface, then
    //   silently drops every subsequent surface (the S161 cascade).
    //   After Part 1 the common cause (modernization mismatch) is
    //   gone, but parenthetical-protected words and rare punctuation/
    //   spacing drift can still produce orphan surfaces. When this
    //   happens we peek words[w+1] — if the current displayed token
    //   matches that NEXT surface, we skip the orphan and emit the
    //   match instead of cascading. Bounded to a single step to
    //   avoid false alignment to coincidentally-matching distant
    //   surfaces.

    // (a) Multi-word surface match — try before single-word.
    if (
      w < words.length &&
      words[w].strong_number &&
      (words[w].surface || "").includes(" ")
    ) {
      const surfaceParts = (words[w].surface || "")
        .toLowerCase()
        .split(/\s+/)
        .filter((s) => s.length > 0);
      if (
        surfaceParts.length > 1 &&
        i + surfaceParts.length <= tokens.length
      ) {
        let allMatch = true;
        for (let k = 0; k < surfaceParts.length; k++) {
          const t = tokens[i + k];
          if (isParenToken(t) || coreLower(t) !== surfaceParts[k]) {
            allMatch = false;
            break;
          }
        }
        if (allMatch) {
          const combined = tokens
            .slice(i, i + surfaceParts.length)
            .join(" ");
          segments.push({
            kind: "tappable",
            text: combined,
            strong: words[w].strong_number as string,
            surface: words[w].surface,
            key: `${keyPrefix}:${words[w].position}`,
          });
          w++;
          i += surfaceParts.length;
          continue;
        }
      }
    }

    // Single-word match.
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
      i++;
      continue;
    }

    // (b) Cursor-advance on mismatch — single-step orphan skip.
    if (
      w + 1 < words.length &&
      words[w + 1].strong_number &&
      coreLower(tok) === (words[w + 1].surface || "").toLowerCase()
    ) {
      w++; // skip orphan
      segments.push({
        kind: "tappable",
        text: tok,
        strong: words[w].strong_number as string,
        surface: words[w].surface,
        key: `${keyPrefix}:${words[w].position}`,
      });
      w++;
      i++;
      continue;
    }

    // Fallback — emit plain.
    segments.push({ kind: "plain", text: tok });
    i++;
  }

  return segments;
}
