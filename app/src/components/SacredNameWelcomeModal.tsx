import { useEffect, useState } from "react";
import {
  type SacredNameMask,
  useSacredNameMask,
  hasStoredSacredNamePreference,
} from "../lib/useSacredNameMask";
import { markSigninAskSeen } from "../lib/signinAsk";

/**
 * S172 + S174 — First-launch welcome modal, two-step flow.
 *
 * **S172 (original):** binary sacred-name question (Yahuah / YHWH)
 * before the partner began reading. Single step. The partner picked
 * a mask, the localStorage flag landed, the modal dismissed.
 *
 * **S174 (this extension):** the modal extends to two steps. Step 1
 * is the original sacred-name question; step 2 is a sign-in /
 * create-account ask that explains what signing in actually carries
 * (notes, bookmarks, highlights, reading position synced across
 * devices). The S174 anonymous "Sign in" chrome button added at
 * T2 tells partners HOW; this ask tells them WHY. Partner-orientation
 * register — the welcome modal is already a "tell me about you"
 * conversation; the sign-in ask lands once at the same moment instead
 * of nagging every chrome render.
 *
 * The two flags are independent: `rop_sacred_name_mask_v1` and
 * `rop_signin_ask_seen_v1`. The modal mounts whenever EITHER is unset
 * and the partner is NOT signed in (the App.tsx mount check reads
 * `hasJwtCookie()` from display-prefs-sync so signed-in partners
 * never see the ask). The `initialStep` prop tells the modal which
 * step to start at — App.tsx defaults to `"mask"` if the mask flag
 * is unset, `"signin"` if only the sign-in-ask flag is unset (the
 * existing-S172-tester catch-up case).
 *
 * Step 2 offers three paths:
 *
 *   - **Sign in or create an account** (primary action) — redirects
 *     to `/sign-in?return_to=<current path>`. The SignIn route
 *     surfaces both Log-In and Create-Account cards side by side,
 *     so the partner picks specific path on the next screen. Marks
 *     the sign-in-ask flag as seen before redirect so a partner who
 *     bails out of WordPress mid-auth doesn't re-loop the ask.
 *   - **Not now — continue reading** (secondary action) — marks
 *     the sign-in-ask flag as seen and dismisses the modal. The
 *     framework's posture is "text always free; account is the
 *     doorway to YOUR work persisting," so skipping is a real,
 *     clean option, never a guilt-trip.
 *
 * Voice register: utility copy with framework-aware framing. The
 * ask sells the persistence value (your work travels with you),
 * never gates the text. Title is action-forward ("Save your work
 * across devices"); body explains specifically what carries.
 *
 * Visual register: same bg-black/40 backdrop + bordered-chrome modal
 * family as HighlightPicker / StrongsLookup. Step 1 keeps the two
 * equal-weight tap-target cards (Yahuah / YHWH); step 2 uses the
 * primary-action + secondary-skip register (one bold CTA + one quiet
 * dismiss) to signal "this is optional" without making either path
 * feel forced.
 *
 * Anonymous-safe: localStorage writes only. The redirect path
 * (to /sign-in) only fires when the partner taps the primary CTA —
 * no auto-navigation, no silent fallthrough.
 */

type ModalStep = "mask" | "signin";

export default function SacredNameWelcomeModal({
  onClose,
  initialStep = "mask",
}: {
  onClose: () => void;
  initialStep?: ModalStep;
}) {
  const { set: setMask } = useSacredNameMask();
  const [step, setStep] = useState<ModalStep>(initialStep);

  // S175 — detect Capacitor native shell. In the native Android app
  // the WP sign-in flow can't complete (cookies don't cross the
  // localhost-origin webview boundary), so the sign-in step is
  // suppressed entirely. Native partners read anonymously; account-
  // gated features (notes, bookmarks, highlights, sync) live on the
  // PWA at bible.remnantofpromise.org. Proper native auth is V1.1+.
  const isNative =
    typeof window !== "undefined" &&
    (window as unknown as {
      Capacitor?: { isNativePlatform?: () => boolean };
    }).Capacitor?.isNativePlatform?.() === true;

  // Pre-mount safety: if the mask preference somehow got set between
  // the caller's initial check and our mount (race against another
  // tab on the mask question specifically), advance step 1 → step 2
  // instead of dismissing — the partner still needs to see the
  // sign-in ask. Belt-and-suspenders. EXCEPT in native: skip the
  // sign-in step entirely and just dismiss.
  useEffect(() => {
    if (step === "mask" && hasStoredSacredNamePreference()) {
      if (isNative) {
        markSigninAskSeen();
        onClose();
      } else {
        setStep("signin");
      }
    }
  }, [step, isNative, onClose]);

  function pickMask(mask: SacredNameMask): void {
    setMask(mask);
    // In native: mark the sign-in ask as seen (so we never re-loop
    // the modal looking for it) and close immediately. Skip step 2.
    if (isNative) {
      markSigninAskSeen();
      onClose();
      return;
    }
    setStep("signin");
  }

  function buildSignInUrl(): string {
    if (typeof window === "undefined") return "/sign-in";
    const returnTo = window.location.pathname + window.location.search;
    const params = new URLSearchParams({ return_to: returnTo });
    return `/sign-in?${params.toString()}`;
  }

  function goToSignIn(): void {
    markSigninAskSeen();
    if (typeof window !== "undefined") {
      window.location.assign(buildSignInUrl());
    } else {
      onClose();
    }
  }

  function skipSignIn(): void {
    markSigninAskSeen();
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
        className="max-h-[92vh] w-full max-w-md overflow-y-auto rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-5 shadow-xl"
        onClick={(e) => e.stopPropagation()}
      >
        <h2
          id="sacred-name-welcome-title"
          className="text-base font-semibold text-[var(--reader-text)]"
        >
          The Remnant of Promise Official Study Bible
        </h2>

        {step === "mask" ? (
          <MaskStep onPick={pickMask} />
        ) : (
          <SigninStep onSignIn={goToSignIn} onSkip={skipSignIn} />
        )}
      </div>
    </div>
  );
}

/**
 * Step 1 — sacred-name choice. Same content as the S172 single-step
 * modal: two equal-weight option cards, no pre-highlighted default,
 * settings-pointer footer.
 */
function MaskStep({
  onPick,
}: {
  onPick: (mask: SacredNameMask) => void;
}) {
  return (
    <>
      <p className="mt-3 font-sans text-sm leading-relaxed text-[var(--reader-text)]">
        Before you begin reading, choose how you&rsquo;d like the
        sacred name to appear in scripture:
      </p>

      <div className="mt-4 space-y-3">
        <WelcomeOption
          label="Yahuah (LORD)"
          description="The restored Hebrew name as Yoshi reads it, pronounced per Josephus Wars 5.5.7&rsquo;s four-vowel shape."
          onClick={() => onPick("yahuah")}
        />
        <WelcomeOption
          label="YHWH (LORD)"
          description="The Hebrew consonants &mdash; no pronunciation taken. Choose this if you hold a different pronunciation tradition (Yahweh, Jehovah, or another)."
          onClick={() => onPick("yhwh")}
        />
      </div>

      <p className="mt-4 font-sans text-xs italic text-[var(--reader-muted)]">
        You can change this anytime in Settings.
      </p>
    </>
  );
}

/**
 * Step 2 — sign-in ask. Primary CTA routes to /sign-in (which
 * surfaces both Log-In and Create-Account paths). Secondary "Not
 * now" dismisses cleanly. Voice-checked copy explains what sign-in
 * actually carries — persistence of partner-specific reader state —
 * without gating the text or framing the skip as a loss.
 */
function SigninStep({
  onSignIn,
  onSkip,
}: {
  onSignIn: () => void;
  onSkip: () => void;
}) {
  return (
    <>
      <p className="mt-3 font-sans text-base font-semibold text-[var(--reader-text)]">
        Don&rsquo;t lose your work
      </p>
      <p className="mt-2 font-sans text-sm leading-relaxed text-[var(--reader-muted)]">
        You&rsquo;re reading free &mdash; and that never changes. But your
        highlights, notes, bookmarks, and your place stay on this device
        only, and vanish if you reinstall or switch phones. A free account
        keeps all of it, and carries it to every device you read on.
      </p>

      <p className="mt-3 rounded-md border border-[var(--reader-accent)] bg-[var(--reader-bg)] px-3 py-2 text-center font-sans text-sm font-semibold text-[var(--reader-text)]">
        Your first 7 days unlock every feature &mdash; free, no card needed.
      </p>

      <img
        src="/promo/account-collage.png"
        alt="Inside the app: 12 highlight colors, your own color meanings, exhaustive cross-references, and every extra-canonical book — all saved to your account."
        loading="lazy"
        className="mt-4 w-full rounded-md border border-[var(--reader-rule)]"
      />
      <p className="mt-2 text-center font-sans text-xs italic text-[var(--reader-muted)]">
        Everything that comes with your free account
      </p>

      <div className="mt-4 space-y-3">
        <button
          type="button"
          onClick={onSignIn}
          className="block w-full rounded-md border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-3 text-center text-base font-semibold text-[var(--reader-bg)] hover:opacity-90"
        >
          Create my free account
        </button>
        <button
          type="button"
          onClick={onSkip}
          className="block w-full rounded-md border border-[var(--reader-rule)] bg-transparent px-4 py-2 text-center text-sm font-medium text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
        >
          Not now &mdash; continue reading
        </button>
      </div>

      <p className="mt-4 font-sans text-xs italic text-[var(--reader-muted)]">
        Everything you do is saved to your account &mdash; your
        highlights, notes, bookmarks, and your place &mdash; and it stays
        waiting for you on every device, even when you upgrade later.
      </p>
    </>
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
