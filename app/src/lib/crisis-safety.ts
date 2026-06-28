/**
 * crisis-safety.ts — ON-DEVICE crisis watchlist for the Voice Journal.
 *
 * Privacy posture (hard rule): this runs ENTIRELY on the device. It never sends
 * journal text anywhere, never calls the network, and never stores a crisis
 * flag/score — locally or on the server. It only decides, in-memory, whether to
 * gently surface the care screen after the user writes an entry. The journal
 * body is saved exactly as written via the normal endpoint; this check is a
 * separate, transient read of the same text.
 *
 * The transparency disclosure (shown in the journal UI + the care screen) tells
 * the user plainly that the app looks at what they write ON THEIR DEVICE to
 * offer help, and that nothing about it is transmitted or recorded.
 *
 * The watchlist is intentionally conservative and editable in ONE place. It is
 * not a diagnosis — it's a prompt to offer support. False positives are fine
 * (a care screen is easy to dismiss); the cost of a miss is higher.
 */

// Lowercased phrases that warrant offering the care screen. Kept as plain
// substrings (matched against normalized text) — not regex — so they're easy to
// review and extend. Yoshi can tune this list.
const WATCHLIST: readonly string[] = [
  "kill myself",
  "killing myself",
  "end my life",
  "ending my life",
  "want to die",
  "wanna die",
  "don't want to live",
  "dont want to live",
  "no reason to live",
  "better off dead",
  "better off without me",
  "suicidal",
  "suicide",
  "hurt myself",
  "harm myself",
  "self harm",
  "self-harm",
  "cut myself",
  "can't go on",
  "cant go on",
  "give up on life",
  "take my own life",
  "no point in living",
];

/** Normalize for matching: lowercase + collapse whitespace + strip basic punctuation. */
function normalize(text: string): string {
  return (text || "")
    .toLowerCase()
    .replace(/[.,!?;:"'`]/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

/**
 * Returns true if the entry text contains a watchlisted phrase. Pure, sync,
 * on-device. The caller surfaces <CrisisCareScreen/> when this is true.
 */
export function entryNeedsCare(text: string): boolean {
  const n = normalize(text);
  if (!n) return false;
  return WATCHLIST.some((phrase) => n.includes(phrase));
}

// US 988 Suicide & Crisis Lifeline + the ministry's own presence. The care
// screen leads with 988 (immediate, 24/7), then offers the ministry as a
// secondary, relational option. Edit these in one place.
export const CRISIS_RESOURCES = {
  lifeline988: {
    name: "988 Suicide & Crisis Lifeline",
    call: "tel:988",
    text: "sms:988",
    blurb:
      "Free, confidential support 24/7 in the US — call or text 988. If you're in immediate danger, call 911.",
  },
  ministry: {
    name: "Remnant of Promise",
    email: "mailto:info@remnantofpromise.org",
    site: "https://remnantofpromise.org",
    blurb:
      "If you'd like to reach the ministry, we're here — email or visit remnantofpromise.org. We read what comes in and we'll walk with you.",
  },
} as const;
