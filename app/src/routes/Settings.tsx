import DownloadsSettings from "../components/DownloadsSettings";
import { useFontSize } from "../lib/useFontSize";
import { useTheme } from "../lib/theme";
import { useParentheticalsToggle } from "../lib/useParentheticalsToggle";
import { useSacredNameMask } from "../lib/useSacredNameMask";
import { clearNativeToken } from "../lib/native-auth";

/**
 * S172 — Settings → Reader preferences page.
 *
 * Lives at `/settings`. Top-level route handled by App.tsx's pathname
 * switch alongside `/pricing`, `/manage`, `/sign-in`. Reachable from
 * the new ⚙ Settings button in the top-right chrome cluster.
 *
 * Layout: single-column reader-surface page, one card per preference.
 * The leading preference is the new sacred-name display mask (Yahuah
 * / YHWH) — the partner can change their first-launch choice anytime
 * here. Existing preferences (theme, parens-hide) are surfaced here
 * as the canonical control; the in-reader quick-access toggles
 * continue to work in parallel and stay in sync via shared
 * localStorage keys.
 *
 * Future S172+ preferences scaffolded but not yet wired: font-size,
 * interlinear-default, TTS voice. Each gets its own card when the
 * underlying state is lifted into a shared hook.
 *
 * Anonymous-safe: every preference is localStorage-backed. Signed-in
 * partners get server-side persistence via the S173 display-prefs
 * sync (users.display_prefs JSONB + GET/PUT /v1/me/display-prefs +
 * the pullAndReconcile-on-mount + pushSnapshot-on-set flow in
 * lib/display-prefs-sync.ts). Cross-device sync covers the
 * sacred-name mask, the parentheticals-hide toggle, and any future
 * recognized key as it lands. No tier gate; Settings is free for
 * every partner.
 *
 * S174 — "Synced across devices when signed in" affordance added to
 * the Sacred-name card. Small utility footnote below the segmented
 * control; reads as anonymous invitation ("this would sync if I
 * signed in") AND as signed-in confirmation ("this is syncing").
 * Sacred name only per S174 brief scope — the parentheticals card
 * and theme card sync too, but the Sacred name card carries the
 * affordance as the lead preference where the partner first meets
 * the sync behavior.
 */
/**
 * Sign out — clears the session on BOTH web and native, then full-reloads.
 *
 * clearNativeToken() removes the native JWT (Capacitor Preferences + the
 * in-memory cache) on native, and clears the rop_jwt cookie on web. We
 * additionally clear the cookie for the host-only and the parent-domain
 * (.remnantofpromise.org — the variant the WP SSO bridge sets) forms so
 * no stale cookie survives on web. A full navigation to /read then resets
 * all in-memory auth state and re-renders the signed-out chrome.
 *
 * Reader-app compliant: a plain sign-out control carries no purchase,
 * pricing, or donate affordance, so it is safe on the native shells.
 */
async function handleSignOut(): Promise<void> {
  try {
    await clearNativeToken();
  } catch {
    // best-effort — proceed to cookie-clear + reload regardless
  }
  if (typeof document !== "undefined") {
    const base = "rop_jwt=; path=/; max-age=0; SameSite=Lax; Secure";
    document.cookie = base;
    document.cookie = base + "; domain=.remnantofpromise.org";
    document.cookie = base + "; domain=bible.remnantofpromise.org";
  }
  if (typeof window !== "undefined") {
    window.location.assign("/read");
  }
}

function SignOutCard() {
  return (
    <SettingsCard
      title="Account"
      description="Sign out of this device. Your notes, highlights, and reading position stay saved to your account and return when you sign back in."
    >
      <button
        type="button"
        onClick={() => void handleSignOut()}
        className="inline-flex items-center justify-center rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-2 font-sans text-sm font-medium text-[var(--reader-text)] hover:opacity-80"
      >
        Sign out
      </button>
    </SettingsCard>
  );
}

export default function Settings() {
  const { mask: sacredNameMask, set: setSacredNameMask } = useSacredNameMask();
  const { hide: hideParentheticals, set: setHideParentheticals } =
    useParentheticalsToggle();
  const { theme, set: setTheme } = useTheme();
  const { fontSize, set: setFontSize } = useFontSize();

  return (
    <main className="mx-auto w-full max-w-2xl px-4 py-8 sm:px-6">
      <header className="mb-6 border-b border-[var(--reader-rule)] pb-4">
        <a
          href="/"
          className="font-sans text-xs font-medium uppercase tracking-wider text-[var(--reader-accent)] hover:opacity-80"
        >
          ← Back to reading
        </a>
        <h1 className="mt-3 text-2xl font-semibold text-[var(--reader-text)]">
          Settings
        </h1>
        <p className="mt-1 font-sans text-sm text-[var(--reader-muted)]">
          Reader preferences. Changes save automatically.
        </p>
      </header>

      <div className="space-y-5">
        {/* 1. Sacred-name display — the S172 lead preference. The
            first-launch modal's question lives here as the canonical
            control. */}
        <SettingsCard
          title="Sacred name"
          description="How the four-letter Name appears in scripture. The framework reads Yahuah per Josephus Wars 5.5.7's four-vowel pronunciation. If you hold another tradition (Yahweh, Jehovah, or other), choose YHWH and the Hebrew consonants render without taking a pronunciation stance."
        >
          <SegmentedControl
            value={sacredNameMask}
            onChange={setSacredNameMask}
            options={[
              { value: "yahuah", label: "Yahuah" },
              { value: "yhwh", label: "YHWH" },
            ]}
            ariaLabel="Sacred-name display"
          />
          {/* S174 — cross-device sync affordance. Small footnote
              under the control. Reads honestly for both states:
              anonymous partner reads it as the value sign-in adds;
              signed-in partner reads it as confirmation of what's
              already happening via the S173 display-prefs sync. */}
          <p className="mt-2 font-sans text-xs italic text-[var(--reader-muted)]">
            Synced across devices when signed in.
          </p>
        </SettingsCard>

        {/* 2. English helper parentheticals — existing S144 toggle,
            relocated from the in-reader chrome into Settings as the
            canonical control. The chrome toggle stays as a shortcut. */}
        <SettingsCard
          title="English helpers"
          description="The English-form parentheticals after restored names — e.g., 'Yahuah (LORD)' or 'Mosheh (Moses)'. Hide them once you've learned the restored names so the reading runs cleaner."
        >
          <SegmentedControl
            value={hideParentheticals ? "hidden" : "shown"}
            onChange={(v) => setHideParentheticals(v === "hidden")}
            options={[
              { value: "shown", label: "Show" },
              { value: "hidden", label: "Hide" },
            ]}
            ariaLabel="English helper parentheticals"
          />
        </SettingsCard>

        {/* 3. Reader theme — existing toggle, lifted into Settings.
            Chrome toggle stays as a quick-access affordance. */}
        <SettingsCard
          title="Theme"
          description="Dark for night reading, light for day. The chrome toggle in the top bar does the same thing — this is just the canonical control."
        >
          <SegmentedControl
            value={theme}
            onChange={(v) => setTheme(v as "dark" | "light")}
            options={[
              { value: "dark", label: "Dark" },
              { value: "light", label: "Light" },
            ]}
            ariaLabel="Reader theme"
          />
        </SettingsCard>

        {/* 4. Font size — S356. Scales the whole reading column (verse
            text, verse numbers, chapter heading, cross-reference cards,
            and end-of-chapter commentary) via the --reader-font-scale
            multiplier driven by data-reader-font on <html>. Medium is the
            shipped default register. */}
        <SettingsCard
          title="Font size"
          description="Size of the scripture reading text. Scales the whole reading column together — verse text, verse numbers, headings, cross-reference cards, and commentary. Medium is the default."
        >
          <SegmentedControl
            value={fontSize}
            onChange={setFontSize}
            options={[
              { value: "small", label: "S" },
              { value: "medium", label: "M" },
              { value: "large", label: "L" },
              { value: "xlarge", label: "XL" },
            ]}
            ariaLabel="Reader font size"
          />
          {/* Live preview line — scaled with the same variable so the
              partner sees the chosen step before scrolling back into the
              reader. */}
          <p
            className="mt-3 italic text-[var(--reader-text)]"
            style={{ fontSize: "calc(1.05rem * var(--reader-font-scale))" }}
          >
            For Yahuah is great, and greatly to be praised.
          </p>
          <p className="mt-2 font-sans text-xs italic text-[var(--reader-muted)]">
            Synced across devices when signed in.
          </p>
        </SettingsCard>

        {/* 5. Downloads — Phase 2 offline. Its own self-contained card
            (resolves the partner tier + content-cache scope internally,
            since Settings renders outside the Reader). */}
        <DownloadsSettings />

        {/* Scaffolded for follow-up wheels — surfaced as Coming soon
            so partners know the preferences will land here.
            Interlinear-default + TTS voice land when their respective
            hooks get lifted into Settings. (Font size shipped in S356.) */}
        <SignOutCard />

        <SettingsCard
          title="More coming"
          description="Interlinear default and TTS voice preferences land in upcoming releases."
        >
          <p className="font-sans text-xs italic text-[var(--reader-muted)]">
            Coming soon.
          </p>
        </SettingsCard>
      </div>
    </main>
  );
}


// ─────────────────────────────────────────────────────────────────────
// Local UI primitives — kept inside this file since they're scoped to
// Settings (Manage / Pricing have their own card patterns).
// ─────────────────────────────────────────────────────────────────────

interface SettingsCardProps {
  title: string;
  description: string;
  children: React.ReactNode;
}

function SettingsCard({ title, description, children }: SettingsCardProps) {
  return (
    <section className="rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4">
      <h2 className="text-base font-semibold text-[var(--reader-text)]">
        {title}
      </h2>
      <p className="mt-1 font-sans text-sm leading-relaxed text-[var(--reader-muted)]">
        {description}
      </p>
      <div className="mt-3">{children}</div>
    </section>
  );
}

interface SegmentedControlOption<T extends string> {
  value: T;
  label: string;
}

interface SegmentedControlProps<T extends string> {
  value: T;
  onChange: (next: T) => void;
  options: SegmentedControlOption<T>[];
  ariaLabel: string;
}

function SegmentedControl<T extends string>({
  value,
  onChange,
  options,
  ariaLabel,
}: SegmentedControlProps<T>) {
  return (
    <div
      role="radiogroup"
      aria-label={ariaLabel}
      className="inline-flex overflow-hidden rounded border border-[var(--reader-rule)]"
    >
      {options.map((opt) => {
        const selected = opt.value === value;
        return (
          <button
            key={opt.value}
            type="button"
            role="radio"
            aria-checked={selected}
            onClick={() => onChange(opt.value)}
            className={
              "px-4 py-1.5 font-sans text-sm transition-opacity " +
              (selected
                ? "bg-[var(--reader-text)] text-[var(--reader-bg)] font-semibold"
                : "bg-[var(--reader-surface)] text-[var(--reader-text)] hover:opacity-80")
            }
          >
            {opt.label}
          </button>
        );
      })}
    </div>
  );
}
