/**
 * newFeatures — S465. The list behind the "New features" menu entry.
 *
 * NEWEST FIRST. Every feature that ships gets an entry here in the same
 * session it ships (standing step — see the session close checklist). The
 * red dot shows while the newest id differs from the one the reader last
 * saw (localStorage key below), so adding an entry at the top lights the dot
 * for everyone. `id` is also the anchor a Built suggestion links to:
 * /new-features#<id>.
 *
 * Voice: plain and flowing, describe what the reader can now do, no
 * prescription, no Christian framing. `tier` names the lowest tier that
 * opens it (omit for free) — free readers see the lock, which is the quiet
 * nudge.
 */
export interface NewFeature {
  id: string;
  date: string; // YYYY-MM-DD
  title: string;
  body: string;
  tier?: "Study Notes" | "Library" | "Companion" | "Partners";
}

export const NEW_FEATURES: NewFeature[] = [
  {
    id: "suggestion-board",
    date: "2026-10-24",
    title: "The Suggestion Board — your voice in what gets built",
    body:
      "Every partner, on any tier and during the free trial, can now send a suggestion, vote on the ideas other readers have sent, and comment a tweak that would make an idea better. Suggestions show on the board without a name, votes are anonymous, and you choose whether your own suggestion shows and can change your mind anytime. The app creator posts ideas there too, marks the ones he likes, and you can watch an idea move from Planned to Built. Free readers can read the board.",
    tier: "Partners",
  },
  {
    id: "new-features",
    date: "2026-10-24",
    title: "This list",
    body:
      "A red dot on the menu now tells you when something new has come into the app, and this page keeps the whole record of what has been added, so nothing slips by you.",
  },
  {
    id: "natural-voice-sample",
    date: "2026-10-24",
    title: "Hear the natural voice before you partner",
    body:
      "Free readers hear the first five verses of any chapter in the natural recorded voice, with a plain notice at the start and at the stop so the pause is never mistaken for an error.",
  },
  {
    id: "give",
    date: "2026-10-24",
    title: "Support the ministry from anywhere in the app",
    body:
      "A Give button now sits in the top menu, on the Today page and in Settings, and at the end of each chapter, opening the ministry's giving page.",
  },
  {
    id: "library-cards-rebuilt",
    date: "2026-10-23",
    title: "1 Enoch, Jubilees, the Apocrypha and Jasher cards rebuilt",
    body:
      "Every cross-reference card and thread summary across 1 Enoch, Jubilees, the Apocrypha, 3 Maccabees and Jasher was rebuilt and checked against the live text, so every quotation on the page reads word for word as the book does.",
    tier: "Library",
  },
  {
    id: "chapter-pages",
    date: "2026-10-16",
    title: "Every chapter has its own page on the web",
    body:
      "Each chapter of the Scriptures now has a real web page of its own, so a verse you share opens straight to its chapter and others can find the restored text when they search.",
  },
  {
    id: "background-audio",
    date: "2026-10-17",
    title: "Listen with the screen locked",
    body:
      "On the phone apps, audio keeps playing when the screen is locked or you switch apps, with play and pause on the lock screen, and it carries on from chapter to chapter without needing a connection at the break.",
  },
  {
    id: "natural-voices",
    date: "2026-10-12",
    title: "Natural recorded voices",
    body:
      "The Scriptures and the restored library can be heard in natural recorded voices instead of the phone's robot voice, with a voice picker so you can choose the one you like, the restored names spoken rightly, and the screen kept awake while you listen.",
    tier: "Partners",
  },
  {
    id: "free-trial",
    date: "2026-10-12",
    title: "A seven-day trial with no card",
    body:
      "You can open everything for seven days without putting in a card, and partners can move up a tier in place without starting a second subscription.",
  },
  {
    id: "year-plan-study",
    date: "2026-10-07",
    title: "Year Plan study and My Teachings",
    body:
      "Walk the whole year plan at your own pace with notes on each day, and keep your own teachings in My Teachings.",
    tier: "Study Notes",
  },
  {
    id: "hidden-words",
    date: "2026-10-03",
    title: "Hidden Words",
    body:
      "Every English word that hides two or more different Hebrew or Greek words underneath it is marked, so you can see where the translators flattened what the original kept apart.",
  },
  {
    id: "gospels-free",
    date: "2026-10-03",
    title: "The Gospels are open study ground",
    body:
      "The study notes and cross-references on the four Gospels are open to every reader, free, so anyone can see what the study layer does before partnering.",
  },
  {
    id: "scripture-first",
    date: "2026-09-13",
    title: "Scripture first",
    body:
      "The app now opens straight to the Scriptures, with a slim toolbar of Search, Listen and Menu, and everything else tucked into the menu out of the way of your reading.",
  },
  {
    id: "word-highlights",
    date: "2026-07-12",
    title: "Highlight a single word or phrase",
    body:
      "Highlights can now cover just the words you choose inside a verse, not only the whole verse, in thirty-six color and style slots you can name for yourself.",
  },
  {
    id: "teachings",
    date: "2026-07-11",
    title: "Teachings",
    body:
      "A Teachings tab holds full teachings you can read inside the app, beginning with Seed of Promise and the Kingdom Gospel, both free to every reader.",
  },
  {
    id: "search",
    date: "2026-07-07",
    title: "A stronger search",
    body:
      "Search now ranks the best matches first and understands exact phrases, AND and OR, and searching within a single book.",
  },
  {
    id: "reading-plans",
    date: "2026-06-29",
    title: "Reading plans and a voice journal",
    body:
      "Reading plans track your progress and show today's reading on the Today page, and a private journal lets you write or speak your thoughts as you study.",
  },
  {
    id: "offline",
    date: "2026-06-22",
    title: "Read offline",
    body:
      "Download the whole library once and read anywhere with no connection, with an option to keep it up to date over Wi-Fi only, and a font size setting that follows you across devices.",
  },
  {
    id: "compare-and-calendar",
    date: "2026-06-10",
    title: "Compare versions and The Appointed Times",
    body:
      "Compare any verse or chapter across public-domain translations, and open The Appointed Times, a biblical calendar with the new moons, the feasts, sunset-to-sunset days, the Torah portions and what happened on this day.",
  },
  {
    id: "arranged-reading",
    date: "2026-06-08",
    title: "Read in the order it happened",
    body:
      "An arranged-reading overlay lets you walk the Scriptures in the order events took place instead of the order the books were bound.",
  },
  {
    id: "my-study",
    date: "2026-06-06",
    title: "My Study",
    body:
      "One home for everything you have marked — highlights, notes and bookmarks — gathered into collections you can search by color and export.",
  },
  {
    id: "interlinear-lexicons",
    date: "2026-05-29",
    title: "Interlinear and the lexicons",
    body:
      "Tap any word to see the Hebrew or Greek beneath it, turn on the interlinear layer over the whole chapter, and Companion partners can open the full entries in Brown-Driver-Briggs, Thayer's and Gesenius.",
  },
  {
    id: "restored-library",
    date: "2026-05-25",
    title: "The restored library",
    body:
      "Beyond the sixty-six books, the full restored library is here with the names restored — the Apocrypha, 1 Enoch, Jubilees, Jasher, the Ascension of Isaiah, Josephus and more — tied into the canon by cross-references that run both ways.",
    tier: "Library",
  },
  {
    id: "study-notes",
    date: "2026-05-22",
    title: "Study notes and cross-reference threads",
    body:
      "Commentary growing chapter by chapter across the canon, with cross-reference threads that set each passage beside the scriptures that answer it, quoted in full on the page.",
    tier: "Study Notes",
  },
  {
    id: "restored-names-reader",
    date: "2026-05-12",
    title: "The Scriptures with the names restored",
    body:
      "The whole canon with the Father's name, the Son's name and the names of the covenant people restored, each with its English beside it so any reader can follow, free for everyone, along with bookmarks, notes and your reading place kept to the verse.",
  },
];

export const FEATURES_SEEN_KEY = "rop_new_features_seen_v1";

export function latestFeatureId(): string {
  return NEW_FEATURES[0]?.id ?? "";
}

export function hasUnseenFeatures(): boolean {
  try {
    return localStorage.getItem(FEATURES_SEEN_KEY) !== latestFeatureId();
  } catch {
    return false;
  }
}

export function markFeaturesSeen(): void {
  try {
    localStorage.setItem(FEATURES_SEEN_KEY, latestFeatureId());
  } catch {
    /* storage unavailable — the dot simply stays */
  }
  window.dispatchEvent(new Event("rop-features-seen"));
}
