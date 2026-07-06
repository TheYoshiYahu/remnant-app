/**
 * VowelsLens — the "✦ What if we removed the vowels?" consonantal-skeleton lens.
 *
 * Strips a Hebrew word to its bare consonants and shows every word sharing that
 * skeleton (with gloss + usage), then the single-consonant-swap near matches
 * (the netzer↔nazir deep dive).
 *
 *   PARTNER: runs live on the tapped word via /v1/skeleton/{lemma} +
 *            /v1/skeleton/{lemma}/near.
 *   FREE:    shows ONE complete prebuilt SAMPLE card (the נצר flagship),
 *            framed plainly as a sample, then the reusable LockedPartnerPrompt
 *            (no in-app checkout — consumption-only).
 *
 * Hebrew/Aramaic only — the caller hides the trigger for Greek entries.
 */

import { useState } from "react";
import {
  type SkeletonGroupResponse,
  type SkeletonNearResponse,
  type SkeletonEntry,
  getSkeletonGroup,
  getSkeletonNear,
  toConsonantalSkeleton,
} from "../lib/api";
import LockedPartnerPrompt from "./LockedPartnerPrompt";

const HEBREW_FONT =
  "'SBL Hebrew', 'Ezra SIL', 'Times New Roman', serif";

function Heb({ children }: { children: string }) {
  return (
    <span dir="rtl" style={{ fontFamily: HEBREW_FONT, display: "inline-block" }}>
      {children}
    </span>
  );
}

function EntryLine({ e }: { e: SkeletonEntry }) {
  return (
    <li className="leading-relaxed">
      <Heb>{e.lemma}</Heb>{" "}
      <span className="italic text-[var(--reader-muted)]">{e.transliteration}</span>{" "}
      <span className="font-sans text-xs text-[var(--reader-muted)]">
        ({e.strong_number})
      </span>
      <span className="text-[var(--reader-text)]">
        {" "}— {e.short_definition || e.definition}
      </span>
      {e.usage_count > 0 && (
        <span className="font-sans text-xs text-[var(--reader-muted)]">
          {" "}· {e.usage_count} use{e.usage_count === 1 ? "" : "s"}
        </span>
      )}
    </li>
  );
}

// ── Free-tier prebuilt sample (the נצר flagship). Hardcoded on purpose. ──
const SAMPLE_SKELETON = "נצר";
const SAMPLE_SAME: SkeletonEntry[] = [
  {
    strong_number: "H5342",
    lemma: "נֵצֶר",
    transliteration: "netser",
    short_definition: "a branch, shoot, sprout",
    definition:
      "A branch or shoot — the Messianic Branch-word of Isaiah 11:1, the shoot that grows out of Jesse's roots.",
    usage_count: 4,
  },
  {
    strong_number: "H5341",
    lemma: "נָצַר",
    transliteration: "natsar",
    short_definition: "to guard, watch, keep",
    definition:
      "To guard, watch over, keep, preserve — to keep watch as a watchman keeps a vineyard or as one keeps the commandments.",
    usage_count: 63,
  },
];
const SAMPLE_NEAR: { near_skeleton: string; entries: SkeletonEntry[] }[] = [
  {
    near_skeleton: "נזר",
    entries: [
      {
        strong_number: "H5139",
        lemma: "נָזִיר",
        transliteration: "nazir",
        short_definition: "one consecrated, a Nazirite",
        definition:
          "One set apart, consecrated, separated by vow — the Nazirite of Numbers 6; Samson set apart from the womb.",
        usage_count: 16,
      },
      {
        strong_number: "H5145",
        lemma: "נֵזֶר",
        transliteration: "nezer",
        short_definition: "consecration, crown, separation",
        definition:
          "The mark of consecration — the crown / diadem of the consecrated, the unshorn hair of the Nazirite vow.",
        usage_count: 25,
      },
    ],
  },
];

export default function VowelsLens({
  lemma,
  isPartner,
}: {
  lemma: string;
  isPartner: boolean;
}) {
  const [open, setOpen] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [group, setGroup] = useState<SkeletonGroupResponse | null>(null);
  const [near, setNear] = useState<SkeletonNearResponse | null>(null);

  const skeleton = toConsonantalSkeleton(lemma);

  async function onToggle() {
    if (open) {
      setOpen(false);
      return;
    }
    setOpen(true);
    // Free tier renders the static sample; only partners hit the network.
    if (!isPartner || group !== null) return;
    setLoading(true);
    setError(null);
    try {
      const [g, n] = await Promise.all([
        getSkeletonGroup(lemma),
        getSkeletonNear(lemma),
      ]);
      setGroup(g);
      setNear(n);
    } catch (e) {
      setError(String(e));
    } finally {
      setLoading(false);
    }
  }

  return (
    <div>
      <button
        type="button"
        onClick={onToggle}
        className="font-sans text-sm font-medium text-[var(--reader-accent)] hover:underline"
      >
        ✦ What if we removed the vowels?
      </button>

      {open && (
        <div className="mt-3 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3">
          <p className="text-sm text-[var(--reader-muted)]">
            Strip the vowel points and a word falls back to its bare consonants —
            its skeleton. Other words built on the same skeleton often carry a
            related thread of meaning.
          </p>

          {/* ── PARTNER: live lens ───────────────────────────────────── */}
          {isPartner && (
            <div className="mt-3">
              <p className="text-base text-[var(--reader-text)]">
                Skeleton: <Heb>{skeleton}</Heb>
              </p>
              {loading && (
                <p className="mt-2 text-sm text-[var(--reader-muted)]">
                  Reading the lexicon…
                </p>
              )}
              {error && (
                <p className="mt-2 text-sm text-red-700">
                  Couldn't load the lens: {error}
                </p>
              )}
              {group && (
                <div className="mt-2">
                  <p className="font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
                    Same skeleton
                  </p>
                  <ul className="mt-1 space-y-1 text-sm">
                    {group.entries.map((e) => (
                      <EntryLine key={e.strong_number} e={e} />
                    ))}
                    {group.entries.length === 0 && (
                      <li className="text-sm text-[var(--reader-muted)]">
                        No other entries share this skeleton.
                      </li>
                    )}
                  </ul>
                </div>
              )}
              {near && near.near.length > 0 && (
                <div className="mt-3">
                  <p className="font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
                    One consonant away
                  </p>
                  {near.near.map((n) => (
                    <div key={n.near_skeleton} className="mt-1">
                      <p className="text-sm text-[var(--reader-text)]">
                        <Heb>{n.near_skeleton}</Heb>{" "}
                        <span className="font-sans text-xs text-[var(--reader-muted)]">
                          ({n.edit_kind})
                        </span>
                      </p>
                      <ul className="mt-1 space-y-1 text-sm">
                        {n.entries.map((e) => (
                          <EntryLine key={e.strong_number} e={e} />
                        ))}
                      </ul>
                    </div>
                  ))}
                </div>
              )}
            </div>
          )}

          {/* ── FREE: prebuilt sample card (the נצר flagship) ─────────── */}
          {!isPartner && (
            <div className="mt-3">
              <p className="font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-accent)]">
                Sample
              </p>
              <p className="mt-1 text-base text-[var(--reader-text)]">
                Skeleton: <Heb>{SAMPLE_SKELETON}</Heb>{" "}
                <span className="text-sm text-[var(--reader-muted)]">(netser)</span>
              </p>
              <p className="mt-2 font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
                Same skeleton
              </p>
              <ul className="mt-1 space-y-1 text-sm">
                {SAMPLE_SAME.map((e) => (
                  <EntryLine key={e.strong_number} e={e} />
                ))}
              </ul>
              <p className="mt-3 font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
                One consonant away
              </p>
              {SAMPLE_NEAR.map((n) => (
                <div key={n.near_skeleton} className="mt-1">
                  <p className="text-sm text-[var(--reader-text)]">
                    <Heb>{n.near_skeleton}</Heb>{" "}
                    <span className="text-sm text-[var(--reader-muted)]">(nazir / nezer)</span>
                  </p>
                  <ul className="mt-1 space-y-1 text-sm">
                    {n.entries.map((e) => (
                      <EntryLine key={e.strong_number} e={e} />
                    ))}
                  </ul>
                </div>
              ))}
              <p className="mt-3 text-sm italic text-[var(--reader-muted)]">
                This is a sample. Partners can run this lens on every Hebrew word
                in the text.
              </p>
              <div className="mt-2">
                <LockedPartnerPrompt
                  tone="inline"
                  message={
                    "The consonantal-skeleton lens is part of the partner study " +
                    "tools. Partnership is managed from your account on the web " +
                    "at remnantofpromise.org."
                  }
                />
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
