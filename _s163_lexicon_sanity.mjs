// S163 (Phase 9.3 — Lexicon) sanity test for app/src/lib/lexicon-helpers.ts.
//
// Inlines a JS port of the helpers — the TS module exports types Node can't
// resolve directly under ESM without bundling. Logic mirrors the .ts file
// 1:1; any divergence between this file and the .ts module is a bug.
//
// Per DESIGN_LANGUAGE.md §26 "Helper API + sanity-test surface":
//   - buildBreadcrumb        : 1-segment / 2-segment / 3-segment / 4+-elision /
//                              empty-stack / source-segment formatting
//   - formatDisclaimer       : each source returns the right disclaimer /
//                              unknown source returns the generic fallback /
//                              disclaimer never returns empty
//   - parseLexiconBodyLinks  : data-strong extracted / data-verse extracted /
//                              mixed-content / nested links / malformed HTML
//   - selectDefaultSource    : Hebrew+BDB / Hebrew+Gesenius-only / Greek+LSJ /
//                              Aramaic+BDB / empty-set
//   - formatCalloutHeader    : term + error / empty error / empty both /
//                              unicode lemma
//
// Run with: node _s163_lexicon_sanity.mjs

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic (port of app/src/lib/lexicon-helpers.ts)
// ─────────────────────────────────────────────────────────────────────

const DISCLAIMERS = {
  bdb:
    "The lexicon below is BDB (Brown-Driver-Briggs, 1906) — a 19th-century " +
    "Christian-era Hebrew scholarship work, preserved as data so you can see " +
    "how the inherited tradition handled the word. The framework's reading " +
    "lives in the verse commentary and in the framework callouts below; where " +
    "the lexicon and the framework diverge, the framework is the standard.",
  lsj:
    "The lexicon below is LSJ (Liddell-Scott-Jones, 1940 — Tyndale-edited from " +
    "the 9th edition), with Abbott-Smith's Manual Greek Lexicon of the New " +
    "Testament (1922) filling in NT-only vocabulary where LSJ has no entry. " +
    "Preserved as data so you can see how the inherited 19th–20th-century " +
    "classical-philological and NT-Greek scholarship handled the word. The " +
    "framework's reading lives in the verse commentary and in the framework " +
    "callouts below; where the lexicon and the framework diverge, the " +
    "framework is the standard.",
  gesenius:
    "The lexicon below is Gesenius (Tregelles 1846 English), a 19th-century " +
    "Christian-era Hebrew scholarship work, preserved as data so you can see " +
    "how the inherited tradition handled the word. The framework's reading " +
    "lives in the verse commentary and in the framework callouts below; where " +
    "the lexicon and the framework diverge, the framework is the standard.",
};

const GENERIC_DISCLAIMER =
  "Source lexicon — preserved as data. The framework's reading lives in the " +
  "verse commentary and in the framework callouts below; where the lexicon " +
  "and the framework diverge, the framework is the standard.";

function formatDisclaimer(source) {
  if (source === "bdb" || source === "lsj" || source === "gesenius") {
    return DISCLAIMERS[source];
  }
  return GENERIC_DISCLAIMER;
}

const MAX_VISIBLE_SEGMENTS = 3;
const SEP = " › ";

function buildBreadcrumb(stack) {
  if (!stack || stack.length === 0) return "";
  const segments = stack.map(
    (seg) =>
      `Strong's ${seg.strong_number} (${seg.lemma})${SEP}${seg.source.toUpperCase()}`,
  );
  if (segments.length <= MAX_VISIBLE_SEGMENTS) {
    return segments.join(SEP);
  }
  const visible = segments.slice(-MAX_VISIBLE_SEGMENTS);
  return `…${SEP}${visible.join(SEP)}`;
}

function selectDefaultSource(language, available) {
  const availSet = available instanceof Set ? available : new Set(available);
  if (availSet.size === 0) return null;
  if (language === "hebrew" || language === "aramaic") {
    if (availSet.has("bdb")) return "bdb";
    if (availSet.has("gesenius")) return "gesenius";
  }
  if (language === "greek") {
    if (availSet.has("lsj")) return "lsj";
  }
  const sorted = Array.from(availSet).sort();
  return sorted[0] ?? null;
}

function formatCalloutHeader(callout) {
  const term = (callout.term_display || "").trim();
  const err = (callout.gloss_error_summary || "").trim();
  if (!term && !err) return "Framework reading";
  if (!err) return `Framework reading · ${term}`;
  if (!term) return `Framework reading · ${err}`;
  return `Framework reading · ${term} · ${err}`;
}

function parseLexiconBodyLinks(html) {
  const result = { verseLinks: [], strongLinks: [], unresolvedCount: 0 };
  if (!html) return result;
  const verseRe = /<a\b[^>]*\bdata-verse="([^"]+)"/g;
  const strongRe = /<a\b[^>]*\bdata-strong="([^"]+)"/g;
  const unresolvedRe = /<span\b[^>]*\bclass="[^"]*\blexicon-unresolved-cite\b[^"]*"/g;
  let m;
  while ((m = verseRe.exec(html)) !== null) {
    result.verseLinks.push({ kind: "verse", target: m[1] });
  }
  while ((m = strongRe.exec(html)) !== null) {
    result.strongLinks.push({ kind: "strong", target: m[1] });
  }
  while ((m = unresolvedRe.exec(html)) !== null) {
    result.unresolvedCount++;
  }
  return result;
}

// ─────────────────────────────────────────────────────────────────────
// Test harness — minimal assert helpers + counters
// ─────────────────────────────────────────────────────────────────────

let pass = 0;
let fail = 0;
const failures = [];

function eq(actual, expected, label) {
  const a = JSON.stringify(actual);
  const e = JSON.stringify(expected);
  if (a === e) {
    pass++;
  } else {
    fail++;
    failures.push(`✗ ${label}\n  expected: ${e}\n  actual:   ${a}`);
  }
}

function truthy(val, label) {
  if (val) pass++;
  else {
    fail++;
    failures.push(`✗ ${label}\n  expected: truthy\n  actual:   ${JSON.stringify(val)}`);
  }
}

function contains(haystack, needle, label) {
  if (typeof haystack === "string" && haystack.includes(needle)) {
    pass++;
  } else {
    fail++;
    failures.push(`✗ ${label}\n  expected: string containing ${JSON.stringify(needle)}\n  actual:   ${JSON.stringify(haystack)}`);
  }
}

// ─────────────────────────────────────────────────────────────────────
// formatDisclaimer — sanity sweep (5 cases)
// ─────────────────────────────────────────────────────────────────────

contains(formatDisclaimer("bdb"), "Brown-Driver-Briggs, 1906", "formatDisclaimer: bdb names source + year");
contains(formatDisclaimer("lsj"), "Liddell-Scott-Jones, 1940", "formatDisclaimer: lsj names source + year");
contains(formatDisclaimer("lsj"), "Abbott-Smith", "formatDisclaimer: lsj names Abbott-Smith NT fallback");
contains(formatDisclaimer("gesenius"), "Tregelles 1846", "formatDisclaimer: gesenius names Tregelles edition");
truthy(formatDisclaimer("unknown-source").length > 50, "formatDisclaimer: unknown source falls back to non-empty generic");

// ─────────────────────────────────────────────────────────────────────
// buildBreadcrumb — sanity sweep (8 cases)
// ─────────────────────────────────────────────────────────────────────

eq(buildBreadcrumb([]), "", "buildBreadcrumb: empty stack returns empty string");
eq(buildBreadcrumb(null), "", "buildBreadcrumb: null stack returns empty string");
eq(buildBreadcrumb(undefined), "", "buildBreadcrumb: undefined stack returns empty string");

eq(
  buildBreadcrumb([{ strong_number: "H0430", lemma: "Elohim", source: "bdb" }]),
  "Strong's H0430 (Elohim) › BDB",
  "buildBreadcrumb: 1-segment renders 'Strong's N (lemma) › SOURCE'",
);

eq(
  buildBreadcrumb([
    { strong_number: "H0430", lemma: "Elohim", source: "bdb" },
    { strong_number: "H0410", lemma: "El", source: "bdb" },
  ]),
  "Strong's H0430 (Elohim) › BDB › Strong's H0410 (El) › BDB",
  "buildBreadcrumb: 2-segment chain joined with separator",
);

eq(
  buildBreadcrumb([
    { strong_number: "G5485", lemma: "charis", source: "lsj" },
    { strong_number: "G2041", lemma: "ergon", source: "lsj" },
    { strong_number: "G3551", lemma: "nomos", source: "lsj" },
  ]),
  "Strong's G5485 (charis) › LSJ › Strong's G2041 (ergon) › LSJ › Strong's G3551 (nomos) › LSJ",
  "buildBreadcrumb: 3-segment chain (at cap) renders without elision",
);

// 4-segment chain triggers `…` elision; leftmost (1st) hides
{
  const out = buildBreadcrumb([
    { strong_number: "G5485", lemma: "charis", source: "lsj" },
    { strong_number: "G2041", lemma: "ergon", source: "lsj" },
    { strong_number: "G3551", lemma: "nomos", source: "lsj" },
    { strong_number: "G3807", lemma: "paidagogos", source: "lsj" },
  ]);
  truthy(out.startsWith("…"), "buildBreadcrumb: 4-segment chain starts with elision marker `…`");
  contains(out, "Strong's G3807 (paidagogos) › LSJ", "buildBreadcrumb: 4-segment chain keeps rightmost (current) segment");
}

// 5-segment chain — elision still hides leftmost overflow
{
  const out = buildBreadcrumb([
    { strong_number: "H0430", lemma: "Elohim", source: "bdb" },
    { strong_number: "H0410", lemma: "El", source: "bdb" },
    { strong_number: "H7307", lemma: "ruach", source: "bdb" },
    { strong_number: "H6918", lemma: "qadosh", source: "bdb" },
    { strong_number: "H8451", lemma: "torah", source: "bdb" },
  ]);
  truthy(out.startsWith("…"), "buildBreadcrumb: 5-segment chain elides with `…` prefix");
}

// ─────────────────────────────────────────────────────────────────────
// selectDefaultSource — sanity sweep (8 cases)
// ─────────────────────────────────────────────────────────────────────

eq(
  selectDefaultSource("hebrew", ["bdb"]),
  "bdb",
  "selectDefaultSource: hebrew + BDB available returns BDB",
);
eq(
  selectDefaultSource("hebrew", ["bdb", "gesenius"]),
  "bdb",
  "selectDefaultSource: hebrew + both BDB and Gesenius returns BDB (BDB primary per §26 Gate #2)",
);
eq(
  selectDefaultSource("hebrew", ["gesenius"]),
  "gesenius",
  "selectDefaultSource: hebrew + only Gesenius returns Gesenius (BDB-missing fallback)",
);
eq(
  selectDefaultSource("greek", ["lsj"]),
  "lsj",
  "selectDefaultSource: greek + LSJ returns LSJ",
);
eq(
  selectDefaultSource("aramaic", ["bdb"]),
  "bdb",
  "selectDefaultSource: aramaic + BDB returns BDB (BDB covers Aramaic per §26)",
);
eq(
  selectDefaultSource("hebrew", []),
  null,
  "selectDefaultSource: empty available returns null (empty-state)",
);
eq(
  selectDefaultSource("greek", new Set([])),
  null,
  "selectDefaultSource: empty Set returns null",
);
eq(
  selectDefaultSource("greek", new Set(["lsj"])),
  "lsj",
  "selectDefaultSource: accepts Set as well as array input",
);

// ─────────────────────────────────────────────────────────────────────
// formatCalloutHeader — sanity sweep (5 cases)
// ─────────────────────────────────────────────────────────────────────

eq(
  formatCalloutHeader({
    term_display: "charis",
    gloss_error_summary: "The Reformation grace-against-law reading",
  }),
  "Framework reading · charis · The Reformation grace-against-law reading",
  "formatCalloutHeader: term + error composed correctly",
);
eq(
  formatCalloutHeader({ term_display: "torah", gloss_error_summary: "" }),
  "Framework reading · torah",
  "formatCalloutHeader: empty error collapses to just term",
);
eq(
  formatCalloutHeader({ term_display: "", gloss_error_summary: "" }),
  "Framework reading",
  "formatCalloutHeader: both empty returns the bare label",
);
eq(
  formatCalloutHeader({ term_display: "ἅγιος", gloss_error_summary: "Generic holy" }),
  "Framework reading · ἅγιος · Generic holy",
  "formatCalloutHeader: unicode-safe Greek lemma",
);
eq(
  formatCalloutHeader({ term_display: "תּוֹרָה", gloss_error_summary: "Curse / burden gloss" }),
  "Framework reading · תּוֹרָה · Curse / burden gloss",
  "formatCalloutHeader: unicode-safe Hebrew lemma with niqqud",
);

// ─────────────────────────────────────────────────────────────────────
// parseLexiconBodyLinks — sanity sweep (10 cases)
// ─────────────────────────────────────────────────────────────────────

eq(parseLexiconBodyLinks("").verseLinks.length, 0, "parseLexiconBodyLinks: empty string returns no links");
eq(parseLexiconBodyLinks(null).verseLinks.length, 0, "parseLexiconBodyLinks: null returns empty result");
eq(parseLexiconBodyLinks(undefined).strongLinks.length, 0, "parseLexiconBodyLinks: undefined returns empty result");

{
  const out = parseLexiconBodyLinks('<a class="bdb-citation" data-verse="genesis-1:1">Gen 1:1</a>');
  eq(out.verseLinks, [{ kind: "verse", target: "genesis-1:1" }], "parseLexiconBodyLinks: single data-verse extracted");
}

{
  const out = parseLexiconBodyLinks(
    '<a class="bdb-cross-lemma" data-strong="H0410"><span class="bdb-hebrew">אֵל</span></a>',
  );
  eq(
    out.strongLinks,
    [{ kind: "strong", target: "H0410" }],
    "parseLexiconBodyLinks: data-strong extracted from anchor with nested span (typical BDB cross-lemma)",
  );
}

{
  const out = parseLexiconBodyLinks(
    'prose <a data-verse="job-8:12">Jb 8:12</a> more prose ' +
      '<a data-strong="H0430">Elohim</a> tail',
  );
  eq(out.verseLinks.length, 1, "parseLexiconBodyLinks: mixed content extracts verse link");
  eq(out.strongLinks.length, 1, "parseLexiconBodyLinks: mixed content extracts strong link");
  eq(out.verseLinks[0].target, "job-8:12", "parseLexiconBodyLinks: verse target preserved in mixed content");
  eq(out.strongLinks[0].target, "H0430", "parseLexiconBodyLinks: strong target preserved in mixed content");
}

{
  const out = parseLexiconBodyLinks(
    '<span class="lexicon-unresolved-cite" title="LXX.Sir.42.14">Sir 42:14</span>',
  );
  eq(out.unresolvedCount, 1, "parseLexiconBodyLinks: unresolved-cite span counted");
}

{
  // Multiple unresolved spans across the body
  const out = parseLexiconBodyLinks(
    '<span class="lexicon-unresolved-cite">x</span> mid ' +
      '<span class="other-class lexicon-unresolved-cite muted">y</span>',
  );
  eq(out.unresolvedCount, 2, "parseLexiconBodyLinks: counts multiple unresolved spans even with extra classes");
}

{
  // Sequence: verse, strong, verse — order preserved
  const out = parseLexiconBodyLinks(
    '<a data-verse="genesis-1:1">a</a><a data-strong="H0001">b</a><a data-verse="exodus-3:14">c</a>',
  );
  eq(
    out.verseLinks.map((l) => l.target),
    ["genesis-1:1", "exodus-3:14"],
    "parseLexiconBodyLinks: verse links in DOM order",
  );
}

{
  // Malformed HTML — defensive: extract what we can; never throw
  const out = parseLexiconBodyLinks(
    '<a data-verse="genesis-1:1">unclosed and <a data-strong="H8451">ok</a>',
  );
  truthy(out.verseLinks.length >= 1, "parseLexiconBodyLinks: malformed HTML still extracts the data-verse target");
  truthy(out.strongLinks.length >= 1, "parseLexiconBodyLinks: malformed HTML still extracts the data-strong target");
}

// ─────────────────────────────────────────────────────────────────────
// Composition sweeps — realistic body_html stress test (4 cases)
// ─────────────────────────────────────────────────────────────────────

const REAL_BDB_SAMPLE =
  '<div class="bdb-body"><span class="bdb-hebrew">תּוֹרָה</span> ' +
  '<span class="bdb-pos">n.f</span>. <em class="bdb-def">direction</em>, ' +
  '<em class="bdb-def">instruction</em>, <em class="bdb-def">law</em>' +
  '<a class="bdb-citation" data-verse="genesis-26:5">Gn 26:5</a>; ' +
  '<a class="bdb-citation" data-verse="exodus-12:49">Ex 12:49</a>; ' +
  '<a class="bdb-cross-lemma" data-strong="H3384">' +
  '<span class="bdb-hebrew">יָרָה</span></a>' +
  '<span class="lexicon-unresolved-cite" title="Sir 17.11">Sir 17:11</span>' +
  '</div>';

{
  const out = parseLexiconBodyLinks(REAL_BDB_SAMPLE);
  eq(out.verseLinks.length, 2, "parseLexiconBodyLinks: realistic BDB body extracts both verse links");
  eq(out.strongLinks.length, 1, "parseLexiconBodyLinks: realistic BDB body extracts the cross-lemma link");
  eq(out.unresolvedCount, 1, "parseLexiconBodyLinks: realistic BDB body counts the unresolved cite");
  eq(out.verseLinks[0].target, "genesis-26:5", "parseLexiconBodyLinks: realistic body preserves first verse target");
}

// ─────────────────────────────────────────────────────────────────────
// Cross-helper composition (final 2 cases)
// ─────────────────────────────────────────────────────────────────────

{
  // Composition: a Hebrew word with BDB + a callout — exercise selectDefaultSource +
  // formatCalloutHeader + buildBreadcrumb in concert.
  const source = selectDefaultSource("hebrew", new Set(["bdb"]));
  const breadcrumb = buildBreadcrumb([
    { strong_number: "H8451", lemma: "torah", source: source ?? "bdb" },
  ]);
  const calloutTitle = formatCalloutHeader({
    term_display: "torah",
    gloss_error_summary: "Curse / burden gloss",
  });
  eq(source, "bdb", "composition: hebrew + BDB resolves to bdb");
  eq(breadcrumb, "Strong's H8451 (torah) › BDB", "composition: breadcrumb composed from selected source");
  eq(
    calloutTitle,
    "Framework reading · torah · Curse / burden gloss",
    "composition: callout title composed",
  );
}

// ─────────────────────────────────────────────────────────────────────
// Summary
// ─────────────────────────────────────────────────────────────────────

console.log(`\n${pass} passed · ${fail} failed`);
if (fail > 0) {
  console.log(failures.join("\n\n"));
  process.exit(1);
}
console.log("All sanity checks passed.");
