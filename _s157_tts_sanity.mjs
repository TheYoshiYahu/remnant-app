// S157 (Phase 9.4 — Native-OS TTS) sanity test for app/src/lib/tts-helpers.ts.
//
// Inlines a JS port of the helper's logic — the TS module imports
// stripParentheticals from ./stripParentheticals which Node can't
// resolve directly under ESM without bundling. Logic mirrors
// tts-helpers.ts 1:1; any divergence between this file and the .ts
// module is a bug.
//
// Boundary cases (per the §25 spec + S121 W2 / W3 / S122 / S123 / S125 /
// S126 forward standard):
//
//   - stripParentheticals: every restored-name parenthetical variant
//     correctly removed; legitimate parenthetical prose preserved;
//     compound forms ("the LORD God") win against singles ("God").
//   - applySubstitutionTable: each table entry maps correctly; compound
//     names fire before singles; case-sensitive matching; word-boundary
//     anchoring; chained substitutions preserve word spacing; idempotent
//     on already-substituted output.
//   - prepareVerseForSpeech: composition of strip + substitute on
//     realistic verse text covering single-name / compound-name /
//     multi-name combinations.
//   - rankVoices: default voice surfaces first; Apple Siri patterns
//     rank correctly; Google Wavenet patterns rank correctly; Microsoft
//     Neural patterns rank correctly; unknown voices fall through
//     alphabetically; stable for ties.
//   - filterEnglishVoices: en / en-US / en-GB pass; fr / de / es fail;
//     case-insensitive lang matching.
//   - pickBestVoice: returns top-ranked English voice; null when no
//     English voices available.
//   - clampRate: snaps arbitrary numeric rates to nearest §25 speed
//     value; NaN / Infinity handled defensively.
//
// Run with: node _s157_tts_sanity.mjs

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic (port of tts-helpers.ts + stripParentheticals.ts)
// ─────────────────────────────────────────────────────────────────────

const STRIP_LIST = [
  // Compound forms (longest first; the alternation sorts again at build).
  "(THE LORD OUR RIGHTEOUSNESS)",
  "(The LORD is my shepherd)",
  "(the LORD that healeth thee)",
  "(the everlasting God)",
  "(everlasting Father)",
  "(The LORD is there)",
  "(the LORD thy God)",
  "(the Lord thy God)",
  "(the LORD your God)",
  "(the Lord your God)",
  "(the LORD our God)",
  "(the Lord our God)",
  "(the LORD his God)",
  "(the Lord his God)",
  "(the LORD my God)",
  "(the Lord my God)",
  "(LORD of hosts)",
  "(Lord of hosts)",
  "(the LORD of hosts)",
  "(the Lord of hosts)",
  "(the LORD God)",
  "(the Lord God)",
  "(LORD God)",
  "(Lord God)",
  "(the Lord GOD)",
  "(God Almighty)",
  "(Almighty God)",
  "(mighty God)",
  "(most High)",
  "(Most High)",
  "(Prince of Peace)",
  "(Jehovah-jireh)",
  "(Jehovah-nissi)",
  "(Jehovah-shalom)",
  "(I AM THAT I AM)",
  "(Jesus Christ)",
  "(Christ Jesus)",
  "(Holy Spirit)",
  "(Holy Ghost)",
  "(LORD)",
  "(Lord)",
  "(God)",
  "(Jesus)",
  "(Christ)",
  "(JESUS)",
  "(CHRIST)",
  "(Israel)",
  "(Judah)",
  "(Jews)",
  "(Jewish)",
  "(Jew)",
  "(Abraham)",
  "(Isaac)",
  "(Jacob)",
  "(Moses)",
  "(Aaron)",
  "(Joshua)",
  "(Jerusalem)",
  "(John)",
  "(James)",
  "(Timothy)",
  "(Saul)",
  "(Paul)",
  "(Cain)",
  "(Abel)",
  "(Noah)",
  "(Jonah)",
  "(Solomon)",
  "(David)",
  "(Michael)",
  "(Gabriel)",
  "(Melchizedek)",
  "(Mary)",
  "(Joseph)",
  "(Peter)",
  "(Elijah)",
  "(Elisha)",
  "(Ahab)",
  "(Jezebel)",
  "(Naboth)",
  "(Isaiah)",
  "(Jeremiah)",
  "(Ezekiel)",
  "(Hosea)",
  "(Joel)",
  "(Micaiah)",
  "(Zechariah)",
  "(Berachiah)",
  "(Adam)",
  "(Eve)",
  "(Sarah)",
  "(Rebekah)",
  "(Rachel)",
  "(Elias)",
  "(Esaias)",
  "(Jonas)",
  "(Noe)",
  "(Jeremias)",
];

function buildStripRegex() {
  const sorted = [...STRIP_LIST].sort((a, b) => b.length - a.length);
  const escape = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const alternation = sorted.map(escape).join("|");
  return new RegExp(`\\s?(?:${alternation})`, "g");
}

const STRIP_REGEX = buildStripRegex();

function stripParentheticals(text) {
  if (!text) return text;
  return text.replace(STRIP_REGEX, "");
}

// Substitution table — keep in 1:1 sync with tts-helpers.ts.
const NAME_SUBSTITUTIONS = {
  "Yahuah Elohim": "yah-OO-ah el-oh-HEEM",
  "Yahuah Tseva'ot": "yah-OO-ah tseh-vah-OAT",
  "Yahuah Tsidkenu": "yah-OO-ah tsid-KEH-noo",
  "Yahuah Shalom": "yah-OO-ah shah-LOHM",
  "Yahuah Nissi": "yah-OO-ah NEE-see",
  "Yahuah Yireh": "yah-OO-ah yir-EH",
  "Yahuah Rapha": "yah-OO-ah RAH-fah",
  "Yahuah Ra'ah": "yah-OO-ah RAH-ah",
  "Yahuah Shammah": "yah-OO-ah SHAH-mah",
  "Yahuah Elohayka": "yah-OO-ah el-oh-HAI-kah",
  "Yahuah Elohaychem": "yah-OO-ah el-oh-HAI-khem",
  "Yahuah Eloheinu": "yah-OO-ah el-oh-HAY-noo",
  "Yahuah Elohai": "yah-OO-ah el-oh-HAI",
  "Yahuah Elohav": "yah-OO-ah el-oh-HAHV",
  "Adonai Yahuah": "ah-doh-NAI yah-OO-ah",
  "Yahusha HaMashiach": "yah-OO-shah hah-mah-SHEE-akh",
  "HaMashiach Yahusha": "hah-mah-SHEE-akh yah-OO-shah",
  "Ehyeh asher Ehyeh": "eh-YEH ah-SHER eh-YEH",
  "Ruach HaKodesh": "ROO-akh hah-KOH-desh",
  "El Shaddai": "el shah-DIE",
  "El Elyon": "el el-YOHN",
  "El Olam": "el oh-LAHM",
  "El Roi": "el roh-EE",
  "El Gibbor": "el gih-BOR",
  "Sar Shalom": "sar shah-LOHM",
  "Melek Tsadiq": "MEH-lek tsah-DEEK",
  Yahuah: "yah-OO-ah",
  Yahusha: "yah-OO-shah",
  HaMashiach: "hah-mah-SHEE-akh",
  Mashiach: "mah-SHEE-akh",
  Elohim: "el-oh-HEEM",
  Adonai: "ah-doh-NAI",
  Yah: "yah",
  "Avi-ad": "ah-vee-AHD",
  "Yashar'el": "yih-shrah-EL",
  Yahudah: "yih-HOO-dah",
  Yahudim: "yih-hoo-DEEM",
  Yahudi: "yih-hoo-DEE",
  Avraham: "AHV-rah-hahm",
  Yitschaq: "YITS-khahk",
  "Ya'aqov": "yah-ah-KOHV",
  Mosheh: "MOH-sheh",
  Yerushalayim: "yeh-roo-shah-LAH-yim",
  Yochanan: "yoh-khah-NAHN",
  Kefa: "KEH-fah",
  "Sha'ul": "shah-OOL",
  Timotheos: "tee-moh-THEH-os",
};

function buildSubstitutionRegex(table) {
  const keys = Object.keys(table).sort((a, b) => b.length - a.length);
  const escape = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const alternation = keys.map(escape).join("|");
  return new RegExp(`(?<![\\w'-])(?:${alternation})(?![\\w'-])`, "g");
}

const SUBSTITUTION_REGEX = buildSubstitutionRegex(NAME_SUBSTITUTIONS);

function applySubstitutionTable(text, table = NAME_SUBSTITUTIONS) {
  if (!text) return text;
  const regex =
    table === NAME_SUBSTITUTIONS
      ? SUBSTITUTION_REGEX
      : buildSubstitutionRegex(table);
  return text.replace(regex, (match) => table[match] ?? match);
}

function prepareVerseForSpeech(verseText, table = NAME_SUBSTITUTIONS) {
  if (!verseText) return verseText;
  const stripped = stripParentheticals(verseText);
  return applySubstitutionTable(stripped, table);
}

const PREMIUM_PATTERNS = [
  /\b(Samantha|Daniel|Karen|Moira|Tessa|Alex|Victoria|Fred|Ava|Allison|Susan|Tom)\b/i,
  /Wavenet|Neural2?|Studio/i,
  /Microsoft.*(?:Aria|Jenny|Guy|Davis|Jane|Tony|Sara|Nancy|Eric).*Natural/i,
  /\b(Neural|Premium|Enhanced|HD)\b/i,
];

function scoreVoice(v) {
  let score = 0;
  if (v.default) score += 100;
  for (let i = 0; i < PREMIUM_PATTERNS.length; i++) {
    if (PREMIUM_PATTERNS[i].test(v.name)) {
      score += 50 - i;
      break;
    }
  }
  return score;
}

function rankVoices(voices) {
  const scored = voices.map((v) => ({
    voice: v,
    score: scoreVoice(v),
    name: v.name,
  }));
  scored.sort((a, b) => {
    if (a.score !== b.score) return b.score - a.score;
    return a.name.localeCompare(b.name);
  });
  return scored.map((s) => s.voice);
}

function filterEnglishVoices(voices) {
  return voices.filter((v) => /^en(-|$)/i.test(v.lang));
}

function pickBestVoice(voices) {
  const english = filterEnglishVoices(voices);
  if (english.length === 0) return null;
  const ranked = rankVoices(english);
  return ranked[0];
}

const SPEED_VALUES = [0.75, 1.0, 1.25, 1.5];

function clampRate(rate) {
  if (!Number.isFinite(rate)) return 1.0;
  let best = SPEED_VALUES[0];
  let bestDist = Math.abs(rate - best);
  for (let i = 1; i < SPEED_VALUES.length; i++) {
    const d = Math.abs(rate - SPEED_VALUES[i]);
    if (d < bestDist) {
      best = SPEED_VALUES[i];
      bestDist = d;
    }
  }
  return best;
}

// ─────────────────────────────────────────────────────────────────────
// Test runner
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
  if (val) {
    pass++;
  } else {
    fail++;
    failures.push(`✗ ${label}\n  expected truthy, got: ${JSON.stringify(val)}`);
  }
}

// ─────────────────────────────────────────────────────────────────────
// stripParentheticals — sanity sweep
// ─────────────────────────────────────────────────────────────────────

eq(
  stripParentheticals("Yahuah (LORD) said unto Mosheh (Moses)"),
  "Yahuah said unto Mosheh",
  "stripParentheticals: single name + patriarch parenthetical",
);

eq(
  stripParentheticals("Yahuah Elohim (the LORD God) created"),
  "Yahuah Elohim created",
  "stripParentheticals: compound parenthetical (longest wins)",
);

eq(
  stripParentheticals("Yashar'el (Israel) and Yahudah (Judah)"),
  "Yashar'el and Yahudah",
  "stripParentheticals: covenant-people-names",
);

eq(
  stripParentheticals("(per Red Line #11) the Father (God) names"),
  "(per Red Line #11) the Father names",
  "stripParentheticals: legitimate prose preserved (no false positive)",
);

eq(
  stripParentheticals("Verse text without parentheticals."),
  "Verse text without parentheticals.",
  "stripParentheticals: no-parenthetical input passes through unchanged",
);

eq(stripParentheticals(""), "", "stripParentheticals: empty string");

eq(
  stripParentheticals("Ehyeh asher Ehyeh (I AM THAT I AM)"),
  "Ehyeh asher Ehyeh",
  "stripParentheticals: I AM THAT I AM compound",
);

eq(
  stripParentheticals("Yahusha HaMashiach (Jesus Christ)"),
  "Yahusha HaMashiach",
  "stripParentheticals: Yahusha HaMashiach compound",
);

eq(
  stripParentheticals("Yahuah Tseva'ot (LORD of hosts) sent his prophet"),
  "Yahuah Tseva'ot sent his prophet",
  "stripParentheticals: LORD of hosts compound",
);

eq(
  stripParentheticals("the Son of Adam (JESUS) and the Christ (CHRIST)"),
  "the Son of Adam and the Christ",
  "stripParentheticals: S148 all-caps source-echo variants",
);

// ─────────────────────────────────────────────────────────────────────
// applySubstitutionTable — sanity sweep
// ─────────────────────────────────────────────────────────────────────

eq(
  applySubstitutionTable("Yahuah said"),
  "yah-OO-ah said",
  "applySubstitutionTable: single divine name",
);

eq(
  applySubstitutionTable("Yahuah Elohim created"),
  "yah-OO-ah el-oh-HEEM created",
  "applySubstitutionTable: compound fires before singles",
);

eq(
  applySubstitutionTable("Yahuah and Yahusha"),
  "yah-OO-ah and yah-OO-shah",
  "applySubstitutionTable: chained singles in one line",
);

eq(
  applySubstitutionTable("Yashar'el rose against Yahudah"),
  "yih-shrah-EL rose against yih-HOO-dah",
  "applySubstitutionTable: covenant-people-names with apostrophe",
);

eq(
  applySubstitutionTable("Mosheh and Avraham"),
  "MOH-sheh and AHV-rah-hahm",
  "applySubstitutionTable: patriarchs",
);

eq(
  applySubstitutionTable("Ehyeh asher Ehyeh"),
  "eh-YEH ah-SHER eh-YEH",
  "applySubstitutionTable: multi-word compound phrase",
);

eq(
  applySubstitutionTable("Ya'aqov son of Yitschaq son of Avraham"),
  "yah-ah-KOHV son of YITS-khahk son of AHV-rah-hahm",
  "applySubstitutionTable: three names in one verse with apostrophe",
);

eq(
  applySubstitutionTable("text with no restored names"),
  "text with no restored names",
  "applySubstitutionTable: no-match passthrough",
);

eq(
  applySubstitutionTable(""),
  "",
  "applySubstitutionTable: empty string",
);

eq(
  applySubstitutionTable("yahuah said"),
  "yahuah said",
  "applySubstitutionTable: case-sensitive (lowercase 'yahuah' does NOT match)",
);

eq(
  applySubstitutionTable("Yahuah Elohim said unto Mosheh and Yahuah Yireh"),
  "yah-OO-ah el-oh-HEEM said unto MOH-sheh and yah-OO-ah yir-EH",
  "applySubstitutionTable: mixed compound + single + compound in one line",
);

eq(
  applySubstitutionTable(
    applySubstitutionTable("Yahuah said"),
  ),
  "yah-OO-ah said",
  "applySubstitutionTable: idempotent (second pass is no-op)",
);

eq(
  applySubstitutionTable("Yahuahs of old"),
  "Yahuahs of old",
  "applySubstitutionTable: word-boundary anchored (Yahuahs ≠ Yahuah)",
);

eq(
  applySubstitutionTable("El Shaddai blessed Yitschaq"),
  "el shah-DIE blessed YITS-khahk",
  "applySubstitutionTable: El compound + patriarch",
);

eq(
  applySubstitutionTable("Ruach HaKodesh came upon Mosheh"),
  "ROO-akh hah-KOH-desh came upon MOH-sheh",
  "applySubstitutionTable: Ruach HaKodesh compound",
);

// ─────────────────────────────────────────────────────────────────────
// prepareVerseForSpeech — composition sanity
// ─────────────────────────────────────────────────────────────────────

eq(
  prepareVerseForSpeech(
    "Yahuah (LORD) said unto Mosheh (Moses), Speak unto the children of Yashar'el (Israel)",
  ),
  "yah-OO-ah said unto MOH-sheh, Speak unto the children of yih-shrah-EL",
  "prepareVerseForSpeech: Exodus-style verse",
);

eq(
  prepareVerseForSpeech(
    "In the beginning Yahuah Elohim (the LORD God) created the heaven and the earth",
  ),
  "In the beginning yah-OO-ah el-oh-HEEM created the heaven and the earth",
  "prepareVerseForSpeech: Genesis 1:1 with compound divine name",
);

eq(
  prepareVerseForSpeech(
    "For Yahuah (God) so loved the world that he gave his only begotten Son",
  ),
  "For yah-OO-ah so loved the world that he gave his only begotten Son",
  "prepareVerseForSpeech: John 3:16-style verse with single divine name",
);

eq(
  prepareVerseForSpeech(""),
  "",
  "prepareVerseForSpeech: empty input",
);

eq(
  prepareVerseForSpeech(
    "Avraham (Abraham) begat Yitschaq (Isaac); Yitschaq (Isaac) begat Ya'aqov (Jacob)",
  ),
  "AHV-rah-hahm begat YITS-khahk; YITS-khahk begat yah-ah-KOHV",
  "prepareVerseForSpeech: Matthew 1 genealogy-style",
);

// ─────────────────────────────────────────────────────────────────────
// rankVoices — sanity sweep
// ─────────────────────────────────────────────────────────────────────

{
  const voices = [
    { name: "Bob", lang: "en-US" },
    { name: "Samantha", lang: "en-US" },
    { name: "Default Voice", lang: "en-US", default: true },
    { name: "Alex", lang: "en-US" },
  ];
  const ranked = rankVoices(voices);
  eq(
    ranked[0].name,
    "Default Voice",
    "rankVoices: default-flagged voice surfaces first",
  );
}

{
  const voices = [
    { name: "Bob", lang: "en-US" },
    { name: "Samantha", lang: "en-US" }, // Apple Siri pattern
    { name: "en-US-Wavenet-D", lang: "en-US" }, // Google Wavenet pattern
  ];
  const ranked = rankVoices(voices);
  // Apple Siri scores 50, Wavenet scores 49, Bob scores 0.
  eq(
    ranked[0].name,
    "Samantha",
    "rankVoices: Apple Siri ranks above Google Wavenet",
  );
  eq(
    ranked[1].name,
    "en-US-Wavenet-D",
    "rankVoices: Google Wavenet ranks above generic",
  );
  eq(ranked[2].name, "Bob", "rankVoices: generic voice last");
}

{
  const voices = [
    {
      name: "Microsoft Aria Online (Natural) - English (United States)",
      lang: "en-US",
    },
    { name: "en-US-Neural2-A", lang: "en-US" },
    { name: "Bob", lang: "en-US" },
  ];
  const ranked = rankVoices(voices);
  // Google Neural2 scores 49, Microsoft Aria-Natural scores 48.
  eq(
    ranked[0].name,
    "en-US-Neural2-A",
    "rankVoices: Google Neural2 ranks above Microsoft Natural",
  );
  eq(
    ranked[1].name,
    "Microsoft Aria Online (Natural) - English (United States)",
    "rankVoices: Microsoft Aria-Natural ranks above generic",
  );
}

{
  const voices = [
    { name: "Zelda", lang: "en-US" },
    { name: "Bob", lang: "en-US" },
    { name: "Charlie", lang: "en-US" },
  ];
  const ranked = rankVoices(voices);
  eq(
    ranked.map((v) => v.name),
    ["Bob", "Charlie", "Zelda"],
    "rankVoices: ties → alphabetical order",
  );
}

{
  // Stability — ranking doesn't mutate input.
  const voices = [
    { name: "Bob", lang: "en-US" },
    { name: "Samantha", lang: "en-US" },
  ];
  const ranked = rankVoices(voices);
  eq(voices[0].name, "Bob", "rankVoices: does not mutate input order");
  eq(ranked[0].name, "Samantha", "rankVoices: returns ranked output");
}

// ─────────────────────────────────────────────────────────────────────
// filterEnglishVoices — sanity sweep
// ─────────────────────────────────────────────────────────────────────

{
  const voices = [
    { name: "Samantha", lang: "en-US" },
    { name: "Daniel", lang: "en-GB" },
    { name: "Tessa", lang: "en" },
    { name: "Marie", lang: "fr-FR" },
    { name: "Hans", lang: "de-DE" },
    { name: "Carlos", lang: "es-MX" },
    { name: "Mei", lang: "zh-CN" },
  ];
  const english = filterEnglishVoices(voices);
  eq(
    english.map((v) => v.name),
    ["Samantha", "Daniel", "Tessa"],
    "filterEnglishVoices: en / en-US / en-GB pass; non-English excluded",
  );
}

{
  // Case-insensitive lang matching.
  const voices = [
    { name: "Aria", lang: "EN-US" },
    { name: "Hans", lang: "DE-DE" },
  ];
  const english = filterEnglishVoices(voices);
  eq(
    english.map((v) => v.name),
    ["Aria"],
    "filterEnglishVoices: case-insensitive lang code",
  );
}

// ─────────────────────────────────────────────────────────────────────
// pickBestVoice — sanity sweep
// ─────────────────────────────────────────────────────────────────────

{
  const voices = [
    { name: "Bob", lang: "en-US" },
    { name: "Samantha", lang: "en-US" }, // premium
    { name: "Marie", lang: "fr-FR" },
  ];
  const best = pickBestVoice(voices);
  eq(best.name, "Samantha", "pickBestVoice: top-ranked English voice");
}

{
  const voices = [
    { name: "Marie", lang: "fr-FR" },
    { name: "Hans", lang: "de-DE" },
  ];
  const best = pickBestVoice(voices);
  eq(best, null, "pickBestVoice: returns null when no English voices");
}

{
  const best = pickBestVoice([]);
  eq(best, null, "pickBestVoice: returns null on empty list");
}

// ─────────────────────────────────────────────────────────────────────
// clampRate — sanity sweep
// ─────────────────────────────────────────────────────────────────────

eq(clampRate(1.0), 1.0, "clampRate: exact 1.0 value");
eq(clampRate(0.75), 0.75, "clampRate: exact 0.75 value");
eq(clampRate(1.5), 1.5, "clampRate: exact 1.5 value");
eq(clampRate(0.5), 0.75, "clampRate: 0.5 snaps to 0.75 (nearest)");
eq(clampRate(0.9), 1.0, "clampRate: 0.9 snaps to 1.0");
eq(clampRate(1.1), 1.0, "clampRate: 1.1 snaps to 1.0");
eq(clampRate(1.3), 1.25, "clampRate: 1.3 snaps to 1.25");
eq(clampRate(2.0), 1.5, "clampRate: 2.0 snaps to 1.5 (clamps to max)");
eq(clampRate(NaN), 1.0, "clampRate: NaN defaults to 1.0");
eq(clampRate(Infinity), 1.0, "clampRate: Infinity defaults to 1.0");
eq(clampRate(-1), 0.75, "clampRate: negative snaps to nearest (0.75)");

// ─────────────────────────────────────────────────────────────────────
// Summary
// ─────────────────────────────────────────────────────────────────────

console.log(`\nS157 TTS sanity tests:`);
console.log(`  ${pass} passed, ${fail} failed\n`);
if (fail > 0) {
  for (const f of failures) console.log(f);
  process.exit(1);
}
