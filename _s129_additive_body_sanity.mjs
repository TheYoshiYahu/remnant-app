// S129 sanity — pure-logic check on the prepareAdditiveBody splitter.
// Re-implements the function in plain JS to mirror the React tsx export
// (no TypeScript transpiler dependency for the sanity walk). Run with:
//
//   node _s129_additive_body_sanity.mjs
//
// Exits 0 on pass, throws on first failure. Mirrors the pure-helper
// sanity standard established in S121 W2 / W3 / S122 / S123 / S125 /
// S126 — when a wheel adds non-trivial pure logic, lock it with a
// node sanity walk.

const ADDITIVE_MARKER = "<!-- additive-from-here -->";

function prepareAdditiveBody(body) {
  if (!body) return null;
  let work = body;
  const leadingH1 = /^\s*#\s+[^\n]*\n+/;
  work = work.replace(leadingH1, "");
  const markerIdx = work.indexOf(ADDITIVE_MARKER);
  if (markerIdx >= 0) {
    work = work.slice(markerIdx + ADDITIVE_MARKER.length);
  }
  work = work.trim();
  return work.length > 0 ? work : null;
}

function eq(label, got, want) {
  if (got !== want) {
    throw new Error(
      `FAIL: ${label}\n  got:  ${JSON.stringify(got)}\n  want: ${JSON.stringify(want)}`
    );
  }
  console.log(`PASS: ${label}`);
}

// (1) Empty / null body → null.
eq("null body", prepareAdditiveBody(null), null);
eq("empty body", prepareAdditiveBody(""), null);
eq("whitespace only", prepareAdditiveBody("   \n  \n"), null);

// (2) Leading H1 gets stripped; rest of body returned unchanged.
eq(
  "strip leading H1",
  prepareAdditiveBody("# Short-form commentary on Matthew 1\n\nMatthew opens the canon with seventeen verses of names."),
  "Matthew opens the canon with seventeen verses of names."
);

// (3) Body without H1 is returned unchanged (no marker).
eq(
  "no H1, no marker — unchanged",
  prepareAdditiveBody("First paragraph of body.\n\nSecond paragraph."),
  "First paragraph of body.\n\nSecond paragraph."
);

// (4) Additive marker present → only the tail is returned.
eq(
  "marker splits — recap dropped",
  prepareAdditiveBody(
    "# Short-form on Matthew 1\n\nRecap paragraph A.\n\nRecap paragraph B.\n\n<!-- additive-from-here -->\n\nNew paragraph C.\n\nNew paragraph D."
  ),
  "New paragraph C.\n\nNew paragraph D."
);

// (5) Marker with no tail content → null (whole body was recap).
eq(
  "marker at end — null",
  prepareAdditiveBody("Recap only.\n\n<!-- additive-from-here -->\n\n"),
  null
);

// (6) Marker at start (no recap above) → tail returned unchanged.
eq(
  "marker at start — tail unchanged",
  prepareAdditiveBody("<!-- additive-from-here -->\n\nTail starts immediately."),
  "Tail starts immediately."
);

// (7) H1 with leading BOM / whitespace still stripped.
eq(
  "H1 with leading whitespace",
  prepareAdditiveBody("   \n# Title here\n\nBody starts now."),
  "Body starts now."
);

// (8) Inline `#` later in a paragraph is NOT stripped (only leading H1).
eq(
  "inline # later in body — not stripped",
  prepareAdditiveBody("Opening sentence.\n\nA second paragraph mentioning #hash inline."),
  "Opening sentence.\n\nA second paragraph mentioning #hash inline."
);

// (9) `##` H2 at start is NOT treated as H1 (renderCommentaryBody splits
//     on `## ` for sub-section headings; we should leave them in place).
eq(
  "leading H2 (## ) — not stripped",
  prepareAdditiveBody("## §1. The genealogy\n\nFirst paragraph."),
  "## §1. The genealogy\n\nFirst paragraph."
);

// (10) Realistic matt-1-short.md-style input with a marker added.
const matt1ShortWithMarker = `# Short-form commentary on Matthew 1

Matthew opens the canon of the New Testament with seventeen verses of names — what the Reformation's preaching tradition has skipped as *the begats.*

The opening sentence sets the structure.

<!-- additive-from-here -->

*The book of the generation of Yahusha HaMashiach (Jesus Christ), the son of David, the son of Avraham (Abraham).* (Matthew 1:1)

Two ancestors, not picked at random. David carries the kingship promise; Avraham (Abraham) carries the seed-promise. The Messiah holds both.`;

const matt1ShortExpected = `*The book of the generation of Yahusha HaMashiach (Jesus Christ), the son of David, the son of Avraham (Abraham).* (Matthew 1:1)

Two ancestors, not picked at random. David carries the kingship promise; Avraham (Abraham) carries the seed-promise. The Messiah holds both.`;

eq("realistic matt-1-short.md with marker", prepareAdditiveBody(matt1ShortWithMarker), matt1ShortExpected);

// (11) Same input WITHOUT marker → full body minus the H1.
const matt1ShortNoMarker = `# Short-form commentary on Matthew 1

Matthew opens the canon with seventeen verses.

The opening sentence sets the structure.`;

eq(
  "realistic matt-1-short.md NO marker — backward compat",
  prepareAdditiveBody(matt1ShortNoMarker),
  "Matthew opens the canon with seventeen verses.\n\nThe opening sentence sets the structure."
);

console.log("\nAll 11 sanity checks passed.");
