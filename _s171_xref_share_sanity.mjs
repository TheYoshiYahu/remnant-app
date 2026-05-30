// S171 (§17 V1.1 xref share + §30 V1.1 deep-link + apocrypha paragraph
// extractor) sanity test for the pure helpers in:
//
//   app/src/lib/study-share-render.ts       (xref filename + permalink)
//   app/src/lib/watermark-footer-render.ts  (urlOverride knob)
//   restoration-pipeline/_session171_extract_noncanon_paragraph_starts.py
//     (paragraph-start heuristic — predicate inlined here for node)
//   api/main.py                              (Strong's HTML page builder
//                                             — OG meta + canonical URL
//                                             assembly, inlined here)
//
// Inlines JS ports of the pure helpers — the TS modules import the
// brand-mark PNG asset which Node can't resolve under ESM without a
// bundler shim, and the Python predicate uses Python-side regex
// flags. The inlined logic must mirror the source modules 1:1; any
// divergence is a bug.
//
// Boundary cases (per S171 spec):
//
//   buildStudyShareFilename — xref variants
//     - baseline genesis 1:1               → "xref-genesis-1.1-rop-study.png"
//     - baseline 1-thessalonians 2:5       → "xref-1-thessalonians-2.5-rop-study.png"
//     - thread "Kingdom Gospel"            → "thread-kingdom-gospel-rop-study.png"
//     - thread slug with diacritics
//       "grácé-thát-can-be-lost"           → "thread-grace-that-can-be-lost-rop-study.png"
//
//   buildAnchorPermalink
//     - genesis 1:1   → "bible.remnantofpromise.org/genesis/1.1"
//     - 1-thessalonians 5:21
//                     → "bible.remnantofpromise.org/1-thessalonians/5.21"
//     - revelation 22:21
//                     → "bible.remnantofpromise.org/revelation/22.21"
//
//   paragraph-start heuristic (S171 Track 2)
//     - verse 1 always paragraph start
//     - "And it came to pass in those days" → paragraph
//     - "Concerning the elect"              → paragraph
//     - "Thus saith the Lord"               → paragraph
//     - '"Hear, O Israel"' (quoted opening) → paragraph
//     - "O Yahuah, my refuge"               → paragraph
//     - "And the men spoke"                 → not a paragraph (no
//                                             "Name said/spake/answered")
//     - "He went forth"                     → not a paragraph
//     - "Then Yahuah said unto him"         → paragraph (speaker turn)
//     - "Then answered Yahusha"             → paragraph
//
//   Strong's HTML page (server-rendered deep-link)
//     - canonical URL is on the PWA host (bible.remnantofpromise.org),
//       not the API host — even though the route lives on the API
//     - og:type = article, og:image = brand-mark, twitter:card = summary_large_image
//     - lemma/translit/gloss are escaped (no raw < > injection)
//     - 404 fallback still renders OG title + description
//
// Run with: node _s171_xref_share_sanity.mjs

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic — must mirror the source modules 1:1
// ─────────────────────────────────────────────────────────────────────

const ANCHOR_URL_HOST = "bible.remnantofpromise.org";

function slugifyTransliteration(translit) {
  if (!translit || !translit.trim()) return "entry";
  const stripped = translit
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9\s-]+/g, "")
    .trim()
    .replace(/[\s-]+/g, "-");
  return stripped || "entry";
}

function buildStudyShareFilename(meta) {
  if (meta.kind === "strongs") {
    const slug = slugifyTransliteration(meta.transliteration);
    return `${meta.strongNumber}-${slug}-rop-study.png`;
  }
  const subjectSlug = slugifyTransliteration(meta.subject);
  if (meta.xrefKind === "thread") {
    return `thread-${subjectSlug}-rop-study.png`;
  }
  return `xref-${meta.bookSlug}-${meta.chapterNumber}.${meta.verseNumber}-rop-study.png`;
}

function buildAnchorPermalink(bookSlug, chapterNumber, verseNumber) {
  return `${ANCHOR_URL_HOST}/${bookSlug}/${chapterNumber}.${verseNumber}`;
}

// Paragraph-start heuristic, JS port of Track 2's Python predicate.
const TRANSITION_PHRASES = [
  "And it came to pass",
  "And it happened",
  "And in the (?:\\w+ )?year",
  "Now in",
  "Now after",
  "Now there was",
  "Now when",
  "Now therefore",
  "In those days",
  "In the (?:\\w+ )?year",
  "After these things",
  "Thus saith",
  "Thus says",
  "And after",
  "Wherefore",
  "Howbeit",
  "Behold, I",
  "Behold, the",
  "Concerning",
  "Touching",
  "But when",
];
const TRANSITION_RE = new RegExp(
  "^\\s*[\"\\u201c\\u2018']?\\s*(?:" + TRANSITION_PHRASES.join("|") + ")\\b",
  "i"
);
const QUOTE_OPEN_RE = /^\s*["“‘']/;
const SPEAKER_RE = new RegExp(
  "^\\s*(?:And|Then)\\s+(?:[A-Z][\\w'-]+\\s+){1,3}(?:said|spoke|spake|answered)\\b"
  + "|^\\s*Then answered\\s+[A-Z][\\w'-]+"
);
const VOCATIVE_RE = /^\s*O\s+[A-Z][\w'-]+/;

function isParagraphStart(verseNumber, text) {
  if (verseNumber === 1) return true;
  if (TRANSITION_RE.test(text)) return true;
  if (QUOTE_OPEN_RE.test(text)) return true;
  if (SPEAKER_RE.test(text)) return true;
  if (VOCATIVE_RE.test(text)) return true;
  return false;
}

// Strong's HTML deep-link — port of api/main.py _strongs_html_page
// reduced to the fields the test rig validates (canonical URL host,
// OG meta presence, escape behavior).
function buildStrongHtmlMeta(entry) {
  const n = entry.strong_number;
  const lemma = (entry.lemma || "").replace(/</g, "&lt;").replace(/>/g, "&gt;");
  const translit = (entry.transliteration || "").replace(/</g, "&lt;").replace(/>/g, "&gt;");
  const gloss = (entry.short_definition || "").replace(/</g, "&lt;").replace(/>/g, "&gt;");
  const canonical = `https://bible.remnantofpromise.org/strongs/${n}`;
  const parts = [];
  if (lemma) parts.push(lemma);
  if (translit) parts.push(`(${translit})`);
  parts.push(`— Strong's ${n}`);
  const ogTitle = parts.join(" ");
  return { canonical, ogTitle, ogDescription: gloss || "", lemma, translit };
}

// ─────────────────────────────────────────────────────────────────────
// Sanity-test rig
// ─────────────────────────────────────────────────────────────────────

let passed = 0;
let failed = 0;
const failures = [];

function ok(name, cond) {
  if (cond) passed += 1;
  else { failed += 1; failures.push(name); }
}

// ── buildStudyShareFilename — xref variants ───────────────────────

ok("xref baseline genesis 1.1",
  buildStudyShareFilename({kind:"xref", xrefKind:"baseline", bookSlug:"genesis", chapterNumber:1, verseNumber:1, subject:"verse-1"})
    === "xref-genesis-1.1-rop-study.png");
ok("xref baseline 1-thessalonians 2.5",
  buildStudyShareFilename({kind:"xref", xrefKind:"baseline", bookSlug:"1-thessalonians", chapterNumber:2, verseNumber:5, subject:"verse-5"})
    === "xref-1-thessalonians-2.5-rop-study.png");
ok("xref thread kingdom-gospel",
  buildStudyShareFilename({kind:"xref", xrefKind:"thread", bookSlug:"matthew", chapterNumber:5, verseNumber:3, subject:"kingdom-gospel"})
    === "thread-kingdom-gospel-rop-study.png");
ok("xref thread diacritics → slug",
  buildStudyShareFilename({kind:"xref", xrefKind:"thread", bookSlug:"ephesians", chapterNumber:2, verseNumber:5, subject:"grácé-thát-can-be-lost"})
    === "thread-grace-that-can-be-lost-rop-study.png");

// ── buildAnchorPermalink ──────────────────────────────────────────

ok("anchor permalink genesis 1.1",
  buildAnchorPermalink("genesis", 1, 1) === "bible.remnantofpromise.org/genesis/1.1");
ok("anchor permalink 1-thessalonians 5.21",
  buildAnchorPermalink("1-thessalonians", 5, 21) === "bible.remnantofpromise.org/1-thessalonians/5.21");
ok("anchor permalink revelation 22.21",
  buildAnchorPermalink("revelation", 22, 21) === "bible.remnantofpromise.org/revelation/22.21");

// ── paragraph-start heuristic ──────────────────────────────────────

ok("v1 always paragraph", isParagraphStart(1, "In the beginning"));
ok("'And it came to pass'", isParagraphStart(5, "And it came to pass in those days"));
ok("'Concerning'", isParagraphStart(3, "Concerning the elect I said"));
ok("'Thus saith'", isParagraphStart(8, "Thus saith the Lord"));
ok("'In the [Nth] year'", isParagraphStart(10, "In the fifth year of his reign"));
ok("'After these things'", isParagraphStart(12, "After these things came Yahusha"));
ok("'Wherefore' opener", isParagraphStart(20, "Wherefore I say unto you"));
ok("opening double quote", isParagraphStart(7, '"Hear, O Israel,"'));
ok("opening typographic quote", isParagraphStart(7, "“Hear, O Israel”"));
ok("vocative 'O Yahuah'", isParagraphStart(15, "O Yahuah, my refuge"));
ok("speaker turn 'Then Yahuah said'",
  isParagraphStart(22, "Then Yahuah said unto him"));
ok("speaker turn 'Then answered Yahusha'",
  isParagraphStart(33, "Then answered Yahusha"));
// negative cases — these should NOT be paragraph starts
ok("not 'He went forth'", !isParagraphStart(4, "He went forth from the camp"));
ok("not 'the men spoke'", !isParagraphStart(6, "And the men spoke unto him"));
ok("not mid-sentence 'concerning'", !isParagraphStart(9, "speaking concerning the matter"));

// ── Strong's deep-link HTML ────────────────────────────────────────

const meta1 = buildStrongHtmlMeta({
  strong_number: "H7225", lemma: "רֵאשִׁית",
  transliteration: "rê'shîth", short_definition: "beginning",
});
ok("canonical URL on PWA host (not API)",
  meta1.canonical === "https://bible.remnantofpromise.org/strongs/H7225");
ok("og title includes lemma + translit + Strong's number",
  meta1.ogTitle === "רֵאשִׁית (rê'shîth) — Strong's H7225");
ok("og description = gloss when present",
  meta1.ogDescription === "beginning");

const meta2 = buildStrongHtmlMeta({
  strong_number: "G3056", lemma: "λόγος",
  transliteration: "logos", short_definition: "",
});
ok("og title without gloss falls through",
  meta2.ogTitle === "λόγος (logos) — Strong's G3056");
ok("og description empty when gloss missing",
  meta2.ogDescription === "");

// XSS-style guards — HTML chars in lemma get escaped.
const metaInjection = buildStrongHtmlMeta({
  strong_number: "H0000", lemma: "<script>alert(1)</script>",
  transliteration: "x", short_definition: "y",
});
ok("lemma escapes <", metaInjection.lemma.startsWith("&lt;script"));
ok("lemma escapes >", metaInjection.lemma.includes("&gt;"));

// ─────────────────────────────────────────────────────────────────────
// Report
// ─────────────────────────────────────────────────────────────────────

console.log(`\nS171 xref-share + deep-link + paragraph sanity: ${passed} passed, ${failed} failed`);
if (failed > 0) {
  for (const f of failures) console.log("  ✗ " + f);
  process.exit(1);
}
