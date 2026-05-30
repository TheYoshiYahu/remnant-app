// S170 (§30 Shareable Study-Modal Exports + §24 watermark back-edit)
// sanity test for the pure helpers in:
//
//   app/src/lib/watermark-footer-render.ts
//   app/src/lib/study-share-render.ts
//
// Inlines JS ports of the pure helpers — the TS modules import the
// brand-mark PNG asset which Node can't resolve under ESM without a
// bundler shim, and import html2canvas which requires the DOM. The
// inlined logic must mirror the .ts modules 1:1; any divergence is a
// bug.
//
// Boundary cases (per DESIGN_LANGUAGE.md §30 + the post-S121 W2 / W3
// / S122 / S123 / S125 / S127 forward standard):
//
//   computeFooterGeometry (watermark-footer-render.ts)
//     - 1080×1920 (§30 study-share)  → band 384 tall, divider at 1536,
//                                       icon at (54, 1668) size 120×120,
//                                       icon src rect (0, 208, 832, 832),
//                                       wordmark center 540
//     - 1080×1350 (§24 verse-share)  → band 270 tall, divider at 1080,
//                                       icon at (54, 1095) size 120×120
//     - 2160×3840 (2× retina)        → band 768 tall, icon at (108, 3336)
//     - tiny edge case 100×100       → band 20 tall (icon spills above-
//                                       band, that's fine — caller is
//                                       responsible for using sensible
//                                       dimensions)
//     - footer band always = H × 0.20 exactly
//     - icon size always = 120 (absolute px, theme-invariant per §170)
//
//   slugifyTransliteration (study-share-render.ts)
//     - plain ASCII "logos"             → "logos"
//     - mixed case "Logos"              → "logos"
//     - Hebrew translit "rê'shîth"      → "reshith"
//     - Greek translit with circumflex
//       "lógos"                          → "logos"
//     - spaces "ben adam"               → "ben-adam"
//     - punctuation "a.b,c!"            → "abc"
//     - empty string                    → "entry"
//     - whitespace only "   "           → "entry"
//     - hyphens "abi-shalom"            → "abi-shalom"
//     - mixed whitespace/hyphen runs
//       "abi - shalom"                  → "abi-shalom"
//
//   buildStudyShareFilename (study-share-render.ts)
//     - "H7225" + "rê'shîth"            → "H7225-reshith-rop-study.png"
//     - "G3056" + "logos"               → "G3056-logos-rop-study.png"
//     - "H0001" + ""                    → "H0001-entry-rop-study.png"
//     - "G2424" + "Iēsoũs"              → "G2424-iesous-rop-study.png"
//
//   buildLexiconDeeplinkText (study-share-render.ts)
//     - bdb source                       → "Full BDB entry at .../H7225"
//     - lsj source                       → "Full LSJ entry at .../G3056"
//     - strongs source                   → "Full lexicon entry at .../G3056"
//     - undefined source                 → "Full lexicon entry at .../H0001"
//
// Run with: node _s170_study_share_sanity.mjs

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic — must mirror the .ts modules 1:1
// ─────────────────────────────────────────────────────────────────────

const FOOTER_PCT = 0.20;
const ICON_SIZE = 120;
const ICON_LEFT_INSET_PCT = 0.05;
const DIVIDER_INSET_PCT = 0.06;
const WORDMARK_LINE_1_SIZE = 36;
const WORDMARK_LINE_2_SIZE = 24;
const WORDMARK_LINE_3_SIZE = 22;
const WORDMARK_LINE_GAP = 6;
const SRC_W = 832;
const SRC_H = 1248;

const STRONGS_URL_BASE = "bible.remnantofpromise.org/strongs";

function computeFooterGeometry(W, H) {
  const bandHeight = H * FOOTER_PCT;
  const bandTop = H - bandHeight;
  const bandMidY = bandTop + bandHeight / 2;

  const dividerInset = W * DIVIDER_INSET_PCT;
  const divider = { x1: dividerInset, x2: W - dividerInset, y: bandTop };

  const iconX = W * ICON_LEFT_INSET_PCT;
  const iconY = bandMidY - ICON_SIZE / 2;
  const iconRect = { x: iconX, y: iconY, w: ICON_SIZE, h: ICON_SIZE };

  const sCropTop = (SRC_H - SRC_W) / 2;
  const iconSrcRect = { sx: 0, sy: sCropTop, sw: SRC_W, sh: SRC_W };

  const stackHeight =
    WORDMARK_LINE_1_SIZE +
    WORDMARK_LINE_GAP +
    WORDMARK_LINE_2_SIZE +
    WORDMARK_LINE_GAP +
    WORDMARK_LINE_3_SIZE;
  const stackTop = bandMidY - stackHeight / 2;
  const line1Y = stackTop + WORDMARK_LINE_1_SIZE;
  const line2Y = line1Y + WORDMARK_LINE_GAP + WORDMARK_LINE_2_SIZE;
  const line3Y = line2Y + WORDMARK_LINE_GAP + WORDMARK_LINE_3_SIZE;

  return {
    bandTop,
    bandHeight,
    divider,
    iconRect,
    iconSrcRect,
    wordmark: { centerX: W / 2, line1Y, line2Y, line3Y },
  };
}

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

function buildStudyShareFilename(strongNumber, transliteration) {
  const slug = slugifyTransliteration(transliteration);
  return `${strongNumber}-${slug}-rop-study.png`;
}

function buildLexiconDeeplinkText(strongNumber, source) {
  const label =
    source === "bdb" ? "BDB" : source === "lsj" ? "LSJ" : "lexicon";
  return `Full ${label} entry at ${STRONGS_URL_BASE}/${strongNumber}`;
}

// ─────────────────────────────────────────────────────────────────────
// Sanity-test rig
// ─────────────────────────────────────────────────────────────────────

let passed = 0;
let failed = 0;
const failures = [];

function ok(name, cond) {
  if (cond) {
    passed += 1;
  } else {
    failed += 1;
    failures.push(name);
  }
}

function approx(a, b, eps = 0.001) {
  return Math.abs(a - b) <= eps;
}

// ── computeFooterGeometry ──────────────────────────────────────────

const g30 = computeFooterGeometry(1080, 1920);
ok("§30 1080×1920 band height = 384", approx(g30.bandHeight, 384));
ok("§30 1080×1920 band top = 1536", approx(g30.bandTop, 1536));
ok("§30 1080×1920 divider y = bandTop", approx(g30.divider.y, g30.bandTop));
ok("§30 1080×1920 divider x1 = 64.8 (6% of 1080)", approx(g30.divider.x1, 64.8));
ok("§30 1080×1920 divider x2 = 1015.2", approx(g30.divider.x2, 1015.2));
ok("§30 1080×1920 icon x = 54 (5% of 1080)", approx(g30.iconRect.x, 54));
ok("§30 1080×1920 icon size = 120", g30.iconRect.w === 120 && g30.iconRect.h === 120);
ok("§30 1080×1920 icon vert-centered in band",
   approx(g30.iconRect.y + 60, g30.bandTop + g30.bandHeight / 2));
ok("§30 1080×1920 icon src crop = (0, 208, 832, 832)",
   g30.iconSrcRect.sx === 0 && g30.iconSrcRect.sy === 208 &&
   g30.iconSrcRect.sw === 832 && g30.iconSrcRect.sh === 832);
ok("§30 1080×1920 wordmark center = 540", approx(g30.wordmark.centerX, 540));

const g24 = computeFooterGeometry(1080, 1350);
ok("§24 1080×1350 band height = 270", approx(g24.bandHeight, 270));
ok("§24 1080×1350 band top = 1080", approx(g24.bandTop, 1080));
ok("§24 1080×1350 icon x = 54 (5% of 1080)", approx(g24.iconRect.x, 54));
ok("§24 1080×1350 icon size = 120 (absolute, same as §30)",
   g24.iconRect.w === 120 && g24.iconRect.h === 120);
ok("§24 1080×1350 icon vert-centered in band",
   approx(g24.iconRect.y + 60, g24.bandTop + g24.bandHeight / 2));
ok("§24 1080×1350 wordmark center = 540", approx(g24.wordmark.centerX, 540));

const g2x = computeFooterGeometry(2160, 3840);
ok("2160×3840 (2× retina) band height = 768", approx(g2x.bandHeight, 768));
ok("2160×3840 band top = 3072", approx(g2x.bandTop, 3072));
ok("2160×3840 icon x = 108 (5% of 2160)", approx(g2x.iconRect.x, 108));
ok("2160×3840 wordmark center = 1080", approx(g2x.wordmark.centerX, 1080));

const gMini = computeFooterGeometry(100, 100);
ok("100×100 band height = 20", approx(gMini.bandHeight, 20));
ok("100×100 band top = 80", approx(gMini.bandTop, 80));
// At tiny H, the 120px icon spills above the band — that's an expected
// caller-responsibility case; we document it in the test rather than
// guarding it in the helper.
ok("100×100 icon w = 120 (absolute, unscaled)", gMini.iconRect.w === 120);

// Footer pct invariant — for any H, bandHeight should equal H × 0.20.
for (const H of [800, 1080, 1350, 1500, 1920, 2400, 3840]) {
  ok(`footer pct invariant at H=${H}`,
     approx(computeFooterGeometry(1080, H).bandHeight, H * 0.20));
}

// Wordmark stack should never overlap top or bottom of band.
ok("§30 wordmark line1Y > bandTop",
   g30.wordmark.line1Y > g30.bandTop);
ok("§30 wordmark line3Y < H",
   g30.wordmark.line3Y < 1920);

// Divider spans most of the width.
ok("§30 divider span = 88% of width",
   approx(g30.divider.x2 - g30.divider.x1, 1080 * 0.88));

// ── slugifyTransliteration ─────────────────────────────────────────

ok('slugify "logos" → "logos"', slugifyTransliteration("logos") === "logos");
ok('slugify "Logos" → "logos"', slugifyTransliteration("Logos") === "logos");
ok("slugify \"rê'shîth\" → \"reshith\"",
   slugifyTransliteration("rê'shîth") === "reshith");
ok('slugify "lógos" → "logos"', slugifyTransliteration("lógos") === "logos");
ok('slugify "ben adam" → "ben-adam"',
   slugifyTransliteration("ben adam") === "ben-adam");
ok('slugify "a.b,c!" → "abc"',
   slugifyTransliteration("a.b,c!") === "abc");
ok('slugify "" → "entry"', slugifyTransliteration("") === "entry");
ok('slugify "   " → "entry"', slugifyTransliteration("   ") === "entry");
ok('slugify "abi-shalom" → "abi-shalom"',
   slugifyTransliteration("abi-shalom") === "abi-shalom");
ok('slugify "abi - shalom" → "abi-shalom"',
   slugifyTransliteration("abi - shalom") === "abi-shalom");
ok('slugify "Iēsoũs" → "iesous"',
   slugifyTransliteration("Iēsoũs") === "iesous");

// ── buildStudyShareFilename ────────────────────────────────────────

ok("filename H7225 + rê'shîth",
   buildStudyShareFilename("H7225", "rê'shîth") === "H7225-reshith-rop-study.png");
ok("filename G3056 + logos",
   buildStudyShareFilename("G3056", "logos") === "G3056-logos-rop-study.png");
ok("filename H0001 + empty → entry",
   buildStudyShareFilename("H0001", "") === "H0001-entry-rop-study.png");
ok("filename G2424 + Iēsoũs",
   buildStudyShareFilename("G2424", "Iēsoũs") === "G2424-iesous-rop-study.png");

// ── buildLexiconDeeplinkText ───────────────────────────────────────

ok("deeplink BDB H7225",
   buildLexiconDeeplinkText("H7225", "bdb") ===
   `Full BDB entry at ${STRONGS_URL_BASE}/H7225`);
ok("deeplink LSJ G3056",
   buildLexiconDeeplinkText("G3056", "lsj") ===
   `Full LSJ entry at ${STRONGS_URL_BASE}/G3056`);
ok("deeplink strongs G3056",
   buildLexiconDeeplinkText("G3056", "strongs") ===
   `Full lexicon entry at ${STRONGS_URL_BASE}/G3056`);
ok("deeplink undefined source H0001",
   buildLexiconDeeplinkText("H0001", undefined) ===
   `Full lexicon entry at ${STRONGS_URL_BASE}/H0001`);

// ─────────────────────────────────────────────────────────────────────
// Report
// ─────────────────────────────────────────────────────────────────────

console.log(`\nS170 study-share sanity: ${passed} passed, ${failed} failed`);
if (failed > 0) {
  for (const f of failures) console.log("  ✗ " + f);
  process.exit(1);
}
