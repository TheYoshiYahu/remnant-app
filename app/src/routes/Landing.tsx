/**
 * Landing — S129 wheel.
 *
 * Lives at `/` on bible.remnantofpromise.org. Until S129 the bare
 * subdomain rendered the Reader directly, which means partners landing
 * from the WP nav + home-hero CTA were dropped into the verse pane
 * with no framing of what the surface is. This page is the brief frame
 * they meet first: v4 brand-mark, sacred-color register, one sentence
 * about what the reader is, and a single CTA into the reader proper
 * (now mounted at `/read`).
 *
 * Marketing-surface voice rule (locked S118). Restored sacred names do
 * NOT appear on the landing copy — that posture lives inside the app
 * body text where the partner has committed to the journey. Hebrew
 * names appear here only as a feature description (e.g., "Restored
 * sacred names" in the bullet list), not as inline replacements of
 * conventional English. Page-level copy uses God / Jesus / Israel.
 *
 * v4 sacred-color register (DESIGN_LANGUAGE §3 + S128 reskin):
 *   - techelet `#1A6FE5` — divine register; reserved on body chrome
 *   - argaman  `#8E4FB3` — covenant-body register; headings + accents
 *   - gold     `#caa84a` — priestly-witness register; CTA accent
 *
 * Brand-mark: brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png
 * (locked S127, copied into app/public/ as brand-mark-v4.png so the
 * Render Static Site deploy serves it alongside the bundle).
 */

const TECHELET = "#1A6FE5";
const ARGAMAN = "#8E4FB3";
const GOLD = "#caa84a";

/**
 * S175 — Android direct-distribution feature flag. Flip to `true`
 * AFTER the signed .apk is placed at
 * `app/public/download/remnant-bible-v1.0.0.apk` and deployed live.
 * Until then the Landing-page Android affordance below stays hidden
 * (anti-false-promise — don't claim the .apk is downloadable until
 * it is). The marketing-site index.html carries the matching flag
 * as an HTML comment block — uncomment when this flips. See
 * S175_GRADLE_BUILD_RUNBOOK.md "Flipping the CTAs live" section.
 */
const ANDROID_APK_LIVE = true;

export default function Landing() {
  // S175.1 — in the native Capacitor shell, skip Landing entirely and
  // bounce the partner straight into the app. Two reasons: (1) the
  // partner already committed to the journey when they tapped Install
  // on the .apk, so the framing surface is redundant; (2) without
  // this, the Android back button pops history back to / (Landing),
  // which feels like a leak — the home hub is the home surface in the
  // native app. window.location.replace() does NOT push a history
  // entry, so the back button from the hub has nothing to pop and
  // Android treats that as "exit the app" (the native expected
  // behavior for a back-press from the root surface).
  // S228 — the bounce target is now /today (the Today home hub), not
  // /read. The hub is the daily front door; the Reader is one tap away
  // from it via the prominent "Read" door.
  if (
    typeof window !== "undefined" &&
    (window as unknown as {
      Capacitor?: { isNativePlatform?: () => boolean };
    }).Capacitor?.isNativePlatform?.() === true
  ) {
    window.location.replace("/today");
    return null;
  }

  return (
    <div
      className="min-h-screen bg-[var(--reader-bg)] text-[var(--reader-text)]"
      style={{
        // Page-level CSS variable hook for the v4 sacred-color register.
        // The reader chrome elsewhere reads via --reader-* tokens; on the
        // landing we layer the three §3 registers on top so each surface
        // reads in its own color.
        ["--techelet" as string]: TECHELET,
        ["--argaman" as string]: ARGAMAN,
        ["--gold" as string]: GOLD,
      }}
    >
      <main className="mx-auto flex max-w-3xl flex-col items-center px-6 py-16 text-center">
        {/* Brand-mark hero. The asset itself carries the three sacred-color
            registers (techelet title, argaman tribe labels, gold menorahs),
            so the chrome around it stays restrained — the mark is the
            statement. Width clamps at 320px so it reads at desktop and
            mobile alike. */}
        <img
          src="/brand-mark-v4.png"
          alt="The Remnant of Promise — Official Study Bible"
          width={320}
          height={480}
          className="mb-10 w-[200px] max-w-full sm:w-[260px] md:w-[320px]"
          // Critical above-the-fold asset; eager-load.
          loading="eager"
          decoding="async"
        />

        {/* H1 in argaman per the website's §3 heading register. */}
        <h1
          className="mb-3 font-serif text-3xl font-semibold tracking-tight sm:text-4xl md:text-5xl"
          style={{ color: ARGAMAN }}
        >
          The Remnant of Promise
          <br />
          <span className="text-2xl sm:text-3xl md:text-4xl">
            Official Study Bible
          </span>
        </h1>

        {/* Subtitle in muted body register, kept short. */}
        <p className="mb-10 max-w-xl text-base text-[var(--reader-muted)] sm:text-lg">
          A reading Bible that lets the canon speak plainly — with the
          restored sacred names, the apocrypha and pseudepigrapha kept
          alongside, and commentary that reads the text as one continuous
          covenant story.
        </p>

        {/* Primary CTA into the Today home hub at /today. Bordered-chrome
            button family per DESIGN_LANGUAGE §1, with the gold accent
            border carrying the priestly-witness register.
            S228 — the front door is now the Today hub (the daily gathering
            surface), with the Reader one tap away from it via the "Read"
            door. A secondary plain link below keeps a direct path straight
            into the Reader for partners who want it. */}
        <a
          href="/today"
          className="mb-3 inline-block rounded border-2 px-8 py-3 text-lg font-medium text-[var(--reader-bg)] transition hover:opacity-90"
          style={{
            backgroundColor: TECHELET,
            borderColor: GOLD,
          }}
          aria-label="Enter the study Bible — open Today, the home hub"
        >
          Enter the study Bible →
        </a>
        <a
          href="/read"
          className="mb-6 inline-block text-sm font-medium text-[var(--reader-accent)] underline-offset-4 hover:underline"
          aria-label="Go straight to the reader"
        >
          or go straight to the reader →
        </a>

        {/* S175 — Android-app affordance. Renders only on Android web
            browsers (visible right under the primary CTA so it's caught
            before the partner enters the reader) and hidden inside the
            native Capacitor shell. Gated by ANDROID_APK_LIVE so it
            only appears once the .apk is actually live at /download/. */}
        <AndroidLandingAffordance />

        {/* S220 — secondary door into The Appointed Times: the biblical
            calendar reckoned every way at once. A chrome-metal gold pill
            (the priestly / appointed-times register) so it reads as a
            sacred utility, not a second primary CTA. */}
        <a
          href="/calendar"
          className="chrome-metal chrome-metal-gold mt-4"
          style={{ borderRadius: 999, padding: "0.45rem 1.1rem", fontSize: "0.95rem" }}
          aria-label="Open The Appointed Times — the biblical calendar"
        >
          ☾ The Appointed Times — biblical calendar
        </a>

        <div className="mb-12" />

        {/* Brief frame — three short lines, no bullets, no marketing
            slabs. The site (remnantofpromise.org) already carries the
            full Statement of Faith + tier comparison; this surface is
            only the front door, not a sales page. */}
        <section
          aria-labelledby="frame-heading"
          className="w-full max-w-xl border-t border-[var(--reader-rule)] pt-8"
        >
          <h2
            id="frame-heading"
            className="mb-4 font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]"
          >
            What you're about to read
          </h2>
          <p className="mb-3 text-base text-[var(--reader-text)]">
            <span style={{ color: ARGAMAN }} className="font-semibold">
              Restored sacred names.
            </span>{" "}
            The Hebrew divine name and the covenant names of God's people
            stand in the text — with the conventional English in
            parentheses so the verse reads cleanly either way.
          </p>
          <p className="mb-3 text-base text-[var(--reader-text)]">
            <span style={{ color: ARGAMAN }} className="font-semibold">
              The apocrypha and pseudepigrapha alongside.
            </span>{" "}
            The books the apostles knew — Jubilees, Enoch, Jasher, the
            Apocrypha — are kept next to the protestant canon, not
            walled off.
          </p>
          <p className="mb-8 text-base text-[var(--reader-text)]">
            <span style={{ color: ARGAMAN }} className="font-semibold">
              Commentary that reads the canon plainly.
            </span>{" "}
            Chapter introductions, cross-reference threads, and deeper
            treatments that follow the text where it leads, without
            inherited overlays.
          </p>

          {/* Account / partnership orientation — light, non-pushy. The
              tier ladder lives on remnantofpromise.org/read-the-scriptures
              for partners who want depth on what's free vs. paid. */}
          <p className="text-sm text-[var(--reader-muted)]">
            Free to read.{" "}
            <a
              href="/pricing"
              className="underline-offset-2 hover:underline"
              style={{ color: TECHELET }}
            >
              Partner tiers
            </a>{" "}
            unlock notes, the restored library, and the deeper commentary.
          </p>
        </section>

        {/* Footer mark — small, low-key link back to the assembly. */}
        <footer className="mt-16 text-xs text-[var(--reader-muted)]">
          A ministry of{" "}
          <a
            href="https://remnantofpromise.org"
            className="underline-offset-2 hover:underline"
            style={{ color: ARGAMAN }}
          >
            the Assembly of the Remnant of Promise
          </a>
          .
        </footer>
      </main>
    </div>
  );
}

// ─────────────────────────────────────────────────────────────────────
// S175 — Android direct-distribution affordance for the Landing page.
// Lives upstream of every read action (above the welcome-modal flow,
// above settings, above the reader itself) so an Android visitor
// finds the native-app path before committing to the PWA. UA-gated
// to Android browsers; hidden inside the native Capacitor shell;
// gated behind ANDROID_APK_LIVE so it does not claim the .apk is
// downloadable until it actually is.
// ─────────────────────────────────────────────────────────────────────

function AndroidLandingAffordance() {
  if (!ANDROID_APK_LIVE) return null;

  const isAndroidBrowser =
    typeof navigator !== "undefined" &&
    /Android/i.test(navigator.userAgent) &&
    !(
      typeof window !== "undefined" &&
      (window as unknown as { Capacitor?: { isNativePlatform?: () => boolean } })
        .Capacitor?.isNativePlatform?.()
    );

  if (!isAndroidBrowser) return null;

  return (
    <div
      className="mb-6 w-full max-w-xl rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-5 py-4 text-left"
    >
      <p className="mb-2 font-sans text-xs font-semibold uppercase tracking-wide" style={{ color: GOLD }}>
        On Android
      </p>
      <p className="mb-3 text-sm text-[var(--reader-text)]">
        The native Android app is available — faster cold start, native
        share sheets, and verse links open directly in the app instead
        of the browser.
      </p>
      <a
        href="https://github.com/TheYoshiYahu/remnant-app/releases/latest/download/remnant-bible.apk"
        className="inline-flex items-center rounded border px-4 py-1.5 font-sans text-sm font-semibold text-[var(--reader-bg)] hover:opacity-90"
        style={{ backgroundColor: ARGAMAN, borderColor: GOLD }}
      >
        Download the Android app
      </a>
      <p className="mt-2 font-sans text-xs italic text-[var(--reader-muted)]">
        Android will warn the file may be harmful — that's the standard
        outside-the-Play-Store caveat. Tap Install anyway.
      </p>
    </div>
  );
}
