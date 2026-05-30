import { useEffect } from "react";
import {
  type SacredNameMask,
  useSacredNameMask,
  hasStoredSacredNamePreference,
} from "../lib/useSacredNameMask";

/**
 * S172 — First-launch welcome modal asking the binary sacred-name
 * display question (Yahuah / YHWH).
 *
 * Mounts when the partner has NEVER set the
 * `rop_sacred_name_mask_v1` localStorage key. After the partner picks
 * an option, the key is written and the modal dismisses for the
 * remainder of the session AND all future sessions on this device.
 * If the partner clears site data (or signs in on a fresh device),
 * the modal fires again. Cross-device sync via signed-in profile
 * arrives in a follow-up wheel per the spec.
 *
 * Visual register: same bg-black/40 backdrop + bordered-chrome modal
 * family as HighlightPicker / StrongsLookup. NO skip button — the
 * choice frames every render the partner sees next, so it must be
 * made before the reader mounts. Two equal-weight tap-target cards;
 * no default pre-highlighted (per Yoshi's S171 call: every partner
 * sees both options, nobody defaults through).
 *
 * Composition with the parens-hide toggle stays orthogonal — the
 * modal text shows "(LORD)" in both options because the paren is
 * governed by a different setting in the Settings page that the
 * partner can flip later. The first-launch question is solely about
 * how the sacred name itself renders.
 *
 * Anonymous-safe: localStorage write only. Signed-in cross-device
 * sync arrives with the server-side persistence wheel.
 *
 * Caller pattern (in App.tsx):
 *
 *   const [welcomeOpen, setWelcomeOpen] = useState(
 *     () => !hasStoredSacredNamePreference()
 *   );
 *   return (
 *     <>
 *       {welcomeOpen && (
 *         <SacredNameWelcomeModal onClose={() => setWelcomeOpen(false)} />
 *       )}
 *       <Reader />
 *     </>
 *   );
 */
export default function SacredNameWelcomeModal({
  onClose,
}: {
  onClose: () => void;
}) {
  const { set: setMask } = useSacredNameMask();

  // Pre-mount safety: if the preference somehow got set between the
  // caller's initial check and our mount (race against another tab),
  // dismiss immediately. Belt-and-suspenders.
  useEffect(() => {
    if (hasStoredSacredNamePreference()) {
      onClose();
    }
  }, [onClose]);

  function pick(mask: SacredNameMask) {
    setMask(mask);
    onClose();
  }

  return (
    <div
      className="fixed inset-0 z-[100] flex items-end justify-center bg-black/40 p-4 sm:items-center"
      role="dialog"
      aria-modal="true"
      aria-labelledby="sacred-name-welcome-title"
    >
      <div
        className="w-full max-w-md rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-5 shadow-xl"
        onClick={(e) => e.stopPropagation()}
      >
        <h2
          id="sacred-name-welcome-title"
          className="text-base font-semibold text-[var(--reader-text)]"
        >
          The Remnant of Promise Official Study Bible
        </h2>
        <p className="mt-3 font-sans text-sm leading-relaxed text-[var(--reader-text)]">
          Before you begin reading, choose how you&rsquo;d like the
          sacred name to appear in scripture:
        </p>

        <div className="mt-4 space-y-3">
          <WelcomeOption
            label="Yahuah (LORD)"
            description="The restored Hebrew name as Yoshi reads it, pronounced per Josephus Wars 5.5.7&rsquo;s four-vowel shape."
            onClick={() => pick("yahuah")}
          />
          <WelcomeOption
            label="YHWH (LORD)"
            description="The Hebrew consonants &mdash; no pronunciation taken. Choose this if you hold a different pronunciation tradition (Yahweh, Jehovah, or another)."
            onClick={() => pick("yhwh")}
          />
        </div>

        <p className="mt-4 font-sans text-xs italic text-[var(--reader-muted)]">
          You can change this anytime in Settings.
        </p>
      </div>
    </div>
  );
}

/**
 * One option card in the welcome modal. Equal-weight visual register
 * across both options — no pre-highlighted default per the S172 spec.
 */
function WelcomeOption({
  label,
  description,
  onClick,
}: {
  label: string;
  description: string;
  onClick: () => void;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      className="block w-full rounded-md border border-[var(--reader-rule)] bg-[var(--reader-bg)] px-4 py-3 text-left hover:border-[var(--reader-accent)] hover:bg-[var(--reader-surface-elev)]"
    >
      <div className="text-base font-semibold text-[var(--reader-text)]">
        {label}
      </div>
      <div
        className="mt-1 font-sans text-xs leading-relaxed text-[var(--reader-muted)]"
        dangerouslySetInnerHTML={{ __html: description }}
      />
    </button>
  );
}
