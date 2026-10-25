/**
 * S157 — Native-OS Text-to-Speech audio narration pure helpers.
 *
 * Phase 9.4 launch-blocker per BIBLE_APP_ROADMAP.md §V + §III Launch
 * Scope Lock. Free at all tiers per §9 + S141 launch-scope revision —
 * audio narration is the accessibility surface.
 *
 * Architecture per DESIGN_LANGUAGE.md §25:
 *
 *   - Strip the visual-surface parentheticals BEFORE speaking — the
 *     parenthetical is the retention mechanism for the VISUAL reader
 *     ("Yahuah (LORD)" so a first-time Christian opens to any page and
 *     understands), not for the audio listener. Reuse the existing
 *     S144 stripParentheticals() helper.
 *
 *   - Apply a curated phonetic substitution table for the most common
 *     restored names so the browser TTS engine pronounces them
 *     reasonably. Framework-true (the listener hears the restored names,
 *     not the Christianized parentheticals) AND smooth audio (the
 *     phonetic hints prevent the engine from mangling Hebrew).
 *
 *   - Rank the SpeechSynthesisVoice[] list so the curated picker can
 *     surface the top 3-5 English voices with the rest hidden behind
 *     "More voices…" — Android Chrome exposes 200+ voices which
 *     overwhelms the partner if shown raw.
 *
 * Pure functions throughout — no React imports, no global state, no
 * async, no DOM access. Sanity-testable via node --test against
 * inlined cases per the post-S121 / S122 / S123 / S125 / S126 forward
 * standard.
 *
 * GOVERNANCE — KEEP IN SYNC WITH §25:
 *   The §25 sacred-name substitution table is the source of truth.
 *   When new entries land in the §25 table, the NAME_SUBSTITUTIONS
 *   constant below updates in lockstep. Compound names sort longest-
 *   first at runtime; source order in the array doesn't matter for
 *   correctness but compound-first helps readability.
 */

import { stripParentheticals } from "./stripParentheticals";

// =========================================================================
// Sacred-name substitution table (per DESIGN_LANGUAGE.md §25 lock)
// =========================================================================

/**
 * Each entry maps a restored name to a phonetic English spelling tuned
 * for the browser's default voice rendering. Stress-syllable convention
 * (hyphens separate syllables, UPPERCASE marks the stressed syllable)
 * is documented in §25.
 *
 * The match is word-boundary anchored and applied AFTER parenthetical
 * stripping. Compound names fire BEFORE singles (longest-first sort
 * inside applySubstitutionTable) so "Yahuah Elohim" substitutes as one
 * unit rather than the singles pass eating "Yahuah" first and leaving a
 * bare "Elohim".
 */
export const NAME_SUBSTITUTIONS: Record<string, string> = {
  // Compound divine names (longest, fire first) ---------------------------
  "Yahuah Elohim": "Ee-ah-oo-ah el-oh-heem",
  "Yahuah Tseva'ot": "Ee-ah-oo-ah tseh-vah-oat",
  "Yahuah Tsidkenu": "Ee-ah-oo-ah tsid-keh-noo",
  "Yahuah Shalom": "Ee-ah-oo-ah shah-lohm",
  "Yahuah Nissi": "Ee-ah-oo-ah nee-see",
  "Yahuah Yireh": "Ee-ah-oo-ah yir-eh",
  "Yahuah Rapha": "Ee-ah-oo-ah rah-fah",
  "Yahuah Ra'ah": "Ee-ah-oo-ah rah-ah",
  "Yahuah Shammah": "Ee-ah-oo-ah shah-mah",
  "Yahuah Elohayka": "Ee-ah-oo-ah el-oh-hai-kah",
  "Yahuah Elohaychem": "Ee-ah-oo-ah el-oh-hai-khem",
  "Yahuah Eloheinu": "Ee-ah-oo-ah el-oh-hay-noo",
  "Yahuah Elohai": "Ee-ah-oo-ah el-oh-hai",
  "Yahuah Elohav": "Ee-ah-oo-ah el-oh-hahv",
  "Adonai Yahuah": "Ah-doh-nai ee-ah-oo-ah",
  "Yahusha HaMashiach": "Ee-ah-oo-shah hah-mah-shee-akh",
  "HaMashiach Yahusha": "Hah-mah-shee-akh ee-ah-oo-shah",
  "Ehyeh asher Ehyeh": "Eh-yeh ah-sher eh-yeh",
  "Ruach HaKodesh": "Roo-akh hah-koh-desh",
  "El Shaddai": "El shah-die",
  "El Elyon": "El el-yohn",
  "El Olam": "El oh-lahm",
  "El Roi": "El roh-ee",
  "El Gibbor": "El gih-bor",
  "Sar Shalom": "Sar shah-lohm",
  "Melek Tsadiq": "Meh-lek tsah-deek",

  // Single divine names ---------------------------------------------------
  Yahuah: "Ee-ah-oo-ah",
  Yahusha: "Ee-ah-oo-shah",
  HaMashiach: "Hah-mah-shee-akh",
  Mashiach: "Mah-shee-akh",
  Elohim: "El-oh-heem",
  Adonai: "Ah-doh-nai",
  Yah: "Yah",
  "Avi-ad": "Ah-vee-ahd",

  // Covenant people-names -------------------------------------------------
  "Yashar'el": "Yih-shrah-el",
  Yahudah: "Yih-hoo-dah",
  Yahudim: "Yih-hoo-deem",
  Yahudi: "Yih-hoo-dee",

  // Patriarch / prophet / figure names ------------------------------------
  Avraham: "Ahv-rah-hahm",
  Yitschaq: "Yits-khahk",
  "Ya'aqov": "Yah-ah-kohv",
  Mosheh: "Moh-sheh",
  Yerushalayim: "Yeh-roo-shah-lah-yim",
  Yochanan: "Yoh-khah-nahn",
  Kefa: "Keh-fah",
  "Sha'ul": "Shah-ool",
  Timotheos: "Tee-moh-theh-os",

  // S468 — Yoshi's own pronunciations (same as the recorded voices).
  Enoch: "Ha-noke",
  Eve: "Hoo-ah",
  Baruch: "Ba-rook",
  Azazel: "Ah-zah-zel",
  Lamech: "Lah-mek",
  Maccabees: "Mack-uh-beez",
};

// =========================================================================
// Substitution + composition helpers
// =========================================================================

/**
 * Cached substitution regex — built once at module load from the table
 * keys, sorted longest-first so compounds match before singles. The
 * regex captures each key as a word-boundary-anchored alternation so
 * substring overlaps don't fire spuriously (e.g., "Yahuah" inside
 * "Yahuah Elohim" only matches as part of the compound when the
 * compound fires first).
 */
const SUBSTITUTION_REGEX: RegExp = buildSubstitutionRegex(NAME_SUBSTITUTIONS);

function buildSubstitutionRegex(table: Record<string, string>): RegExp {
  const keys = Object.keys(table).sort((a, b) => b.length - a.length);
  const escape = (s: string): string =>
    s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  // Anchor on word-character boundaries so partial matches don't fire.
  // Hebrew names with apostrophes (Ya'aqov, Yashar'el, Yahuah Ra'ah,
  // Yahuah Tseva'ot, Avi-ad) carry non-\w characters internally; the
  // regex captures the literal name including the apostrophe / hyphen
  // because the table keys carry those characters too.
  const alternation = keys.map(escape).join("|");
  return new RegExp(`(?<![\\w'-])(?:${alternation})(?='s\\b|[^\\w'-]|$)`, "g");
}

/**
 * Apply the substitution table to the given text. Returns a new string
 * with every restored-name occurrence replaced by its phonetic
 * spelling. Idempotent — phonetic spellings don't match any table key,
 * so a second pass is a no-op.
 *
 * Example:
 *   applySubstitutionTable("Yahuah Elohim said unto Mosheh")
 *   → "EE-ah-OO-ah el-oh-HEEM said unto MOH-sheh"
 */
export function applySubstitutionTable(
  text: string,
  table: Record<string, string> = NAME_SUBSTITUTIONS,
): string {
  if (!text) return text;
  const regex =
    table === NAME_SUBSTITUTIONS
      ? SUBSTITUTION_REGEX
      : buildSubstitutionRegex(table);
  return text.replace(regex, (match) => table[match] ?? match);
}

/**
 * Composition helper — strip parentheticals then apply the substitution
 * table. Single function the player calls per verse before sending the
 * string to the TTS engine.
 */
const SPEECH_FIXES: [RegExp, string][] = [
  [/Yahuah OF LORDS/g, "Lord of lords"],
  [/\b[Tt]he LORD'S\b/g, "Yahuah's"],
  [/\bLORD'S\b/g, "Yahuah's"],
  [/\bTHE Yahuah\b/g, "Yahuah"],
  [/\bAdonai GOD\b/g, "Adonai Yahuah"],
  [/\bGOD Adonai\b/g, "Yahuah Adonai"],
  [/\bTHY GOD\b/g, "thy Elohim"],
  [/\bUNKNOWN GOD\b/g, "unknown god"],
  [/\bYahuah JEHOVAH\b/g, "Yah Yahuah"],
  [/\bJEHOVAH\b/g, "Yahuah"],
  [/\bGOD\b/g, "Yahuah"],
];

export function prepareVerseForSpeech(
  verseText: string,
  table: Record<string, string> = NAME_SUBSTITUTIONS,
): string {
  if (!verseText) return verseText;
  let text = stripParentheticals(verseText).replace(/[’‘]/g, "'");
  // S468 — names the restoration missed in the text (the recordings already
  // fix these the same way, tts/names_ipa.py SPEECH_FIXES).
  for (const [a, b] of SPEECH_FIXES) text = text.replace(a, b);
  // All-caps words (LORD, JEHOVAH, KING OF KINGS) get spelled out letter by
  // letter by phone voices — say them as words.
  text = text.replace(/\b[A-Z]{2,}\b/g, (w) => w.toLowerCase());
  return applySubstitutionTable(text, table);
}

// =========================================================================
// Voice ranking
// =========================================================================

/**
 * Subset of SpeechSynthesisVoice we read in the helper — written as an
 * interface so the helper is testable without a real browser
 * SpeechSynthesis available (node --test environment doesn't expose
 * the Web Speech API).
 */
export interface RankableVoice {
  name: string;
  lang: string;
  default?: boolean;
  localService?: boolean;
}

/**
 * Premium-voice name patterns by platform. Each pattern matches the
 * name strings the browser exposes for known-good neural / premium
 * voices. The ranker prefers these in order: Apple premium → Google
 * Wavenet/Neural → Microsoft Neural → everything else alphabetical.
 */
const PREMIUM_PATTERNS: RegExp[] = [
  // Apple Siri voices (iOS / macOS Safari) — "Samantha", "Daniel",
  // "Karen", "Moira", "Tessa", "Alex", "Fred", "Victoria", etc.
  /\b(Samantha|Daniel|Karen|Moira|Tessa|Alex|Victoria|Fred|Ava|Allison|Susan|Tom)\b/i,
  // Google Cloud TTS exposed via Chrome — "en-US-Wavenet-D",
  // "en-GB-Wavenet-A", "en-US-Neural2-*", "en-US-Studio-*", etc.
  /Wavenet|Neural2?|Studio/i,
  // Microsoft Edge / Windows neural voices — "Microsoft Aria Online
  // (Natural) - English (United States)", "Microsoft Jenny Online
  // (Natural)", "Microsoft Guy Online (Natural)", etc.
  /Microsoft.*(?:Aria|Jenny|Guy|Davis|Jane|Tony|Sara|Nancy|Eric).*Natural/i,
  // Generic neural / premium markers across platforms.
  /\b(Neural|Premium|Enhanced|HD)\b/i,
];

/**
 * Rank voices for the curated picker per DESIGN_LANGUAGE.md §25.
 *
 *   1. Default-flagged voice first.
 *   2. Premium-pattern voices next (Apple Siri / Google Wavenet /
 *      Microsoft Neural / generic Neural markers).
 *   3. Everything else alphabetical by name.
 *
 * Input is the full English-filtered voice list; output is the same
 * voices in ranked order. Does NOT mutate the input.
 */
export function rankVoices<V extends RankableVoice>(voices: V[]): V[] {
  const scored = voices.map((v) => ({
    voice: v,
    score: scoreVoice(v),
    name: v.name,
  }));

  scored.sort((a, b) => {
    if (a.score !== b.score) return b.score - a.score; // higher first
    return a.name.localeCompare(b.name); // ties → alphabetical
  });

  return scored.map((s) => s.voice);
}

function scoreVoice(v: RankableVoice): number {
  let score = 0;
  // S444 — the recorded natural voices always lead the picker.
  if (/· Natural voice/.test(v.name)) score += 300;
  if (v.default) score += 100;
  for (let i = 0; i < PREMIUM_PATTERNS.length; i++) {
    if (PREMIUM_PATTERNS[i].test(v.name)) {
      score += 50 - i; // earlier patterns score higher
      break; // only the first matching pattern counts
    }
  }
  return score;
}

/**
 * Filter voices to English. Accepts both BCP-47 region-qualified codes
 * ("en-US", "en-GB") and the bare language tag ("en"). Case-insensitive.
 */
export function filterEnglishVoices<V extends RankableVoice>(voices: V[]): V[] {
  return voices.filter((v) => /^en(-|$)/i.test(v.lang));
}

/**
 * Pick the best-available voice for auto-selection. Returns the
 * highest-ranked English voice, or null if no English voices are
 * available. Used as the default voice when the partner hasn't picked
 * one yet (first launch, or after clearing localStorage).
 */
export function pickBestVoice<V extends RankableVoice>(voices: V[]): V | null {
  const english = filterEnglishVoices(voices);
  if (english.length === 0) return null;
  const ranked = rankVoices(english);
  return ranked[0];
}

// =========================================================================
// Persistence shape (per §25 — voice + rate persist; playback state does not)
// =========================================================================

export interface TTSPrefs {
  voiceName: string | null;
  rate: number;
}

export const DEFAULT_TTS_PREFS: TTSPrefs = {
  voiceName: null,
  rate: 1.0,
};

/**
 * Allowed speed values per the §25 4-step picker lock.
 */
export const SPEED_VALUES: readonly number[] = [0.75, 1.0, 1.25, 1.5] as const;

/**
 * Clamp an arbitrary numeric rate to the nearest §25-allowed speed
 * value. Used when localStorage carries a value from an old build that
 * had a different speed range, or when a user-pasted prefs JSON has an
 * out-of-range rate.
 */
export function clampRate(rate: number): number {
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

/**
 * Read prefs from localStorage with defensive parsing. Returns the
 * default prefs if the stored JSON is missing or malformed.
 */
export function loadTTSPrefs(): TTSPrefs {
  if (typeof localStorage === "undefined") return { ...DEFAULT_TTS_PREFS };
  try {
    const raw = localStorage.getItem("tts-prefs");
    if (!raw) return { ...DEFAULT_TTS_PREFS };
    const parsed = JSON.parse(raw) as Partial<TTSPrefs>;
    return {
      voiceName:
        typeof parsed.voiceName === "string" ? parsed.voiceName : null,
      rate: clampRate(
        typeof parsed.rate === "number" ? parsed.rate : DEFAULT_TTS_PREFS.rate,
      ),
    };
  } catch {
    return { ...DEFAULT_TTS_PREFS };
  }
}

/**
 * Write prefs to localStorage. Silently no-ops if localStorage is
 * unavailable (private-mode Safari, etc.).
 */
export function saveTTSPrefs(prefs: TTSPrefs): void {
  if (typeof localStorage === "undefined") return;
  try {
    localStorage.setItem("tts-prefs", JSON.stringify(prefs));
  } catch {
    // localStorage may be full or disabled; silently drop the write.
  }
}
