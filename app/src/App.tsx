import { Fragment, useEffect, useMemo, useRef, useState, type ReactNode } from "react";
import {
  type BookChaptersResponse,
  type Bookmark,
  type BookSummary,
  type ChapterDetail,
  type ChapterWordsResponse,
  type ContentTier,
  type Highlight,
  type NoteEntry,
  type PartnerTier,
  type SubscriptionMe,
  type VerseSearchHit,
  type VerseWord,
  type WitnessEntry,
  type KingdomEntry,
  deleteHighlight,
  getChapter,
  getChapterWitness,
  getChapterKingdom,
  getChapterWords,
  getSubscriptionMe,
  listBooks,
  listChapters,
  listChapterBookmarks,
  listChapterHighlights,
  listNotes,
} from "./lib/api";
import Pricing from "./routes/Pricing";
import Manage from "./routes/Manage";
import SignIn from "./routes/SignIn";
import Landing from "./routes/Landing";
import Settings from "./routes/Settings";
import Attributions from "./routes/Attributions";
import AuthCallback from "./routes/AuthCallback";
import Calendar from "./routes/Calendar";
import Today from "./routes/Today";
import SacredNameWelcomeModal from "./components/SacredNameWelcomeModal";
import { hasStoredSacredNamePreference } from "./lib/useSacredNameMask";
import { hasSeenSigninAsk } from "./lib/signinAsk";
import { hasJwtCookie } from "./lib/display-prefs-sync";
import { loadStoredNativeToken } from "./lib/native-auth";
import OfflineDownloadPrompt from "./components/OfflineDownloadPrompt";
import { readThrough, setContentCacheScope } from "./lib/contentCache";
import ChapterEndCard from "./components/ChapterEndCard";
import ReaderDivider from "./components/ReaderDivider";
import WitnessCard from "./components/WitnessCard";
import WitnessEndCard from "./components/WitnessEndCard";
import KingdomCard from "./components/KingdomCard";
import KingdomEndCard from "./components/KingdomEndCard";
import ArrangedReading from "./components/ArrangedReading";
import HighlightPicker, {
  markClassFor,
  markCssVarsFor,
} from "./components/HighlightPicker";
import { HIGHLIGHT_HEX } from "./lib/api";
import StrongsLookup from "./components/StrongsLookup";
import LexiconSheet from "./components/LexiconSheet";
import VincentsSheet from "./components/VincentsSheet";
import NikkudotSheet from "./components/NikkudotSheet";
import TskSheet from "./components/TskSheet";
import NavesSheet from "./components/NavesSheet";
import MapsSheet from "./components/MapsSheet";
import CompareSheet from "./components/CompareSheet";
import VerseActionMenu, {
  type MenuItem,
  type MenuSection,
} from "./components/VerseActionMenu";
import RangeActionPicker from "./components/RangeActionPicker";
import {
  executeCopy,
  executeShare,
  preloadBrandMark,
  type RangeMeta,
  type VerseRender,
} from "./lib/share-card-render";
import BookmarkSheet from "./components/BookmarkSheet";
import NotesPanel, { type PendingAnchor } from "./components/NotesPanel";
import BookmarksIndex from "./components/BookmarksIndex";
import MyStudy from "./components/MyStudy";
import SearchModal from "./components/SearchModal";
import AudioPlayer from "./components/AudioPlayer";
import { getTTSEngine, type TTSVoice } from "./lib/tts";
import {
  prepareVerseForSpeech,
  loadTTSPrefs,
  saveTTSPrefs,
  pickBestVoice,
  type TTSPrefs,
} from "./lib/tts-helpers";
import { alignVerse, type Segment } from "./lib/verse-align";
import {
  IDLE_STATE as RANGE_IDLE,
  type RangeSelectionState,
  type RangeVerseRef,
  cancel as rangeCancel,
  commitEnd as rangeCommitEnd,
  isSameChapter as rangeIsSameChapter,
  resolveSameChapterRange,
  sameChapterRangeSize,
  startSelecting as rangeStartSelecting,
} from "./lib/range-selection";
import { renderMarkdownBody } from "./lib/markdown";
import { useParentheticalsToggle } from "./lib/useParentheticalsToggle";
import { useSacredNameMask } from "./lib/useSacredNameMask";
import { bookPillClassName, classifyBookSlug } from "./lib/book-source-class";
import { useStrongsSuperscriptsToggle } from "./lib/useStrongsSuperscriptsToggle";
import { useStudyBarCollapsed } from "./lib/useStudyBarCollapsed";
import {
  isAtCompanionTier,
  useInterlinearToggle,
} from "./lib/useInterlinearToggle";
import {
  InterlinearWordColumn,
  preloadInterlinearFonts,
} from "./components/InterlinearLayer";
import { useTheme } from "./lib/theme";
import {
  cancelPendingSave,
  loadInitialPosition,
  saveReadingPositionDebounced,
} from "./lib/reading-position";
import {
  lastChapterNumber,
  nextChapterTarget,
  prevChapterTarget,
  targetLabel,
} from "./lib/chapter-nav";
import paragraphStartsData from "./data/paragraph_starts.json";
import { pullAndReconcile } from "./lib/display-prefs-sync";
import { installDeepLinkRouter } from "./lib/deep-link";

// S115 Wheel 3 — chrome theme toggle. Small button placed to the
// left of the subscription CTA. Sun glyph when dark (click to go light);
// moon glyph when light (click to go dark). The button itself uses the
// existing light/bordered chrome button styling so it reads as part of
// the chrome button family. Persistence + DOM-attribute flip lives in
// lib/theme.ts; this component is the surface.
//
// S117 — visible text label added next to the glyph per Yoshi's
// feedback that the icon-only version was hard to find. Glyph stays as
// the visual hook; the label makes the affordance discoverable.
//
// S130 — theme toggle redesigned per Yoshi's spec. Two-cell segmented
// control: shared "MODE" header above, sun + "Light" left cell, moon +
// "Dark" right cell. The active mode renders with a techelet border
// and tinted surface so the reader sees which mode is current at a
// glance; the inactive cell is clickable to switch. Replaces the prior
// single-button "Urim & Thummim" label (which was an invented coinage
// and is not used anywhere on remnantofpromise.org — corrected here).
function ThemeToggle() {
  const { theme, toggle } = useTheme();
  const isDark = theme === "dark";
  // S172.10 — each cell carries the COLOR OF THE MODE IT REPRESENTS,
  // not the same silver-on-selected treatment for both. Light cell
  // always renders in a light/silver register (parchment + bright
  // chrome); Dark cell always renders in an onyx register (deep
  // charcoal). Selected state stays fully saturated; unselected dims
  // to ~55% opacity so the partner always sees what they'd switch TO
  // at a glance. Resolves the prior bug where both cells used the
  // same silver gradient and the "active" state was the only
  // distinguishing signal.
  const lightCellBase =
    "border-[#E5E7EB] text-[#1A1A1A] [background-image:linear-gradient(to_right,#FAFAF7_0%,#FFFFFF_50%,#FAFAF7_100%)]";
  const darkCellBase =
    "border-[#7C7D82] text-[#F3F4F6] [background-image:linear-gradient(to_right,#0F0F11_0%,#3F4146_50%,#0F0F11_100%)]";
  return (
    <div className="flex flex-col items-center gap-1" aria-label="Mode">
      <span className="font-sans text-[10px] font-semibold uppercase tracking-wide text-[#1A6FE5]">
        Mode
      </span>
      <div role="group" aria-label="Light or Dark mode" className="flex gap-1">
        <button
          type="button"
          onClick={() => {
            if (isDark) toggle();
          }}
          aria-pressed={!isDark}
          aria-label="Switch to light mode"
          title="Switch to light mode"
          className={
            "flex flex-col items-center rounded border px-2.5 py-1 text-[11px] font-medium transition-opacity " +
            lightCellBase +
            (!isDark ? " opacity-100" : " opacity-55 hover:opacity-80")
          }
        >
          <span aria-hidden="true" className="text-base leading-none">☀</span>
          <span className="mt-0.5">Light</span>
        </button>
        <button
          type="button"
          onClick={() => {
            if (!isDark) toggle();
          }}
          aria-pressed={isDark}
          aria-label="Switch to dark mode"
          title="Switch to dark mode"
          className={
            "flex flex-col items-center rounded border px-2.5 py-1 text-[11px] font-medium transition-opacity " +
            darkCellBase +
            (isDark ? " opacity-100" : " opacity-55 hover:opacity-80")
          }
        >
          <span aria-hidden="true" className="text-base leading-none">☾</span>
          <span className="mt-0.5">Dark</span>
        </button>
      </div>
    </div>
  );
}

// Map of {book_slug: {chapter_number_string: [verse numbers that start paragraphs]}}.
// Extracted from the KJV USFX XML at restoration-pipeline build time;
// see /tmp/extract_paragraphs.py in S110. Used to render the reader chapter
// with proper pericope-style paragraph breaks rather than verse-per-line or
// one giant run-on paragraph.
const paragraphStarts = paragraphStartsData as Record<string, Record<string, number[]>>;

// S232 — apocrypha de-duplication. Two apocrypha editions are live: the KJV
// 1611 `apocrypha` edition and the Charles-1913 `apocrypha-charles-vol1`
// edition. They overlap on every book except 3 Maccabees (Charles-only) and
// 2 Esdras (KJV-only), so the reader was listing two Tobits / Judiths /
// Maccabees / etc. The KJV edition is consistently the more complete text
// (more verses on every shared book), so we KEEP `apocrypha` and suppress the
// Charles-vol1 duplicates from the picker/nav — keeping only its unique book,
// 3 Maccabees. This is a SAFE, reversible display filter: the DB rows are
// untouched (deleting the filter restores them), and the API still resolves
// the five literally-colliding slugs (1-esdras, 1/2-maccabees, judith, tobit)
// to the KJV edition (lowest book id; see api/main.py ORDER BY b.id).
function isSuppressedDuplicate(b: BookSummary): boolean {
  return (
    b.edition_slug === "apocrypha-charles-vol1" && b.slug !== "3-maccabees"
  );
}

// S204b — the four partner-choosable Witness verse treatments.
type WitnessStyle = "text" | "quotes" | "highlight" | "capsule";

const WITNESS_STYLE_LABELS: Record<WitnessStyle, string> = {
  text: "Red text",
  quotes: "Red quotes",
  highlight: "Highlight",
  capsule: "Capsule",
};

// S214 — the partner-choosable Kingdom verse treatments. "quotes" is the
// original S205 two-tone quote pair (emerald outside, gold inside);
// "underline" draws the same two-tone register as a gradient underline
// beneath the member verse instead of the bracketing glyphs.
type KingdomStyle = "quotes" | "underline";

const KINGDOM_STYLE_LABELS: Record<KingdomStyle, string> = {
  quotes: "Two-tone quotes",
  underline: "Two-tone underline",
};

/**
 * Session 13 minimum-useful checkpoint:
 *   reader-on-localhost-5173 against the live API at bible.remnantofpromise.org,
 *   showing Genesis 1 from the Protestant 66 canon (KJV-restored) by default
 *   and letting the reader pick any other canon book / chapter.
 *
 * Session 36 — JWT-aware: cookie + Authorization header attached on every
 *   API call via api.ts; the API filters book list by partner_tier.
 *
 * Session 38 — pathname-based view switch + me-aware chrome:
 *   "/" → Reader; "/pricing" → Pricing surface. GET /v1/subscriptions/me
 *   on mount; chrome shows "Manage subscription" if status=active else
 *   "Become a partner" linking to /pricing.
 *
 * Session 39 — cancellation flow:
 *   "/manage" → Manage surface (current subscription details + Cancel
 *   button with voice-gated confirm copy: no "are you sure", no "we'll
 *   miss you", no spiritual-consequences framing — the partner is told
 *   their access continues through period-end, they can resubscribe
 *   anytime, and the forever-locked price stays with them).
 *
 * Session 40 — PWA on production:
 *   The Vite-built bundle now ships as a Render Static Site at the bare
 *   bible.remnantofpromise.org subdomain (per hosting/render.yaml's new
 *   remnant-app-pwa service). The FastAPI API moved to
 *   api.bible.remnantofpromise.org (lib/api.ts's default API_BASE). The
 *   book-picker option key fix (b.id, not b.slug) clears the duplicate-
 *   key console warnings that landed when Session 35 widened books.slug
 *   UNIQUE to composite (edition_id, slug). The dev-only ?dev_jwt=
 *   handler stays — production builds strip it via import.meta.env.DEV.
 *
 * No router library — single pathname check at App-render time is enough
 * for three routes and keeps the dep list at React-only. Stripe checkout
 * navigates the browser away via window.location.href so we never need
 * client-side route swapping mid-flow.
 */
export default function App() {
  // Pathname-based view switch. Recomputed only at mount + on popstate;
  // navigation in the app is browser-native (window.location.href = ...).
  const [pathname, setPathname] = useState<string>(
    typeof window !== "undefined" ? window.location.pathname : "/"
  );
  useEffect(() => {
    const onPop = () => setPathname(window.location.pathname);
    window.addEventListener("popstate", onPop);
    return () => window.removeEventListener("popstate", onPop);
  }, []);

  // S172 + S174 — first-launch welcome modal.
  //
  // **S172 (original):** sacred-name display mask question (Yahuah /
  // YHWH). Fired once per device on the first session where no
  // rop_sacred_name_mask_v1 key existed in localStorage. After the
  // partner picked, the key was written and the modal stayed
  // dismissed forever on this device.
  //
  // **S174 (extension):** the modal is now a two-step flow. Step 1
  // is the original mask question; step 2 is a sign-in / create-
  // account ask that explains what signing in carries (notes,
  // bookmarks, highlights, reading position synced across devices).
  // The mount condition expanded accordingly:
  //
  //   - **Signed-in partner (JWT cookie present)** — modal never
  //     mounts. They're already signed in; the ask is moot.
  //   - **On the /sign-in route** — modal never mounts. The partner
  //     is intentionally in the auth flow; talking over them with a
  //     "sign in or create an account" ask would be silly.
  //   - **Otherwise mount when either flag is unset:**
  //     `!hasStoredSacredNamePreference()` (S172 case — fresh device)
  //     OR `!hasSeenSigninAsk()` (S174 case — existing S172 tester
  //     who already set the mask but hasn't seen the sign-in ask
  //     yet). The initial step is `"mask"` if the mask flag is
  //     unset, `"signin"` if only the sign-in-ask flag is unset.
  const [welcomeOpen, setWelcomeOpen] = useState<boolean>(() => {
    if (typeof window === "undefined") return false; // SSR — never
    if (hasJwtCookie()) return false;                // signed-in — skip
    if (window.location.pathname.startsWith("/sign-in")) return false;
    // S176 — suppress the welcome modal on /auth-callback too. The
    // partner is mid-sign-in flow; the modal mounting on top would be
    // disorienting (and likely flash for a beat before the route
    // redirects to /read on success).
    if (window.location.pathname.startsWith("/auth-callback")) return false;
    // S188 — suppress on the Landing page (`/`). The sacred-name
    // question is a reader-time decision (it controls the mask applied
    // to verse text); ambushing a partner with it on the marketing
    // landing surface, BEFORE they've chosen to enter the reader, is
    // disorienting and theologically front-loaded. The Landing CTA is
    // a plain `<a href="/read">` (full-page navigation), so by the
    // time the partner is on `/read`, App remounts and this initializer
    // re-runs with pathname=/read — the modal surfaces there.
    if (window.location.pathname === "/") return false;
    // S220 — suppress on /calendar. The Appointed Times is a standalone,
    // auth-free surface (it doubles as the engine's live demo); the
    // sacred-name / sign-in ask is a reader-time decision and would only
    // talk over the calendar here.
    if (window.location.pathname.startsWith("/calendar")) return false;
    // S228 — suppress on /today, the home hub and post-auth front door. Same
    // rationale as `/` and /calendar: the sacred-name / sign-in ask is a
    // reader-time decision and would only talk over the daily gathering
    // surface. The modal surfaces when the partner taps into /read (App
    // remounts there and this initializer re-runs with pathname=/read).
    if (window.location.pathname.startsWith("/today")) return false;
    return !hasStoredSacredNamePreference() || !hasSeenSigninAsk();
  });
  // initialStep captured once at mount; the modal manages step state
  // internally after that. Computed via useState initializer (same
  // single-call semantics) so we don't re-evaluate on every render.
  const [welcomeInitialStep] = useState<"mask" | "signin">(() =>
    hasStoredSacredNamePreference() ? "signin" : "mask"
  );

  // S127 W7 — preload + img.decode() the share-card brand-mark at app
  // init per DESIGN_LANGUAGE.md §24, so the first Copy/Share tap
  // renders without an asset-fetch round-trip in the canvas pipeline.
  // Fires once at mount; the loader is a singleton so additional calls
  // are no-ops. Failure is non-fatal — the canvas render falls back to
  // a text-only watermark slot.
  useEffect(() => {
    void preloadBrandMark();
  }, []);

  // S173 — cross-device display-preferences sync. On mount, fetch the
  // server-canonical display_prefs (sacred_name_mask, hide_parentheticals
  // at S173 scope) and reconcile into localStorage. Per
  // S172_SACRED_NAME_MASK_SPEC "server preference wins over
  // localStorage if the two diverge." No-ops for anonymous callers (no
  // JWT cookie → no canonical state). After the helper writes any
  // server-canonical value, it dispatches `rop:display-prefs-changed`;
  // the useSacredNameMask + useParentheticalsToggle hooks listen and
  // re-read so the React tree updates without a reload.
  //
  // S176 — must load the native-shell JWT into the in-memory cache
  // BEFORE pullAndReconcile fires, because pullAndReconcile gates on
  // hasJwtCookie() which now also checks the native cache. Without
  // this ordering, a signed-in native partner's display prefs would
  // never sync server→local until next app launch. On web,
  // loadStoredNativeToken() is a no-op (returns null without touching
  // Preferences), so the PWA path is unaffected.
  useEffect(() => {
    void loadStoredNativeToken().then(() => {
      void pullAndReconcile();
    });
  }, []);

  // S173 — Capacitor deep-link router. Subscribes to @capacitor/app's
  // appUrlOpen so a bible.remnantofpromise.org/strongs/{N} link tapped
  // in iMessage (iOS Universal Link / Android App Link) lands inside
  // the app on the StrongsLookup modal for that entry. No-op on web
  // (Capacitor.isNativePlatform() === false) — the web bundle handles
  // the URL via the Render 302 redirect to the api subdomain instead.
  useEffect(() => {
    let teardown: () => void = () => {};
    void installDeepLinkRouter().then((td) => {
      teardown = td;
    });
    return () => teardown();
  }, []);

  // Dev-only: ?dev_jwt=<token> in the URL sets the rop_jwt cookie at
  // localhost and reloads the page. Used in development against the live
  // production API when no WordPress login redirect is wired locally —
  // Session 39 added this when Safari's DevTools console refused
  // document.cookie pastes. Stripped from production builds via
  // import.meta.env.DEV (Vite injects DEV=false when `npm run build`
  // runs, so this whole block becomes dead code under production).
  useEffect(() => {
    if (!import.meta.env.DEV) return;
    if (typeof window === "undefined") return;
    const params = new URLSearchParams(window.location.search);
    const devJwt = params.get("dev_jwt");
    if (!devJwt) return;
    document.cookie = `rop_jwt=${devJwt}; path=/; max-age=86400`;
    // Drop the query param so the JWT doesn't sit in the URL after
    // navigation. Then reload so the API client picks up the cookie.
    const cleanUrl = window.location.pathname + window.location.hash;
    window.history.replaceState({}, "", cleanUrl);
    window.location.reload();
  }, []);

  // S172 — wrap route output so the first-launch welcome modal can
  // mount alongside any route. The modal's z-100 stacks above every
  // route surface; until the partner picks, every render layer
  // underneath is interactable but the modal is the foreground.
  const welcomeModal = welcomeOpen ? (
    <SacredNameWelcomeModal
      onClose={() => setWelcomeOpen(false)}
      initialStep={welcomeInitialStep}
    />
  ) : null;

  // Phase 2 offline — the one-time "download for offline" onboarding banner.
  // Self-gates on its localStorage seen-flag, restricts itself to the home
  // surfaces (/today, /read, /), and stays hidden while the welcome modal is
  // up so the partner faces a single ask at a time.
  const offlinePrompt = (
    <OfflineDownloadPrompt pathname={pathname} welcomeOpen={welcomeOpen} />
  );

  if (pathname === "/manage" || pathname.startsWith("/manage")) {
    return <>{welcomeModal}<Manage /></>;
  }
  if (pathname === "/sign-in" || pathname.startsWith("/sign-in")) {
    return <>{welcomeModal}<SignIn /></>;
  }
  // S176 — auth-callback landing route. Renders the "signing you in…"
  // surface while the JWT (delivered via ?token= query param from the
  // rop-sso-bridge WP plugin's redirect) is persisted via
  // storeNativeToken. On success the route navigates the partner to
  // /read with the new auth state active. The welcomeModal is
  // suppressed here (see the welcomeOpen initializer above).
  if (pathname === "/auth-callback" || pathname.startsWith("/auth-callback")) {
    return <AuthCallback />;
  }
  if (pathname === "/pricing" || pathname.startsWith("/pricing")) {
    return <>{welcomeModal}<Pricing /></>;
  }
  // S172 — Settings → Reader preferences page. Top-level route alongside
  // /pricing /manage /sign-in. Reached via the ⚙ Settings button in the
  // top-right chrome cluster.
  if (pathname === "/settings" || pathname.startsWith("/settings")) {
    return <>{welcomeModal}<Settings /></>;
  }
  // S196 — Attributions / data-credits surface. Top-level route alongside
  // /settings /pricing /manage /sign-in. Credits the public-domain + open-
  // licensed data sources (openbible.info, OpenStreetMap, BradyStephenson,
  // STEPBible) per their CC-BY / ODbL attribution requirements.
  if (pathname === "/attributions" || pathname.startsWith("/attributions")) {
    return <>{welcomeModal}<Attributions /></>;
  }
  // S220 — The Appointed Times: the EPIC biblical-calendar view, built on
  // the configurable calendar engine (lib/calendar). Standalone + auth-free,
  // so it renders as a live demo without the reader backend.
  if (pathname === "/calendar" || pathname.startsWith("/calendar")) {
    return <>{welcomeModal}<Calendar /></>;
  }
  // S228 — the "Today" home hub: the post-authentication landing and the daily
  // front door. Surfaces the live biblical day (date, Sabbath/feast status, the
  // Omer in season, on-this-day history) plus the day's devotional + prayer, and
  // quick doors into the Reader, The Appointed Times, and My Study. Standalone +
  // auth-free like /calendar — computed locally, no backend. The native shell
  // (Landing) and the post-sign-in flow (AuthCallback) both land here; the
  // Reader stays fully reachable at /read via the prominent "Read" door.
  if (pathname === "/today" || pathname.startsWith("/today")) {
    return <>{welcomeModal}{offlinePrompt}<Today /></>;
  }
  // S129 — Reader moves from `/` to `/read` so the bare bible
  // subdomain serves the new Landing surface instead of dropping
  // partners straight into the verse pane. Existing deep-links into
  // sub-paths (/pricing, /manage, /sign-in) keep working unchanged.
  // The Reader doesn't carry book/chapter in the URL — saved reading
  // position rehydrates from the API/localStorage on mount, so the
  // path swap doesn't break bookmarked positions.
  if (pathname === "/read" || pathname.startsWith("/read")) {
    return <>{welcomeModal}{offlinePrompt}<Reader /></>;
  }
  return <>{welcomeModal}{offlinePrompt}<Landing /></>;
}

/**
 * Reader-app posture (Apple 3.1.3 / Google Play). On the native
 * Capacitor shells the app must not surface purchase or upgrade
 * steering — no prices, no "Become a partner" / "Resubscribe" buttons,
 * no links into the checkout flow. Tier upgrades happen on the web from
 * the partner's account. Pricing.tsx already strips its prices on native
 * (S206); this helper gates the reader-chrome upsell CTAs to web-only.
 * Same runtime-bridge detection used in SignIn.tsx / Pricing.tsx — no
 * Capacitor import, so the web bundle stays slim and the by-URL shell
 * picks it up on the next web deploy with no app rebuild.
 */
function isNativeShell(): boolean {
  return (
    typeof window !== "undefined" &&
    (window as unknown as {
      Capacitor?: { isNativePlatform?: () => boolean };
    }).Capacitor?.isNativePlatform?.() === true
  );
}

function Reader() {
  const [books, setBooks] = useState<BookSummary[]>([]);
  const [booksError, setBooksError] = useState<string | null>(null);

  const [selectedBookSlug, setSelectedBookSlug] = useState<string>("genesis");
  const [selectedChapter, setSelectedChapter] = useState<number>(1);
  // S211 — Arranged Reading overlay (chronological apparatus) open state.
  const [arrangedOpen, setArrangedOpen] = useState<boolean>(false);

  // S130 — single global toggle: scripture-only ↔ full study Bible.
  // Hides chapter_intro, the Basic/Deeper-Dive commentary stack, AND
  // the chapter-end cross-reference card all at once. One button, two
  // states, persisted per-user via localStorage so the reader's choice
  // travels across chapters and reloads. Reuses the existing S112 key
  // so partners who'd already toggled "Hide commentary" keep their
  // preference — the toggle's scope just widened to cover everything
  // study-aid (per Yoshi: "you either want the extras or just the
  // scripture, that's it, that's simple").
  const [hideCommentary, setHideCommentary] = useState<boolean>(false);
  useEffect(() => {
    if (typeof window === "undefined") return;
    const stored = window.localStorage.getItem("rop_hide_commentary_v1");
    setHideCommentary(stored === "true");
  }, []);
  const toggleHideCommentary = () => {
    const next = !hideCommentary;
    setHideCommentary(next);
    if (typeof window !== "undefined") {
      window.localStorage.setItem("rop_hide_commentary_v1", String(next));
    }
  };

  // S204 — The Witness (working title: Red Pill). The inverted
  // red-letter overlay: member verses carry the partner's chosen red
  // treatment; tap unfolds the come-and-see card inline. Free for
  // every partner — the proclamation surface; no tier gate, ever.
  // S204b (Yoshi): defaults ON for first-time visitors — the
  // proclamation meets them before they know to look for it; the
  // toggle-off choice persists like the other reader toggles.
  const [witnessOn, setWitnessOn] = useState<boolean>(true);
  useEffect(() => {
    if (typeof window === "undefined") return;
    const stored = window.localStorage.getItem("rop_witness_v1");
    setWitnessOn(stored === null ? true : stored === "true");
  }, []);
  const toggleWitness = () => {
    const next = !witnessOn;
    setWitnessOn(next);
    setExpandedWitnessVerseId(null);
    if (typeof window !== "undefined") {
      window.localStorage.setItem("rop_witness_v1", String(next));
    }
  };
  // S204b — the partner-chosen verse treatment ("red pill options and
  // then they choose" — Yoshi). Default "text": the inverted
  // red-letter made literal. Persists per device.
  const [witnessStyle, setWitnessStyle] = useState<WitnessStyle>("text");
  useEffect(() => {
    if (typeof window === "undefined") return;
    const stored = window.localStorage.getItem("rop_witness_style_v1");
    if (
      stored === "text" ||
      stored === "quotes" ||
      stored === "highlight" ||
      stored === "capsule"
    ) {
      setWitnessStyle(stored);
    }
  }, []);
  const pickWitnessStyle = (s: WitnessStyle) => {
    setWitnessStyle(s);
    if (typeof window !== "undefined") {
      window.localStorage.setItem("rop_witness_style_v1", s);
    }
  };
  const [witnessByVerse, setWitnessByVerse] = useState<
    Record<number, WitnessEntry>
  >({});
  const [expandedWitnessVerseId, setExpandedWitnessVerseId] = useState<
    number | null
  >(null);

  // S205 — The Kingdom (working title: Blue Pill). The nothing-new
  // overlay: member verses carry the two-tone quote mark (a double
  // quotation mark built from two single glyphs — emerald outside,
  // gold inside, both ends of the verse; proof v3 signed off); tap
  // unfolds the come-and-see card inline. Free for every partner —
  // the proclamation surface; no tier gate, ever. Defaults ON for
  // first-time visitors like the Witness; toggle-off persists.
  const [kingdomOn, setKingdomOn] = useState<boolean>(true);
  useEffect(() => {
    if (typeof window === "undefined") return;
    const stored = window.localStorage.getItem("rop_kingdom_v1");
    setKingdomOn(stored === null ? true : stored === "true");
  }, []);
  const toggleKingdom = () => {
    const next = !kingdomOn;
    setKingdomOn(next);
    setExpandedKingdomVerseId(null);
    if (typeof window !== "undefined") {
      window.localStorage.setItem("rop_kingdom_v1", String(next));
    }
  };
  // S214 — the partner-chosen Kingdom verse treatment ("quotes or
  // underline" — Yoshi). Default "underline": the two-tone gradient
  // underline (S217 Yoshi: "I think I want the kingdom gospel to be
  // underline by default instead of quotes"). The original S205 two-tone
  // quote pair is still available via the style row. Persists per device
  // at rop_kingdom_style_v1.
  const [kingdomStyle, setKingdomStyle] = useState<KingdomStyle>("underline");
  useEffect(() => {
    if (typeof window === "undefined") return;
    const stored = window.localStorage.getItem("rop_kingdom_style_v1");
    if (stored === "quotes" || stored === "underline") {
      setKingdomStyle(stored);
    }
  }, []);
  const pickKingdomStyle = (s: KingdomStyle) => {
    setKingdomStyle(s);
    if (typeof window !== "undefined") {
      window.localStorage.setItem("rop_kingdom_style_v1", s);
    }
  };
  const [kingdomByVerse, setKingdomByVerse] = useState<
    Record<number, KingdomEntry>
  >({});
  const [expandedKingdomVerseId, setExpandedKingdomVerseId] = useState<
    number | null
  >(null);

  // S144 — parentheticals-hide toggle. Default OFF (parentheticals
  // visible) to preserve the retention-mechanism for first-time Christian
  // readers per the voice skill's "Why the Parenthetical Is Non-
  // Negotiable" section. The reader who has internalized the restored
  // names opts INTO the strip, removing the now-redundant parentheticals
  // from every reading surface — verses, chapter_intro, commentary
  // entries, cross-reference notes, thread summaries, and thread member
  // notes. State lives in localStorage at `rop_hide_parentheticals_v1`;
  // hook reads + persists via lib/useParentheticalsToggle. The value
  // is passed down as a prop to ChapterCommentary and ChapterEndCard so
  // all surfaces stay in sync within a single render.
  const {
    hide: hideParentheticals,
    toggle: toggleHideParentheticals,
    applyToText: applyParensStrip,
  } = useParentheticalsToggle();

  // S172 — sacred-name display mask (Yahuah / YHWH). Independent of
  // the parens toggle above; the two compose freely per the four-
  // combination architecture in S172_SACRED_NAME_MASK_SPEC.md. The
  // mask runs FIRST in the text pipeline, parens-strip runs SECOND
  // — order doesn't affect outcome on the current STRIP_LIST (which
  // contains no "Yahuah" entries) but composition discipline keeps
  // the chain stable as the STRIP_LIST evolves.
  // S172 — `set: setSacredNameMask` is unused at this scope; the
  // Settings page reads/writes via its own useSacredNameMask hook
  // instance (the storage key is shared so the two stay in sync).
  // First-launch modal does the same. Intentionally omitting `set`
  // from this destructure to keep the unused-locals lint clean.
  const {
    mask: sacredNameMask,
    applyToText: applySacredMask,
  } = useSacredNameMask();
  // Combined text pipeline used by every render site: mask first,
  // then parens-strip. One line per call site instead of two.
  const applyTextPrefs = (text: string): string =>
    applyParensStrip(applySacredMask(text));

  // S160 — always-visible Strong's superscripts toggle (DESIGN_LANGUAGE
  // §27). BLB-pattern. Default OFF — clean reading surface is the
  // default; awakening partners opt INTO the always-visible H- / G-
  // numbers when they want the pointer register. Free tier (no paywall);
  // the Strong's data is already free at §20. State persists at
  // localStorage `rop_strongs_superscripts_v1`. Toggle in the chapter
  // chrome strip (next to the §144 English-helpers toggle) and tapping
  // any rendered superscript fires the same handleWordQuickTap that the
  // word itself does, opening the §20 StrongsLookup modal.
  const {
    show: showStrongsSuperscripts,
    toggle: toggleShowStrongsSuperscripts,
  } = useStrongsSuperscriptsToggle();

  // S229 — collapsed/expanded state for the pinned study-options bar
  // (Yoshi "Option 2"). The display-toggle pills moved from after the
  // scripture into a slim bar pinned at the TOP of the reading column;
  // this flag drives whether the bar shows the pills or tucks to its
  // thin handle. Default collapsed; persists at
  // localStorage `rop_study_bar_collapsed_v1`.
  const {
    collapsed: studyBarCollapsed,
    toggle: toggleStudyBar,
  } = useStudyBarCollapsed();

  // S168 — §28 Hebrew & Greek interlinear toggle. Default OFF (clean
  // reading surface; partner opts INTO the original-language column-
  // stack above each English word). Tier-gated at Companion+ via
  // isAtCompanionTier — below-tier partners see the chrome-strip pill
  // rendered with the Companion-badge chip and tapping routes to
  // /pricing; Companion+ partners see the toggle live and tapping flips
  // the InterlinearLayer mount per verse. Persists via
  // localStorage `rop_interlinear_v1`. Parallels §27's argaman pill —
  // the two pills read as a pair (§27 = Strong's numbers free; §28 =
  // original-language layer Companion). The `partnerAtCompanion`
  // value is computed downstream where `me` is in scope (just below
  // the `me` useState declaration).
  const { show: showInterlinear, toggle: toggleShowInterlinear } =
    useInterlinearToggle();

  // S116 — reading-position persistence. `currentVerse` tracks the
  // topmost-visible verse via IntersectionObserver (initial 1, updated
  // as the partner scrolls). `hydrated` gates the save effect so the
  // initial paint at Genesis/1/1 doesn't overwrite the saved position
  // before the hydrate completes. `initialScrollVerse` is set during
  // hydrate when the saved position isn't verse 1; cleared after the
  // post-load scrollIntoView fires.
  const [currentVerse, setCurrentVerse] = useState<number>(1);
  const [hydrated, setHydrated] = useState<boolean>(false);
  const [initialScrollVerse, setInitialScrollVerse] = useState<number | null>(
    null
  );

  const [chaptersResp, setChaptersResp] =
    useState<BookChaptersResponse | null>(null);
  const [chapterDetail, setChapterDetail] = useState<ChapterDetail | null>(
    null
  );
  const [chapterLoading, setChapterLoading] = useState<boolean>(false);
  const [chapterError, setChapterError] = useState<string | null>(null);

  // Session 38: me-fetch for the chrome's Manage/Upgrade decision.
  // 401 (no JWT cookie) is non-fatal — we just don't show the partner
  // chrome at all in that case.
  //
  // S174 — meChecked tracks whether the /v1/subscriptions/me fetch has
  // resolved at least once (success OR failure). The chrome's anonymous
  // "Sign in" branch (Track 2) renders only when the fetch is known to
  // have completed with no session — i.e. me === null AND meChecked ===
  // true. During the initial fetch window (~100-300ms cold) meChecked
  // stays false, the anonymous branch renders nothing, and a signed-in
  // partner never sees a "Sign in" flicker before their real CTA paints.
  const [me, setMe] = useState<SubscriptionMe | null>(null);
  const [meChecked, setMeChecked] = useState<boolean>(false);
  // S168 — §28 Companion-gate flag, depends on `me`. Computed once per
  // render; cheap literal-string compare. Drives the Interlinear pill's
  // live-vs-locked render + the InterlinearWordColumn mount branch.
  const partnerAtCompanion = isAtCompanionTier(me?.tier ?? null);

  // S169 — preload the SBL Hebrew + SBL BibLit woff2 files the moment a
  // Companion+ partner flips the §28 toggle ON for the first time. The
  // @font-face declarations in index.css carry `font-display: swap`, so
  // the system-fallback chain (Ezra SIL / Cardo / Times New Roman)
  // paints first while the woff2 fetches, then the bundled glyphs swap
  // in. The preload-link brings the fetch forward to toggle-on so the
  // swap-in lands before the first column renders. `preloadInterlinearFonts`
  // is idempotent (duplicate-link guard), so this useEffect rerunning on
  // partner-tier changes is a no-op after the first run.
  useEffect(() => {
    if (showInterlinear && partnerAtCompanion) {
      preloadInterlinearFonts();
    }
  }, [showInterlinear, partnerAtCompanion]);

  // S113 → S117: per-chapter highlights map.
  // `highlightsByVerse` keys are verse_id and values are ARRAYS of
  // marks on that verse (S117 multi-mark: schema unique is
  // (user_id, verse_id, color, style), so a verse can carry up to 3
  // marks per the picker cap; different (color, style) tuples coexist
  // visually via nested spans).
  const [highlightsByVerse, setHighlightsByVerse] = useState<
    Record<number, Highlight[]>
  >({});

  // S121 W3 — modal stack state. Replaces the direct
  // pickerVerseId-driven path. Long-press / right-click fires the
  // VerseActionMenu first, which routes to either HighlightPicker or
  // StrongsLookup. Quick-tap on a tappable word bypasses the menu
  // and opens StrongsLookup directly.
  //
  // menuState carries the verse + (optional) word context for the
  // long-press menu. pickerVerseId opens the HighlightPicker (now
  // routed through the menu). strongsState opens StrongsLookup
  // (routed either via menu OR quick-tap fast path).
  const [pickerVerseId, setPickerVerseId] = useState<number | null>(null);
  const [menuState, setMenuState] = useState<
    | {
        verseId: number;
        word: { strong: string; surface: string } | null;
      }
    | null
  >(null);
  const [strongsState, setStrongsState] = useState<
    { strong: string; surface: string; verseId?: number | null } | null
  >(null);

  // S173 — Capacitor deep-link entry. App.tsx subscribes to
  // appUrlOpen; the in-app dispatch lands here as a
  // `rop:open-strongs` CustomEvent carrying the canonical strong
  // number. We open StrongsLookup with an empty `surface` because the
  // deep link doesn't carry the surface form (the share URL is
  // /strongs/{N} only — the surface word lives only in the share-card
  // image itself). StrongsLookup tolerates an empty surface by falling
  // back to the lexicon entry's lemma display.
  useEffect(() => {
    if (typeof window === "undefined") return;
    const onOpen = (e: Event): void => {
      const detail = (e as CustomEvent<{ strongNumber: string }>).detail;
      if (detail?.strongNumber) {
        setStrongsState({ strong: detail.strongNumber, surface: "" });
      }
    };
    window.addEventListener("rop:open-strongs", onOpen as EventListener);
    return () =>
      window.removeEventListener("rop:open-strongs", onOpen as EventListener);
  }, []);

  // S164 — §26 menu-direct lexicon path. Mounting LexiconSheet at the App
  // level (separate from the StrongsLookup-internal mount) so the §20
  // VerseActionMenu BDB / LSJ items can open it without going through
  // Strong's first. Both mounts use the same LexiconSheet component +
  // server-side tier gate.
  const [lexiconState, setLexiconState] = useState<
    { strong: string; language: "hebrew" | "greek" | "aramaic" } | null
  >(null);

  // S197 — public-domain tool surfaces. Each opens from the VerseActionMenu
  // (Vincent's / Nikkudot word-study items; Nave's / Treasury / Maps reference
  // items) and mounts at the App level above StrongsLookup (z-60). All share the
  // Companion-tier gate + lexicon_enabled kill-switch server-side.
  const [vincentsState, setVincentsState] = useState<
    { bookSlug: string; chapter: number; verse: number; verseLabel: string } | null
  >(null);
  const [nikkudotState, setNikkudotState] = useState<
    { bookSlug: string; chapter: number; verse: number; verseLabel: string } | null
  >(null);
  const [tskState, setTskState] = useState<
    { bookSlug: string; chapter: number; verse: number; verseLabel: string } | null
  >(null);
  const [navesState, setNavesState] = useState<{ initialQuery?: string } | null>(
    null,
  );
  const [mapsOpen, setMapsOpen] = useState<boolean>(false);
  // S224 — "Compare to another version" lens. Carries the anchor verse; the
  // sheet itself owns the version picker + verse/chapter scope.
  const [compareState, setCompareState] = useState<
    { bookSlug: string; bookTitle: string; chapter: number; verse: number; verseLabel: string } | null
  >(null);

  // S123 W4 — range-selection state + post-capture action picker target.
  // rangeState holds the shared mechanic per DESIGN_LANGUAGE.md §21:
  //   - idle: no range active; verses render normally
  //   - selecting: anchor verse pinned (start); waiting for end-verse tap
  //   - captured: both endpoints in; rangePickerOpen drives the
  //     post-capture action picker; on commit, pickerRangeVerseIds
  //     drives the HighlightPicker in multi-target mode
  //
  // pickerRangeVerseIds is set when "Highlight range" is chosen from the
  // RangeActionPicker — it triggers HighlightPicker's multi-target render.
  const [rangeState, setRangeState] =
    useState<RangeSelectionState>(RANGE_IDLE);
  const [rangePickerOpen, setRangePickerOpen] = useState<boolean>(false);
  const [pickerRangeVerseIds, setPickerRangeVerseIds] = useState<
    number[] | null
  >(null);

  // S124 W5 — Bookmarks state.
  // `bookmarksByVerse` keys are verse_id; values are the partner's
  // single bookmark on that verse (one per (user, verse) per the §22
  // UNIQUE constraint). Fetched alongside highlights on chapter load.
  // bookmarkSheetVerseId drives the BookmarkSheet modal — set to a
  // verse_id when the partner taps "Bookmark" in the menu (sheet opens
  // in create-mode for unbookmarked verses, edit-mode for bookmarked).
  const [bookmarksByVerse, setBookmarksByVerse] = useState<
    Record<number, Bookmark>
  >({});
  const [bookmarkSheetVerseId, setBookmarkSheetVerseId] = useState<
    number | null
  >(null);

  // S124 W5 — Notes V1 state. Single global notepad per §22 (Free
  // tier; per-verse separate notes + hub are W8 / $1.99). `notes`
  // carries every entry across all chapters (server-resolved
  // verse_ref on each entry powers the per-entry header). `notesOpen`
  // drives the NotesPanel render. `pendingNoteAnchor` is set when the
  // panel was opened via the verse-scope Add-note path (drives the
  // "Adding to: {verseRef}" strip + the verse_id on POST); null when
  // opened via the chrome Notes button (free-form path).
  const [notes, setNotes] = useState<NoteEntry[]>([]);
  const [notesOpen, setNotesOpen] = useState<boolean>(false);
  const [pendingNoteAnchor, setPendingNoteAnchor] =
    useState<PendingAnchor | null>(null);

  // S166 — §29 Bookmarks Index state. Single boolean drives the
  // BookmarksIndex render branch. The component owns its own fetch +
  // cache (each open is a fresh fetch per §29 *Persistence*); App just
  // toggles visibility and supplies the navigate callback. Per §29 Gate
  // #1 = Free tier; the chrome button below renders for every signed-in
  // partner without a tier-locked chip.
  const [bookmarksIndexOpen, setBookmarksIndexOpen] = useState<boolean>(false);

  // S203 — Session C "My Study" home. Single boolean drives the
  // full-screen MyStudy overlay (the unified personal-apparatus
  // surface: notes + bookmarks + highlights, searchable, collected,
  // exportable). The component owns its own fetch of GET
  // /v1/study/index per open; App supplies books (canonical ordering),
  // the navigate callback, and visibility. Every tier opens it — the
  // free partner sees the capped home with the Study Notes lever.
  // S228 — the Today hub's "My Study / Journal" door deep-links here as
  // /read?study=1 (the hub is a separate route and can't reach into the
  // Reader's modal state), so honor that param on first mount.
  const [myStudyOpen, setMyStudyOpen] = useState<boolean>(
    () =>
      typeof window !== "undefined" &&
      new URLSearchParams(window.location.search).get("study") === "1",
  );

  // S125 W6 — Search V1 UI state per DESIGN_LANGUAGE.md §23. Single
  // boolean drives the SearchModal render branch; the modal owns its
  // own query state, debounce timer, and in-flight AbortController so
  // re-opening starts fresh (no stale query from a previous open).
  // Per §23 the chrome cluster becomes
  // [Search][Notes][Theme][Subscription CTA].
  const [searchOpen, setSearchOpen] = useState<boolean>(false);

  // S157 — Native-OS TTS audio narration state per DESIGN_LANGUAGE.md §25.
  // audioPlayerOpen drives the bottom-pinned AudioPlayer render. playing-
  // VerseId is the visual cursor (one-step-behind the engine's actual
  // queue position; updated from the engine's onstart event when each
  // verse begins). ttsPrefs persists to localStorage under `tts-prefs`
  // (voice name + rate; playback state itself is per-session per §25
  // Persistence). voices is populated from the engine at mount + via the
  // onVoicesChanged subscription (Chrome fires voiceschanged async at
  // init). autoAdvanceAfterLoad signals the post-chapter-load effect
  // to kick off TTS from verse 1 of the newly-loaded chapter (the §25
  // continuous-play-through-witness-category contract; reuses §19
  // navigateNext for the cross-chapter transition).
  const [audioPlayerOpen, setAudioPlayerOpen] = useState<boolean>(false);
  const [playingVerseId, setPlayingVerseId] = useState<number | null>(null);
  const [ttsPrefs, setTtsPrefs] = useState<TTSPrefs>(() => loadTTSPrefs());
  const [voices, setVoices] = useState<TTSVoice[]>(() =>
    getTTSEngine().getVoices(),
  );
  const [autoAdvanceAfterLoad, setAutoAdvanceAfterLoad] =
    useState<boolean>(false);
  // Engine subscription unsubscribers — captured in the per-playback
  // effect so we can clean up cleanly when playback ends or the player
  // closes. Held in refs because they're set + cleared imperatively
  // from event handlers, not from rendered state.
  const ttsUnsubsRef = useRef<Array<() => void>>([]);
  // Tracks whether the partner has manually scrolled during playback —
  // per §25 "manual-scroll-override" suspends auto-scroll for the rest
  // of the playback session if true. Cleared on player close/reopen.
  const manualScrollOverrideRef = useRef<boolean>(false);

  // S121 W3 — per-chapter Strong's-tagged-words map. Keys are
  // verse_id; values are the position-ordered VerseWord list for
  // that verse. Fetched alongside the chapter detail via the
  // batched /v1/books/{slug}/chapters/{n}/words endpoint so
  // tap-on-word becomes available without firing N parallel
  // per-verse requests. Empty until the batched fetch returns; the
  // verse-align helper degrades gracefully to all-plain rendering
  // until words arrive (progressive enrichment — verse text renders
  // instantly; tap-ability lights up a moment later).
  const [wordsByVerse, setWordsByVerse] = useState<
    Record<number, VerseWord[]>
  >({});

  // Long-press detection: pointerdown starts a 500ms timer; pointerup /
  // pointercancel / pointerleave clears it. If the timer fires, the
  // picker opens for that verse. Click + drag don't trigger.
  const longPressTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const longPressFiredRef = useRef<boolean>(false);

  // S116 — IntersectionObserver for verse-precise reading-position
  // tracking. Observes every verse span in the current chapter,
  // maintains a Map<verseNumber, boundingRectTop> of currently
  // intersecting verses, and emits the topmost (smallest top value)
  // as `currentVerse` whenever the set changes. The observer is
  // recreated each time chapterDetail changes (chapter-load fires
  // fresh DOM nodes).
  const verseObserverRef = useRef<IntersectionObserver | null>(null);
  const visibleVersesRef = useRef<Map<number, number>>(new Map());
  // S121 W3 — long-press / right-click now opens the VerseActionMenu
  // instead of going straight to HighlightPicker. The menu routes to
  // the right modal based on the user's choice. Word context is set
  // by the per-word handlers below when a tappable word is the
  // long-press anchor; verse context (no word) is the default.
  function handlePointerDown(
    verseId: number,
    word: { strong: string; surface: string } | null = null
  ) {
    longPressFiredRef.current = false;
    if (longPressTimerRef.current) {
      clearTimeout(longPressTimerRef.current);
    }
    longPressTimerRef.current = setTimeout(() => {
      longPressFiredRef.current = true;
      setMenuState({ verseId, word });
    }, 500);
  }
  function handlePointerCancel() {
    if (longPressTimerRef.current) {
      clearTimeout(longPressTimerRef.current);
      longPressTimerRef.current = null;
    }
  }
  function handleContextMenu(
    verseId: number,
    e: React.MouseEvent,
    word: { strong: string; surface: string } | null = null
  ) {
    e.preventDefault();
    setMenuState({ verseId, word });
  }

  // S121 W3 — quick-tap on a tappable word opens StrongsLookup
  // directly (fast path for the highest-frequency action). Only
  // fires if the long-press timer did NOT fire; the swipe-handler's
  // 10px movement check also kills this if the user dragged.
  //
  // S123 W4 — when range mode is active (selecting), word-level quick-
  // taps are reinterpreted as end-verse commits. Partners can pick
  // either plain-text or a tappable word as the end verse without
  // accidentally opening the lexicon mid-selection per DESIGN_LANGUAGE.md
  // §21 interaction-conflict resolution.
  function handleWordQuickTap(
    word: { strong: string; surface: string },
    verseId: number
  ) {
    if (longPressFiredRef.current) {
      longPressFiredRef.current = false;
      return;
    }
    if (rangeState.status === "selecting") {
      commitEndVerse(verseId);
      return;
    }
    // Carry the verse context so the Strong's sheet can offer a single-tap
    // "Verse menu" tab (Highlight / Note / Copy / Share). This is the
    // reliable iPhone path: long-press is unreliable in the iOS WebView, but
    // short-tap-to-Strong's works, so the verse-level actions hang off it.
    setStrongsState({ ...word, verseId });
  }

  // S123 W4 — build a RangeVerseRef from a verse_id in the currently
  // loaded chapter. Returns null if the verse isn't found in chapterDetail
  // (defensive — shouldn't happen because the handlers are only attached
  // to rendered verses).
  function buildVerseRef(verseId: number): RangeVerseRef | null {
    if (!chapterDetail) return null;
    const v = chapterDetail.verses.find((vv) => vv.id === verseId);
    if (!v) return null;
    return {
      verseId: v.id,
      verseNumber: v.verse_number,
      bookSlug: chapterDetail.book.slug,
      chapterNumber: chapterDetail.chapter.chapter_number,
    };
  }

  // S123 W4 — enter range mode with the long-pressed verse as the
  // anchor. Called from buildMenuSections's "Start range here" item.
  function startRangeFromVerse(verseId: number) {
    const ref = buildVerseRef(verseId);
    if (ref === null) return;
    setRangeState(rangeStartSelecting(ref));
  }

  // S123 W4 — commit an end verse to the in-progress range. Same-chapter
  // scope (per the §21 lock); cross-chapter taps are silently ignored
  // because chapterDetail's verses only carry the loaded chapter's ids.
  // After commit, open the post-capture action picker (RangeActionPicker)
  // which routes to HighlightPicker in multi-target mode for the Live
  // consumer.
  function commitEndVerse(verseId: number) {
    if (rangeState.status !== "selecting") return;
    const endRef = buildVerseRef(verseId);
    if (endRef === null) return;
    const next = rangeCommitEnd(rangeState, endRef);
    if (next.status !== "captured") return;
    if (!rangeIsSameChapter(next)) {
      // Defense in depth — same-chapter UX scope per §21 should prevent
      // this branch from firing in practice (end verses outside the
      // loaded chapter aren't in chapterDetail.verses), but if a
      // cross-chapter ref ever slips through, we cancel rather than
      // commit a state the W4 resolver can't handle.
      setRangeState(RANGE_IDLE);
      return;
    }
    setRangeState(next);
    setRangePickerOpen(true);
  }

  // S123 W4 — cancel range mode back to idle. Used by:
  //   - explicit Cancel button in the range-mode banner
  //   - Escape key (registered in a useEffect below)
  //   - chapter navigation (W2 surfaces silently cancel via the
  //     navigation-cancels-range useEffect below)
  //   - RangeActionPicker's Cancel / backdrop / Escape — any close path
  //     exits range mode entirely per the §21 "close = cancel" model.
  //     Partners who mis-tap the end verse start over via long-press →
  //     "Start range here."
  function cancelRange() {
    setRangeState(rangeCancel());
    setRangePickerOpen(false);
  }

  // S124 W5 — Bookmark handlers. openBookmarkSheet sets the target
  // verse_id; the BookmarkSheet renders in create-mode if the verse
  // has no existing bookmark, edit-mode if it does (looked up against
  // bookmarksByVerse). Save / Remove update the map optimistically
  // via the callbacks below.
  function openBookmarkSheet(verseId: number) {
    setBookmarkSheetVerseId(verseId);
  }
  function handleBookmarkSaved(bm: Bookmark) {
    setBookmarksByVerse((prev) => ({ ...prev, [bm.verse_id]: bm }));
  }
  function handleBookmarkDeleted(bookmarkId: string) {
    setBookmarksByVerse((prev) => {
      const next: Record<number, Bookmark> = {};
      for (const [vid, bm] of Object.entries(prev)) {
        if (bm.id !== bookmarkId) next[Number(vid)] = bm;
      }
      return next;
    });
  }

  // S124 W5 — Notes handlers. Two open paths per §22:
  //   - openNotesPanelWithAnchor: from the verse-scope Add-note menu;
  //     sets pendingAnchor so the panel renders the strip + the save
  //     POSTs with verse_id.
  //   - openNotesPanel: from the chrome Notes button (free-form);
  //     pendingAnchor stays null; save POSTs with verse_id null.
  // handleNoteSaved appends the new entry to the chronological array.
  function openNotesPanelWithAnchor(verseId: number) {
    if (!chapterDetail) return;
    const verse = chapterDetail.verses.find((vv) => vv.id === verseId);
    if (!verse) return;
    const verseRef = `${chapterDetail.book.title} ${chapterDetail.chapter.chapter_number}:${verse.verse_number}`;
    setPendingNoteAnchor({ verseId, verseRef });
    setNotesOpen(true);
  }
  function openNotesPanel() {
    setPendingNoteAnchor(null);
    setNotesOpen(true);
  }
  function closeNotesPanel() {
    setNotesOpen(false);
    setPendingNoteAnchor(null);
  }
  function handleNoteSaved(entry: NoteEntry) {
    setNotes((prev) => [...prev, entry]);
  }

  // S125 W6 — Search V1 handlers per §23.
  //
  // openSearchModal: opens the SearchModal from chrome (button click or
  //   Cmd-K/Ctrl-K shortcut). Side-effects per §23 interaction-conflict
  //   resolution — closes any open verse-scope modal (HighlightPicker,
  //   VerseActionMenu, RangeActionPicker, BookmarkSheet, NotesPanel)
  //   via the tap-outside semantics those modals already honor; in
  //   practice their backdrops already capture the click before this
  //   handler fires, so we just open search.
  // jumpToSearchResult: tap on a Live result row. Sets the W2 nav
  //   state-reset contract (book / chapter / currentVerse) PLUS
  //   initialScrollVerse so the S116 post-chapter-load effect scrolls
  //   the destination into view. Closes the modal.
  // upgradeFromLockedSearchRow: tap on a tier-locked result's upgrade
  //   card. Routes to /pricing via the existing browser-native pattern
  //   (same as §20 stubs) and closes the modal.
  function openSearchModal() {
    setSearchOpen(true);
  }
  function closeSearchModal() {
    setSearchOpen(false);
  }
  function jumpToSearchResult(hit: VerseSearchHit) {
    setSelectedBookSlug(hit.book_slug);
    setSelectedChapter(hit.chapter_number);
    setCurrentVerse(hit.verse_number);
    setInitialScrollVerse(hit.verse_number);
    setSearchOpen(false);
  }


  // S130 — cross-reference click target. Same shape as
  // jumpToSearchResult (set book, set chapter, set scroll-anchor verse)
  // but plumbed into ChapterEndCard so a click on "Genesis 5:1" in the
  // cross-ref card navigates the reader straight to that verse without
  // them having to use the book/chapter picker. Locked targets (when
  // tier_required > caller tier) route to /pricing instead.
  function jumpToVerseRef(bookSlug: string, chapterNumber: number, verseNumber: number) {
    setSelectedBookSlug(bookSlug);
    setSelectedChapter(chapterNumber);
    setCurrentVerse(verseNumber);
    setInitialScrollVerse(verseNumber);
  }
  function upgradeFromLockedSearchRow() {
    if (typeof window !== "undefined") {
      window.location.href = "/pricing";
    }
    setSearchOpen(false);
  }

  // S157 — Native-OS TTS handlers per DESIGN_LANGUAGE.md §25.
  //
  // Design:
  //   - Each verse is its own SpeechSynthesisUtterance — speak() in
  //     sequence; the engine auto-queues, the onstart/onend events
  //     drive the visual cursor.
  //   - prev/next/voice/rate changes stop + re-queue from the new
  //     starting verse with the new params.
  //   - At end of chapter, fire navigateNext() (the same §19 chapter-
  //     nav handler) and let the post-load effect kick off TTS from
  //     verse 1 of the new chapter. Bounce at category edge (next
  //     returns null) stops playback cleanly.
  //   - prepareVerseForSpeech strips parentheticals + applies the §25
  //     substitution table so the engine speaks the restored names
  //     phonetically.
  function queueChapterFromVerse(startVerseId: number) {
    if (!chapterDetail) return;
    const verses = chapterDetail.verses;
    const startIdx = verses.findIndex((v) => v.id === startVerseId);
    if (startIdx === -1) return;
    const engine = getTTSEngine();
    if (!engine.isAvailable()) return;

    // Clean up any prior subscriptions before re-subscribing.
    for (const unsub of ttsUnsubsRef.current) {
      try {
        unsub();
      } catch {
        // swallow
      }
    }
    ttsUnsubsRef.current = [];

    // Stop any in-progress utterance + clear the engine queue before
    // enqueuing the new chapter run.
    engine.stop();

    // Resolve the voice — partner's pick if set + still in the list,
    // else fall back to the engine's best-available.
    const allVoices = engine.getVoices();
    const englishVoices = allVoices.filter((v) => /^en(-|$)/i.test(v.lang));
    const picked =
      (ttsPrefs.voiceName
        ? englishVoices.find((v) => v.name === ttsPrefs.voiceName)
        : null) ?? pickBestVoice(englishVoices);
    const voiceName = picked?.name ?? null;

    // Queue every verse from startIdx to end of chapter. The web
    // SpeechSynthesis API auto-queues utterances; onstart fires when
    // each utterance begins, onend when each finishes. We pass each
    // verse's id as the consumer-side cursor.
    for (let i = startIdx; i < verses.length; i++) {
      const v = verses[i];
      const speakable = prepareVerseForSpeech(v.text);
      engine.speak(speakable, {
        voiceName,
        rate: ttsPrefs.rate,
        verseId: v.id,
      });
    }

    // The web engine doesn't surface per-utterance onstart at the
    // engine-interface level (we'd need to attach to each utterance
    // individually) — for V1 the visual cursor is driven from onEnd
    // by advancing to the NEXT verse in the chapter list. When the
    // last verse's onEnd fires, fire navigateNext to advance chapters.
    const unsubEnd = engine.onEnd((e) => {
      if (!chapterDetail || e.verseId === undefined) return;
      const idx = chapterDetail.verses.findIndex((v) => v.id === e.verseId);
      if (idx === -1) return;
      if (idx + 1 < chapterDetail.verses.length) {
        // Advance visual cursor to the next queued verse.
        setPlayingVerseId(chapterDetail.verses[idx + 1].id);
      } else {
        // Last verse of chapter just finished — auto-advance through
        // the witness category per §25 + §19. navigateNext returns
        // early at the category edge so playback stops cleanly there.
        setAutoAdvanceAfterLoad(true);
        void navigateNext();
      }
    });

    const unsubErr = engine.onError((err) => {
      // S157 V1 — error handling is observational only. The engine
      // already filters out "canceled"/"interrupted" non-errors per
      // the web implementation; remaining errors are logged for
      // diagnostic visibility but don't stop playback.
      // eslint-disable-next-line no-console
      console.warn("[TTS] error", err);
    });

    ttsUnsubsRef.current = [unsubEnd, unsubErr];

    setPlayingVerseId(verses[startIdx].id);
    setAudioPlayerOpen(true);
    manualScrollOverrideRef.current = false;
  }

  function startPlaybackFromCurrentVerse() {
    if (!chapterDetail) return;
    // Map currentVerse (verse_number) to verse_id via the loaded chapter.
    const v = chapterDetail.verses.find(
      (vv) => vv.verse_number === currentVerse,
    );
    if (!v) return;
    queueChapterFromVerse(v.id);
  }

  function startPlaybackFromVerseId(verseId: number) {
    queueChapterFromVerse(verseId);
  }

  function handlePlayPause() {
    const engine = getTTSEngine();
    if (!engine.isAvailable()) return;
    if (engine.isSpeaking()) {
      // Web engine's `speaking` flag stays true through pause; resume
      // is the right call when audio is currently held vs. when the
      // user hit play with nothing queued. We pause when the engine
      // is actively producing audio, resume otherwise — checking the
      // paused state would require a separate flag the web API
      // doesn't directly expose, so we toggle by best-effort:
      // attempt pause; if pause was already in effect the resume path
      // is harmless (the engine's internal state guards both calls).
      engine.pause();
    } else {
      engine.resume();
    }
  }

  function handleSkipPrevVerse() {
    if (!chapterDetail || playingVerseId === null) return;
    const idx = chapterDetail.verses.findIndex((v) => v.id === playingVerseId);
    if (idx <= 0) return;
    queueChapterFromVerse(chapterDetail.verses[idx - 1].id);
  }

  function handleSkipNextVerse() {
    if (!chapterDetail || playingVerseId === null) return;
    const idx = chapterDetail.verses.findIndex((v) => v.id === playingVerseId);
    if (idx === -1 || idx + 1 >= chapterDetail.verses.length) {
      // At chapter edge — fire chapter-nav auto-advance per the §25
      // continuous-play contract.
      setAutoAdvanceAfterLoad(true);
      void navigateNext();
      return;
    }
    queueChapterFromVerse(chapterDetail.verses[idx + 1].id);
  }

  function handlePrefsChange(newPrefs: TTSPrefs) {
    setTtsPrefs(newPrefs);
    saveTTSPrefs(newPrefs);
    // Re-queue from the currently-playing verse with the new params so
    // the partner hears the change immediately. If nothing's playing,
    // the prefs just stay queued for the next play.
    if (playingVerseId !== null) {
      // Defer the re-queue to a microtask so state update + saveTTSPrefs
      // run before queueChapterFromVerse reads ttsPrefs — without this,
      // the re-queue would read the stale prefs from the closure.
      const target = playingVerseId;
      setTimeout(() => {
        // queueChapterFromVerse reads ttsPrefs from React state; by the
        // time setTimeout fires, the setState has propagated.
        // (queueChapterFromVerse uses the new ttsPrefs.)
        void target; // silence unused-var lint
        // We rely on the queueChapterFromVerse re-read happening on the
        // next render's closure; explicit closure-over-newPrefs path:
        const engine = getTTSEngine();
        engine.stop();
        if (!chapterDetail) return;
        const startIdx = chapterDetail.verses.findIndex(
          (v) => v.id === target,
        );
        if (startIdx === -1) return;
        const allVoices = engine.getVoices();
        const englishVoices = allVoices.filter((v) =>
          /^en(-|$)/i.test(v.lang),
        );
        const picked =
          (newPrefs.voiceName
            ? englishVoices.find((v) => v.name === newPrefs.voiceName)
            : null) ?? pickBestVoice(englishVoices);
        const voiceName = picked?.name ?? null;
        for (let i = startIdx; i < chapterDetail.verses.length; i++) {
          const v = chapterDetail.verses[i];
          engine.speak(prepareVerseForSpeech(v.text), {
            voiceName,
            rate: newPrefs.rate,
            verseId: v.id,
          });
        }
      }, 0);
    }
  }

  function handlePreviewVoice(voiceName: string) {
    const engine = getTTSEngine();
    if (!engine.isAvailable()) return;
    // Preview is a one-shot utterance that doesn't disturb the main
    // queue — stop any in-progress utterance, speak the preview phrase
    // with the candidate voice + current rate, then the main playback
    // is gone. Partner restarts via Play/Pause or skip.
    engine.stop();
    setPlayingVerseId(null);
    engine.speak(
      "In the beginning Elohim created the heavens and the earth",
      { voiceName, rate: ttsPrefs.rate },
    );
  }

  function handleAudioPlayerClose() {
    const engine = getTTSEngine();
    engine.stop();
    for (const unsub of ttsUnsubsRef.current) {
      try {
        unsub();
      } catch {
        // swallow
      }
    }
    ttsUnsubsRef.current = [];
    setAudioPlayerOpen(false);
    setPlayingVerseId(null);
    setAutoAdvanceAfterLoad(false);
    manualScrollOverrideRef.current = false;
  }

  // S157 — voice list arrives asynchronously on Chrome; subscribe to
  // the voiceschanged event and update local state so the picker reads
  // the populated list. No-op on platforms that populate synchronously.
  useEffect(() => {
    const engine = getTTSEngine();
    if (!engine.isAvailable()) return;
    setVoices(engine.getVoices());
    const unsub = engine.onVoicesChanged(() => {
      setVoices(engine.getVoices());
    });
    return unsub;
  }, []);

  // S157 — auto-scroll the currently-spoken verse into view per §25.
  // Honors prefers-reduced-motion (instant scroll vs smooth) and the
  // manual-scroll-override flag (suspended for the rest of the session
  // once the partner manually scrolls during playback).
  useEffect(() => {
    if (playingVerseId === null) return;
    if (manualScrollOverrideRef.current) return;
    const el = document.querySelector(
      `[data-verse-id="${playingVerseId}"]`,
    ) as HTMLElement | null;
    if (!el) return;
    const reduceMotion =
      typeof window !== "undefined" &&
      window.matchMedia?.("(prefers-reduced-motion: reduce)").matches;
    el.scrollIntoView({
      behavior: reduceMotion ? "auto" : "smooth",
      block: "center",
    });
  }, [playingVerseId]);

  // S157 — detect manual scroll during playback so we can suspend
  // auto-scroll for the rest of the session per §25. We use a coarse
  // heuristic: any scroll event that fires while the player is open
  // AND not within the brief window after the auto-scroll-triggering
  // playingVerseId change is treated as manual. A 500ms window after
  // each playingVerseId update absorbs the smooth-scroll's own scroll
  // events.
  useEffect(() => {
    if (!audioPlayerOpen) return;
    let lastAutoScrollAt = Date.now();
    const onPlayingVerseChange = () => {
      lastAutoScrollAt = Date.now();
    };
    onPlayingVerseChange(); // initial reset on player open
    const onScroll = () => {
      if (Date.now() - lastAutoScrollAt > 500) {
        manualScrollOverrideRef.current = true;
      }
    };
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, [audioPlayerOpen, playingVerseId]);

  // Books load once on mount.
  //
  // S200 — await loadStoredNativeToken() BEFORE listBooks() fires, the same
  // race fix the /me fetch got at S178. On the native shell the JWT lives in
  // Capacitor Preferences and hydrates asynchronously; firing listBooks before
  // the in-memory token cache is populated sends an anonymous request, so the
  // tier filter on /v1/books returns only the 66-book free canon — even though
  // the reader is signed in and extras chapters load fine once the token is
  // hydrated (the symptom: picker shows 66, cross-references still open the full
  // extras chapter). Awaiting the token attaches the Bearer header so the full
  // 153-book corpus returns. On web loadStoredNativeToken() resolves immediately
  // with null (no-op), so the cookie/credentials path is unaffected.
  useEffect(() => {
    let cancelled = false;
    void loadStoredNativeToken().then(() => {
      if (cancelled) return;
      listBooks()
        .then((bs) => {
          if (cancelled) return;
          setBooks(bs.filter((b) => !isSuppressedDuplicate(b)));
          setBooksError(null);
        })
        .catch((e) => {
          if (cancelled) return;
          setBooksError(String(e));
        });
    });
    return () => {
      cancelled = true;
    };
  }, []);

  // /v1/subscriptions/me once on mount. Failure is silent — anonymous
  // reader still works as before; the chrome just hides the partner
  // link.
  //
  // S178 — await loadStoredNativeToken() before the fetch fires so the
  // in-memory JWT cache is hydrated from Capacitor Preferences and the
  // Bearer header attaches. Without this, the me-fetch on the post-
  // sign-in window.location.assign("/read") reload raced against the
  // async Preferences read, fired without auth, came back null, and
  // the chrome showed "Sign in" even though sign-in had succeeded. On
  // web, loadStoredNativeToken() returns immediately with null (no-op)
  // so the PWA path is unaffected. loadStoredNativeToken is idempotent
  // — it's already called once at App mount; calling it again here
  // means we await the same Preferences read, not a second one of
  // consequence.
  useEffect(() => {
    let cancelled = false;
    void loadStoredNativeToken().then(() => {
      if (cancelled) return;
      getSubscriptionMe()
        .then((m) => {
          if (cancelled) return;
          setMe(m);
          setMeChecked(true);
        })
        .catch(() => {
          if (cancelled) return;
          setMe(null);
          setMeChecked(true);
        });
    });
    return () => {
      cancelled = true;
    };
  }, []);

  // Read-through cache scope. The content cache keys static reading
  // payloads by the caller's tier so a free reader and a paid reader
  // never read each other's entries (some payloads vary by tier — §28
  // interlinear fields, locked commentary bodies, book-level 200-vs-404).
  // Until /me resolves the cache stays in pass-through mode and stores
  // nothing; the server computes entitlement from the JWT, so committing
  // a payload to a tier key before the tier is known could mis-file a
  // paid response under "free". meChecked flips true even for anonymous
  // callers (tier → "free"), so this always activates the cache exactly
  // once the entitlement is settled.
  useEffect(() => {
    if (!meChecked) return;
    setContentCacheScope(me?.tier ?? "free");
  }, [meChecked, me?.tier]);

  // S116 — hydrate saved reading position on mount. Resolution order
  // (handled inside loadInitialPosition): API row → localStorage row
  // → null (caller stays at the Genesis/1/1 defaults). When a saved
  // position resolves to a non-verse-1 anchor, `initialScrollVerse`
  // is set so the post-chapter-load effect can scrollIntoView. The
  // `hydrated` flag flips true once this completes regardless of
  // outcome — that gates the save effect so the initial paint at
  // Genesis/1/1 never overwrites the saved row before hydrate.
  //
  // S201 — await loadStoredNativeToken() before loadInitialPosition()
  // fires, the same native-token race fixed for /me (S178) and
  // listBooks (S200). getReadingPosition() is auth-gated (401 →
  // anonymous → fall through to localStorage). On the native shell the
  // JWT hydrates asynchronously from Capacitor Preferences; firing the
  // position read before the in-memory cache is seeded sends an
  // anonymous request, so a signed-in partner's server-saved position
  // is missed on every cold launch and the reader silently falls back
  // to the localStorage row (or Genesis 1:1). This effect is mount-once
  // — it never re-fires — so unlike the chapter-keyed fetches it cannot
  // self-heal on navigation; the await is the only fix. Awaiting here
  // also means the hydrated book/chapter the position resolves to is
  // set AFTER the token is live, so the downstream getChapter /
  // highlights / bookmarks / words fetches for that chapter carry the
  // Bearer header too. On web loadStoredNativeToken() resolves
  // immediately with null (no-op); the cookie path is unaffected.
  useEffect(() => {
    let cancelled = false;
    void loadStoredNativeToken().then(() => {
      if (cancelled) return;
      loadInitialPosition()
        .then((pos) => {
          if (cancelled) return;
          if (pos !== null) {
            setSelectedBookSlug(pos.bookSlug);
            setSelectedChapter(pos.chapter);
            setCurrentVerse(pos.verseNumber);
            if (pos.verseNumber > 1) {
              setInitialScrollVerse(pos.verseNumber);
            }
          }
          setHydrated(true);
        })
        .catch(() => {
          if (cancelled) return;
          setHydrated(true);
        });
    });
    return () => {
      cancelled = true;
      cancelPendingSave();
    };
  }, []);

  // Chapters list reloads when the selected book changes.
  useEffect(() => {
    if (!selectedBookSlug) return;
    setChaptersResp(null);
    const handle = readThrough(
      { layer: "chapters", book: selectedBookSlug, chapter: 0 },
      () => listChapters(selectedBookSlug),
      {
        onData: (r) => {
          setChaptersResp(r);
          // S226 — snap to the book's first available chapter when the
          // current selection isn't one of this book's chapters. The book
          // picker (and cross-book nav) default a new selection to chapter
          // 1, but not every book starts at 1: the Sonnini "Acts 29 — The
          // Lost Chapter" book carries its sole chapter as number 29 (so it
          // reads as the continuation of Acts 28). Without this snap,
          // getChapter(slug, 1) 404s and the reader shows a broken chapter.
          // selectedChapter is read from the closure captured when the book
          // changed (the picker sets slug + chapter together), which is the
          // value we want to validate; it is intentionally NOT a dep so the
          // chapter list isn't re-fetched on every in-book chapter change.
          const nums = r.chapters.map((c) => c.chapter_number);
          if (nums.length > 0 && !nums.includes(selectedChapter)) {
            setSelectedChapter(nums[0]);
          }
        },
        onError: (e) => setChapterError(String(e)),
      },
    );
    return () => handle.cancel();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedBookSlug]);

  // Chapter detail reloads when book OR chapter changes.
  //
  // S226 — gate the fetch on this book's chapter list so we never
  // request a chapter the book doesn't have. On a book change the
  // listChapters effect above nulls chaptersResp first, so we wait for
  // the new book's list (matched by slug to ignore the prior book's
  // stale response) and only fetch once the selected chapter is known to
  // exist. In-book chapter changes don't re-run listChapters, so
  // chaptersResp is already loaded and the fetch fires immediately.
  useEffect(() => {
    if (!selectedBookSlug || !selectedChapter) return;
    if (!chaptersResp || chaptersResp.book.slug !== selectedBookSlug) return;
    if (!chaptersResp.chapters.some((c) => c.chapter_number === selectedChapter))
      return;
    setChapterLoading(true);
    setChapterError(null);
    // Read-through cache: a revisited chapter paints instantly from
    // IndexedDB, then revalidates in the background. The error path only
    // fires when nothing was served from cache (a true cold failure).
    const handle = readThrough(
      { layer: "chapter", book: selectedBookSlug, chapter: selectedChapter },
      () => getChapter(selectedBookSlug, selectedChapter),
      {
        onData: (d) => {
          setChapterDetail(d);
          setChapterLoading(false);
        },
        onError: (e) => {
          setChapterError(String(e));
          setChapterLoading(false);
        },
      },
    );
    return () => handle.cancel();
  }, [selectedBookSlug, selectedChapter, chaptersResp]);

  // S113: highlights reload alongside the chapter. Fetch is best-effort —
  // a 401 (anonymous caller) just leaves the map empty; the reader still
  // displays verses, just without any mark visuals. The picker enforces
  // sign-in when an anonymous caller actually long-presses.
  useEffect(() => {
    if (!selectedBookSlug || !selectedChapter) return;
    setHighlightsByVerse({});
    setPickerVerseId(null);
    setMenuState(null);
    setStrongsState(null);
    listChapterHighlights(selectedBookSlug, selectedChapter)
      .then((r) => {
        // S117 multi-mark — bucket marks by verse_id into arrays.
        // Order preserved from the API response; the verse-render
        // layer iterates the array in order and computes per-underline
        // text-underline-offset so multiple underlines on the same
        // verse stack cleanly.
        const map: Record<number, Highlight[]> = {};
        for (const h of r.highlights) {
          (map[h.verse_id] ??= []).push(h);
        }
        setHighlightsByVerse(map);
      })
      .catch(() => {
        // Anonymous or transient failure — leave the map empty.
      });
  }, [selectedBookSlug, selectedChapter]);

  // S204 — Witness marks reload alongside the chapter, but only while
  // the toggle is ON (the surface costs nothing when off). Best-effort:
  // a transient failure leaves the map empty and the reader is simply
  // unmarked. Re-fires when the partner flips the toggle on so the
  // current chapter marks appear without a chapter change. Public
  // endpoint — anonymous callers get the full proclamation surface.
  useEffect(() => {
    if (!selectedBookSlug || !selectedChapter) return;
    setWitnessByVerse({});
    setExpandedWitnessVerseId(null);
    if (!witnessOn) return;
    const handle = readThrough(
      { layer: "witness", book: selectedBookSlug, chapter: selectedChapter },
      () => getChapterWitness(selectedBookSlug, selectedChapter),
      {
        onData: (r) => {
          const map: Record<number, WitnessEntry> = {};
          for (const entry of r.entries) {
            map[entry.verse_id] = entry;
          }
          setWitnessByVerse(map);
        },
        // Best-effort — a transient failure leaves the map empty.
      },
    );
    return () => handle.cancel();
  }, [selectedBookSlug, selectedChapter, witnessOn]);

  // S205 — Kingdom marks reload alongside the chapter, same pattern as
  // the Witness: only while the toggle is ON, best-effort, public
  // endpoint — anonymous callers get the full proclamation surface.
  useEffect(() => {
    if (!selectedBookSlug || !selectedChapter) return;
    setKingdomByVerse({});
    setExpandedKingdomVerseId(null);
    if (!kingdomOn) return;
    const handle = readThrough(
      { layer: "kingdom", book: selectedBookSlug, chapter: selectedChapter },
      () => getChapterKingdom(selectedBookSlug, selectedChapter),
      {
        onData: (r) => {
          const map: Record<number, KingdomEntry> = {};
          for (const entry of r.entries) {
            map[entry.verse_id] = entry;
          }
          setKingdomByVerse(map);
        },
        // Best-effort — a transient failure leaves the map empty.
      },
    );
    return () => handle.cancel();
  }, [selectedBookSlug, selectedChapter, kingdomOn]);

  // S124 W5 — bookmarks reload alongside the chapter. Same best-effort
  // pattern as highlights — 401 (anonymous) leaves the map empty;
  // partner sees no bookmark glyphs but the reader still works. Sheet
  // open state also resets on chapter change so stale ids don't render.
  useEffect(() => {
    if (!selectedBookSlug || !selectedChapter) return;
    setBookmarksByVerse({});
    setBookmarkSheetVerseId(null);
    listChapterBookmarks(selectedBookSlug, selectedChapter)
      .then((r) => {
        const map: Record<number, Bookmark> = {};
        for (const bm of r.bookmarks) {
          map[bm.verse_id] = bm;
        }
        setBookmarksByVerse(map);
      })
      .catch(() => {
        // Anonymous or transient failure — leave the map empty.
      });
  }, [selectedBookSlug, selectedChapter]);

  // S124 W5 — notes load once on mount. Single global notepad scope:
  // every entry across every chapter comes back in one fetch (server-
  // resolved verse_ref on each entry powers per-entry headers without
  // chapter-local resolution). Refreshes on Save via the onSaved
  // callback appending the new entry. 401 (anonymous) leaves the array
  // empty; the panel renders the empty-state copy.
  //
  // S201 — await loadStoredNativeToken() before listNotes() fires, the
  // same native-token race fixed for /me (S178) and listBooks (S200).
  // /v1/notes is auth-gated (401 → empty for anonymous). This effect has
  // an empty dependency array and never re-fires, so on the native shell
  // a signed-in partner's notes raced the async Preferences read, came
  // back 401-empty, and stayed empty for the entire session (it only
  // repopulates when the partner adds a new note via the onSaved
  // callback). Awaiting the token hydration attaches the Bearer header so
  // the partner's existing notes load on launch. On web it's a no-op.
  useEffect(() => {
    let cancelled = false;
    void loadStoredNativeToken().then(() => {
      if (cancelled) return;
      listNotes()
        .then((r) => {
          if (cancelled) return;
          setNotes(r.notes);
        })
        .catch(() => {
          // Anonymous or transient failure — empty state stands.
        });
    });
    return () => {
      cancelled = true;
    };
  }, []);

  // S121 W3 — chapter Strong's-words reload alongside the chapter.
  // Single batched fetch (replaces N parallel per-verse calls). Public
  // endpoint, no auth, no tier gate — all partners get tap-on-word.
  // Failure leaves the map empty and verses render plain text (no
  // tappability) — graceful degradation per the publish-then-edit
  // posture.
  useEffect(() => {
    if (!selectedBookSlug || !selectedChapter) return;
    setWordsByVerse({});
    const handle = readThrough(
      { layer: "words", book: selectedBookSlug, chapter: selectedChapter },
      () => getChapterWords(selectedBookSlug, selectedChapter),
      {
        onData: (r: ChapterWordsResponse) => {
          const map: Record<number, VerseWord[]> = {};
          for (const v of r.verses) {
            map[v.verse_id] = v.words;
          }
          setWordsByVerse(map);
        },
        // Network / 404 / transient — leave the map empty; verses render
        // plain text until the next chapter load.
      },
    );
    return () => handle.cancel();
  }, [selectedBookSlug, selectedChapter]);

  // S116 — IntersectionObserver attach. Recreates the observer each
  // time chapterDetail changes (chapter-load swaps the verse DOM
  // nodes). Maintains a Map<verseNumber, boundingRectTop> of
  // currently intersecting verses; on every callback batch, emits the
  // verse with the smallest top value (topmost on screen) as the
  // current reading position. rootMargin tightens the intersection
  // band to roughly the upper third of the viewport so a partner
  // who's reading toward the bottom of the visible area doesn't
  // accidentally save the verse just below their gaze.
  //
  // Gated on initialScrollVerse===null so that the first attach after
  // a hydrate-driven scroll waits until the scroll has landed. Without
  // the gate, the observer would fire once with verse 1 (browser
  // un-scrolled), trigger a localStorage write of verse 1, then fire
  // again with the saved verse after the scroll — causing a brief
  // window where a refresh would resume to verse 1 instead of the
  // saved verse.
  useEffect(() => {
    if (!chapterDetail) return;
    if (initialScrollVerse !== null) return;
    // Clean up any previous observer + reset the visible map.
    if (verseObserverRef.current) {
      verseObserverRef.current.disconnect();
      verseObserverRef.current = null;
    }
    visibleVersesRef.current.clear();

    const observer = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          const vnAttr = (entry.target as HTMLElement).dataset.verseNumber;
          if (!vnAttr) continue;
          const vn = Number(vnAttr);
          if (entry.isIntersecting) {
            visibleVersesRef.current.set(vn, entry.boundingClientRect.top);
          } else {
            visibleVersesRef.current.delete(vn);
          }
        }
        // Find topmost visible verse (smallest top value).
        let topVerse: number | null = null;
        let topVerseY = Infinity;
        for (const [vn, y] of visibleVersesRef.current) {
          if (y < topVerseY) {
            topVerseY = y;
            topVerse = vn;
          }
        }
        if (topVerse !== null) {
          setCurrentVerse(topVerse);
        }
      },
      {
        // Upper-third band — verses below the middle of the viewport
        // don't compete for the "topmost" slot until the partner
        // scrolls them up.
        rootMargin: "0px 0px -50% 0px",
        threshold: [0, 0.25, 0.5, 1],
      }
    );

    // Attach to every verse span rendered for this chapter.
    document
      .querySelectorAll<HTMLElement>("[data-verse-number]")
      .forEach((el) => observer.observe(el));
    verseObserverRef.current = observer;

    return () => {
      observer.disconnect();
      verseObserverRef.current = null;
      visibleVersesRef.current.clear();
    };
  }, [chapterDetail, initialScrollVerse]);

  // S116 — scroll to saved verse once the chapter renders. Fires when
  // hydrate determined an initialScrollVerse > 1 and the chapterDetail
  // has loaded (verse DOM is present). After scrolling, clears the
  // target so subsequent chapter-changes don't re-scroll.
  useEffect(() => {
    if (!chapterDetail) return;
    if (initialScrollVerse === null) return;
    // Small delay to let the IntersectionObserver attach + paint settle.
    const handle = setTimeout(() => {
      const el = document.querySelector<HTMLElement>(
        `[data-verse-number="${initialScrollVerse}"]`
      );
      if (el) {
        el.scrollIntoView({ behavior: "auto", block: "start" });
      }
      setInitialScrollVerse(null);
    }, 50);
    return () => clearTimeout(handle);
  }, [chapterDetail, initialScrollVerse]);

  // S157 — auto-advance-after-chapter-load. When TTS playback hit
  // end-of-chapter, queueChapterFromVerse fired navigateNext() and set
  // autoAdvanceAfterLoad=true. The post-chapter-load effect below kicks
  // off TTS from verse 1 of the newly-loaded chapter so playback
  // continues seamlessly across the chapter boundary per §25 + §19.
  // Bounce at the witness-category edge (where navigateNext early-
  // returns null without loading) leaves chapterDetail unchanged — the
  // flag stays set but the effect doesn't re-fire because chapterDetail
  // didn't change. handleAudioPlayerClose clears the flag explicitly.
  useEffect(() => {
    if (!autoAdvanceAfterLoad) return;
    if (!chapterDetail) return;
    if (chapterDetail.verses.length === 0) return;
    // Clear the flag BEFORE kicking off the queue so a subsequent
    // chapter-load (e.g., partner manually navigates while in auto-
    // advance) doesn't trigger another auto-advance unintentionally.
    setAutoAdvanceAfterLoad(false);
    queueChapterFromVerse(chapterDetail.verses[0].id);
    // queueChapterFromVerse intentionally omitted from deps — it's a
    // stable closure that reads current state via refs / current values.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [autoAdvanceAfterLoad, chapterDetail]);

  // S157 — stop audio on MANUAL chapter navigation. Partner clicks the
  // §19 chapter-nav arrows / picker / search-result / Strong's concord-
  // ance navigation / cross-ref tap while audio is playing → audio
  // should stop. The auto-advance path (which also changes selected-
  // Chapter) is distinguished by the autoAdvanceAfterLoad flag being
  // true at the moment selectedChapter changes. Mount fires this once
  // with audioPlayerOpen=false (default) — the guard returns early.
  useEffect(() => {
    if (!audioPlayerOpen) return;
    if (autoAdvanceAfterLoad) return; // auto-advance handles its own re-queue
    handleAudioPlayerClose();
    // selectedBookSlug + selectedChapter are the deps; other refs
    // intentionally omitted (we only stop on chapter change, not on
    // every audioPlayerOpen toggle).
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedBookSlug, selectedChapter]);

  // S116 — debounced save on position change. Gated on `hydrated` so
  // the Genesis/1/1 default never overwrites a real saved row before
  // hydrate completes. Anonymous callers still get a localStorage
  // write through saveReadingPositionDebounced (the API call inside
  // is best-effort and 401s silently). Debounce window lives in
  // lib/reading-position.ts (~1500ms); rapid scrolls collapse to one
  // API write at the end of the burst.
  useEffect(() => {
    if (!hydrated) return;
    if (!selectedBookSlug || !selectedChapter || !currentVerse) return;
    saveReadingPositionDebounced({
      bookSlug: selectedBookSlug,
      chapter: selectedChapter,
      verseNumber: currentVerse,
    });
  }, [hydrated, selectedBookSlug, selectedChapter, currentVerse]);

  // Books grouped by witness_category for the picker.
  const booksByCategory = useMemo(() => {
    const groups: Record<string, BookSummary[]> = {};
    for (const b of books) {
      (groups[b.witness_category] ??= []).push(b);
    }
    for (const k of Object.keys(groups)) {
      groups[k].sort((a, b) => a.canonical_order - b.canonical_order);
    }
    return groups;
  }, [books]);

  // S226 — color-coded section dividers for the book picker. The picker
  // is one native <select>; its sections are <optgroup>s grouped by
  // witness_category. We weave metallic divider rows (styled, disabled
  // <option>s) between the sections, color-keyed to the same source-class
  // palette the reader already uses (COLOR_PALETTE.md §9):
  //
  //   • emerald  — Old Testament → New Testament (the seam lives INSIDE
  //                the canon group, which carries both testaments)
  //   • gold     — New Testament → the extra-canonical library
  //   • argaman  — between the extra-canonical sub-sections
  //   • techelet — sets off the Josephus works (historical_witness)
  //
  // Categories render in the schema's witness_category order so the
  // dividers land on the right boundaries regardless of API row order;
  // any unknown category the API adds later falls in after the known
  // ones (first-seen order) so nothing is silently dropped.
  const bookMenuNodes = useMemo(() => {
    const CATEGORY_ORDER = [
      "canon",
      "apocrypha",
      "pseudepigrapha",
      "apostolic_fathers",
      "apocryphal_gospels",
      "historical_witness",
      "disputed_witness",
    ];
    const known = new Set(CATEGORY_ORDER);
    const order = [
      ...CATEGORY_ORDER.filter((c) => booksByCategory[c]?.length),
      ...Object.keys(booksByCategory).filter((c) => !known.has(c)),
    ];

    const RULE = "————————————";
    const divider = (key: string, tone: string, label?: string) => (
      <option
        key={key}
        disabled
        value=""
        className={`book-menu-divider book-menu-divider-${tone}`}
      >
        {label ? `——  ${label}  ——` : RULE}
      </option>
    );

    const nodes: ReactNode[] = [];
    let goldUsed = false;
    for (const cat of order) {
      const list = booksByCategory[cat] ?? [];
      if (cat === "canon") {
        // Split the 66-book canon at the Old→New Testament seam with an
        // emerald rule. The list is canonical-order sorted, so every
        // Tanakh book precedes every NT book; the seam is the first NT.
        const items: ReactNode[] = [];
        let ntMarked = false;
        for (const b of list) {
          if (!ntMarked && classifyBookSlug(b.slug) === "nt") {
            items.push(divider("div-ot-nt", "emerald", "New Testament"));
            ntMarked = true;
          }
          items.push(
            <option key={b.id} value={b.slug}>
              {b.title}
            </option>
          );
        }
        nodes.push(
          <optgroup key={cat} label={prettyCategory(cat)}>
            {items}
          </optgroup>
        );
        continue;
      }
      // Non-canon: a divider precedes each extra-canonical optgroup. The
      // first one is the canon→extras boundary (gold); Josephus
      // (historical_witness) gets its own techelet rule; the remaining
      // extra-canonical sub-sections are parted by argaman rules.
      if (cat === "historical_witness") {
        nodes.push(divider(`div-${cat}`, "techelet", "Josephus"));
      } else if (!goldUsed) {
        nodes.push(divider(`div-${cat}`, "gold", "Extra-Canonical"));
        goldUsed = true;
      } else {
        nodes.push(divider(`div-${cat}`, "argaman"));
      }
      nodes.push(
        <optgroup key={cat} label={prettyCategory(cat)}>
          {list.map((b) => (
            <option key={b.id} value={b.slug}>
              {b.title}
            </option>
          ))}
        </optgroup>
      );
    }
    return nodes;
  }, [booksByCategory]);

  const chaptersForBook = chaptersResp?.chapters ?? [];

  // S121 — chapter navigation (W2). Three input surfaces (touch swipe,
  // arrow keys, visible chrome buttons) converge on one navigation
  // handler. The handler resets currentVerse to 1 alongside the
  // book/chapter setters so the S116 reading-position save effect
  // doesn't briefly persist the previous chapter's last-visible verse
  // against the new chapter. Per DESIGN_LANGUAGE.md §19.
  //
  // Bounce affordance: when nav lands at a witness_category edge
  // (Genesis 1 prev / Revelation 22 next in canon; equivalent edges
  // in other categories), the disabled-direction arrow shakes briefly
  // to confirm the input was registered without changing the chapter.
  const [bouncePrev, setBouncePrev] = useState<boolean>(false);
  const [bounceNext, setBounceNext] = useState<boolean>(false);

  // Pre-compute targets so the chrome buttons can render disabled
  // when at a category edge. Recomputes on books/selection change.
  const prevTarget = useMemo(
    () => prevChapterTarget(books, selectedBookSlug, selectedChapter),
    [books, selectedBookSlug, selectedChapter]
  );
  const nextTarget = useMemo(
    () => nextChapterTarget(books, selectedBookSlug, selectedChapter, chaptersResp),
    [books, selectedBookSlug, selectedChapter, chaptersResp]
  );

  function triggerBouncePrev() {
    setBouncePrev(true);
    setTimeout(() => setBouncePrev(false), 300);
  }
  function triggerBounceNext() {
    setBounceNext(true);
    setTimeout(() => setBounceNext(false), 300);
  }

  // Core navigator. Both arrow buttons, the keyboard listener, the
  // swipe handler, and the bottom-of-chapter continuation row all
  // funnel here. Async because the prev-across-book-boundary case
  // needs to fetch the previous book's chapter count to learn its
  // last chapter number; forward navigation across a book boundary
  // is always chapter 1 so no fetch is needed there.
  async function navigatePrev() {
    if (prevTarget === null) {
      triggerBouncePrev();
      return;
    }
    if (prevTarget.chapter === "last") {
      // Cross-book backward — fetch the destination book's chapter
      // list to learn its last chapter number, then set state.
      try {
        const resp = await listChapters(prevTarget.bookSlug);
        const lastCh = lastChapterNumber(resp);
        setSelectedBookSlug(prevTarget.bookSlug);
        setSelectedChapter(lastCh);
        setCurrentVerse(1);
      } catch {
        // If the chapters fetch fails (network), fall back to
        // chapter 1 of the destination book rather than leaving the
        // nav in limbo.
        setSelectedBookSlug(prevTarget.bookSlug);
        setSelectedChapter(1);
        setCurrentVerse(1);
      }
    } else {
      setSelectedBookSlug(prevTarget.bookSlug);
      setSelectedChapter(prevTarget.chapter);
      setCurrentVerse(1);
    }
  }

  function navigateNext() {
    if (nextTarget === null) {
      triggerBounceNext();
      return;
    }
    // nextTarget.chapter is always a number (1 across book boundary;
    // currentChapter+1 within a book) per the helper contract.
    const ch =
      nextTarget.chapter === "last" ? 1 : nextTarget.chapter;
    setSelectedBookSlug(nextTarget.bookSlug);
    setSelectedChapter(ch);
    setCurrentVerse(1);
  }

  // S121 — global keyboard listener (left/right arrow keys). Skips
  // when focus is in an input/select/textarea/contenteditable so
  // typing in the picker doesn't pull the chapter sideways. Skips
  // when any modifier key is held so browser back/forward shortcuts
  // (Cmd+←, Alt+←) are unaffected.
  useEffect(() => {
    function onKeyDown(e: KeyboardEvent) {
      if (e.key !== "ArrowLeft" && e.key !== "ArrowRight") return;
      if (e.metaKey || e.ctrlKey || e.altKey) return;
      const target = e.target as HTMLElement | null;
      if (target) {
        const tag = target.tagName;
        if (
          tag === "INPUT" ||
          tag === "SELECT" ||
          tag === "TEXTAREA" ||
          target.isContentEditable
        ) {
          return;
        }
      }
      e.preventDefault();
      if (e.key === "ArrowLeft") {
        navigatePrev();
      } else {
        navigateNext();
      }
    }
    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
    // navigatePrev / navigateNext close over prevTarget + nextTarget;
    // re-bind whenever those change so the listener always sees the
    // freshest selection state.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [prevTarget, nextTarget]);

  // S125 W6 — Cmd-K (macOS) / Ctrl-K (Windows/Linux) opens the search
  // modal per DESIGN_LANGUAGE.md §23. Fires only when the modal is
  // closed (re-opening from inside is a no-op); skips when focus is
  // in an input/select/textarea/contenteditable so a partner typing
  // in a Notes textarea can use Ctrl-K for whatever the OS routes it
  // to without interception. Escape inside the modal handles close
  // through SearchModal's own keydown listener.
  useEffect(() => {
    function onKeyDown(e: KeyboardEvent) {
      if (e.key !== "k" && e.key !== "K") return;
      // Require exactly one of Meta (macOS) or Ctrl (Windows/Linux).
      // Both held → let OS / browser handle it.
      const hasMeta = e.metaKey;
      const hasCtrl = e.ctrlKey;
      if (hasMeta === hasCtrl) return; // both true or both false → skip
      if (e.altKey || e.shiftKey) return;
      if (searchOpen) return; // already open
      const target = e.target as HTMLElement | null;
      if (target) {
        const tag = target.tagName;
        if (
          tag === "INPUT" ||
          tag === "SELECT" ||
          tag === "TEXTAREA" ||
          target.isContentEditable
        ) {
          return;
        }
      }
      e.preventDefault();
      setSearchOpen(true);
    }
    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
  }, [searchOpen]);

  // S123 W4 — chapter navigation silently cancels range mode. Per
  // DESIGN_LANGUAGE.md §21, W4's range-selection UX is same-chapter
  // scope; a chapter-change implies the partner abandoned the range
  // (or arrived here from a navigation surface that fired during range
  // mode for an unrelated reason). Fires for every change to
  // selectedBookSlug or selectedChapter, including the S116 initial
  // hydrate (harmless because rangeState is already IDLE at mount).
  useEffect(() => {
    if (rangeState.status !== "idle") {
      setRangeState(RANGE_IDLE);
      setRangePickerOpen(false);
      setPickerRangeVerseIds(null);
    }
    // Intentionally only fires on chapter-change, not on rangeState
    // change (that would cause re-entry into the effect's own cancel).
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedBookSlug, selectedChapter]);

  // S123 W4 — Escape key cancels range mode at the App level. The
  // RangeActionPicker has its own Escape-to-close that closes the
  // picker (which calls cancelRange via onClose), so this only fires
  // for the SELECTING state (after "Start range here" but before the
  // end verse is tapped) where no modal owns Escape. The window-level
  // listener is registered for all rangeState states but no-ops outside
  // selecting to avoid stealing Escape from other surfaces.
  useEffect(() => {
    if (rangeState.status !== "selecting") return;
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") {
        cancelRange();
      }
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [rangeState.status]);

  // S121 — touch-swipe state. pointerdown records the start position
  // and pointer type; pointermove cancels the long-press timer if the
  // user is swiping (so a swipe over a verse doesn't open the picker
  // mid-swipe); pointerup checks the threshold + angle constraint and
  // navigates. Per DESIGN_LANGUAGE.md §19: 60px horizontal threshold,
  // |dx| > |dy| * 1.5 angle constraint, single-touch only, touch
  // pointerType only (mouse drag / stylus drag don't trigger nav).
  const swipeStartRef = useRef<{
    x: number;
    y: number;
    pointerType: string;
  } | null>(null);

  function onArticlePointerDown(e: React.PointerEvent) {
    if (e.pointerType !== "touch") {
      swipeStartRef.current = null;
      return;
    }
    swipeStartRef.current = {
      x: e.clientX,
      y: e.clientY,
      pointerType: e.pointerType,
    };
  }
  function onArticlePointerMove(e: React.PointerEvent) {
    const start = swipeStartRef.current;
    if (!start) return;
    const dx = e.clientX - start.x;
    if (Math.abs(dx) > 10) {
      // The user is swiping — cancel the verse-level long-press timer
      // so the swipe doesn't accidentally open the picker.
      handlePointerCancel();
    }
  }
  function onArticlePointerUp(e: React.PointerEvent) {
    const start = swipeStartRef.current;
    swipeStartRef.current = null;
    if (!start) return;
    const dx = e.clientX - start.x;
    const dy = e.clientY - start.y;
    if (Math.abs(dx) < 60) return;
    if (Math.abs(dx) <= Math.abs(dy) * 1.5) return;
    // Swipe LEFT (dx < 0) = next chapter; swipe RIGHT (dx > 0) = prev.
    if (dx < 0) {
      navigateNext();
    } else {
      navigatePrev();
    }
  }
  function onArticlePointerCancel() {
    swipeStartRef.current = null;
  }

  return (
    <div className="mx-auto max-w-3xl px-6 py-8">
      <header className="mb-6 border-b border-[var(--reader-accent)] pb-4">
        {/* S173 + S174 — chrome layout, always stacked.
            S173 staged the mobile fix as a flip: stack vertically
            below sm: (640px), return to side-by-side row above.
            S173-close partner-walks surfaced the narrow-desktop edge:
            at 700-900px Safari windows (just above the sm: flip) the
            row layout returns, the chrome cluster's intrinsic width
            (~700-750px across the seven metallic buttons) eats the
            available horizontal space, and the title h1 squeezes into
            a narrow column or overlaps the Listen button.
            S174 fix: drop the side-by-side flip entirely. The header
            stays stacked at all widths — title on top, chrome row
            below. Tablet and laptop have plenty of vertical room;
            the trade for a clean wide-screen row read isn't worth
            the narrow-desktop overlap. The chrome row keeps flex-wrap
            at all widths so on a wide viewport the cluster fits on a
            single row at intrinsic width (Listen / Search / Bookmarks
            / Notes / Theme / Settings / Manage-account-or-Sign-in),
            and on narrow viewports the buttons pack onto 2-3 rows
            without scroll.
            shrink-0 via the arbitrary [&>*] selector keeps each
            button at its natural width on either layout. */}
        <div className="flex flex-col gap-4">
          <div className="min-w-0">
            {/* S172.13 — brand title rendered as the §5 spectral-blue
                verse-number accent (--reader-accent, #0084FF). Pulls
                the brand into the same color family as the verse-number
                pointers that the partner sees throughout the body —
                consistent "this is the framework's color" register
                rather than a separate chrome surface. */}
            <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-accent)]">
              The Remnant of Promise Official Study Bible
            </h1>
            <p className="mt-1 text-sm text-[var(--reader-muted)]">
              Restored Names Edition
            </p>
          </div>
          <div className="flex flex-wrap items-start gap-2 [&>*]:shrink-0">
            {/* S157 — chrome Listen button per DESIGN_LANGUAGE.md §25.
                Opens the bottom-pinned AudioPlayer starting from the
                verse currently centered in the viewport (S116
                IntersectionObserver pattern — same source-of-truth as
                reading-position). Free at all tiers per §9 + S141
                launch-scope revision. Same bordered-chrome button
                family as the other chrome cluster buttons per §1. */}
            <button
              type="button"
              onClick={startPlaybackFromCurrentVerse}
              aria-label="Listen to chapter"
              title="Listen to chapter"
              className="chrome-metal chrome-metal-gold"
            >
              <span aria-hidden="true">▶</span>
              <span>Listen</span>
            </button>
            {/* S125 W6 — chrome Search button. Opens the SearchModal
                pop-up per DESIGN_LANGUAGE.md §23. Cmd-K/Ctrl-K is the
                keyboard equivalent (window-level listener above). Per
                §23 the chrome cluster becomes
                [Listen][Search][Notes][Theme][Subscription CTA] — same
                bordered-chrome button family per §1. Search is chrome-
                scope, not verse-scope, so it sits in the chrome cluster
                rather than the §20 VerseActionMenu. */}
            <button
              type="button"
              onClick={openSearchModal}
              aria-label="Open search"
              aria-keyshortcuts="Meta+K Control+K"
              title="Open search (Cmd-K / Ctrl-K)"
              className="chrome-metal chrome-metal-techelet"
            >
              <span aria-hidden="true">⌕</span>
              <span>Search</span>
            </button>
            {/* S166 — §29 chrome Bookmarks button. Opens the
                BookmarksIndex sheet (global list of every bookmark
                across the canon, newest-first). Per §29, the chrome
                cluster becomes [Bookmarks][Notes][Theme][Subscription
                CTA] — Bookmarks left of Notes by partner-content-
                surface clustering. Same bordered-chrome button family
                per §1. ⚑ glyph matches the §22 inline-bookmark glyph
                for visual continuity. Free-tier; no tier-locked chip. */}
            <button
              type="button"
              onClick={() => setBookmarksIndexOpen(true)}
              aria-label="Open bookmarks"
              title="Open bookmarks"
              className="chrome-metal chrome-metal-argaman"
            >
              <span aria-hidden="true">⚑</span>
              <span>Bookmarks</span>
            </button>
            {/* S203 — Session C chrome "My Study" button. Opens the
                unified personal-apparatus home (notes + bookmarks +
                highlights: search, collections, color sections,
                export). Sits left of Notes with the partner-content
                cluster. Spectral register (S203 — gold was already
                Listen's, Yoshi's catch): the #0084FF apparatus color
                in the metallic treatment, matching the Study Notes
                tier chips inside the surface this button opens. Free
                tier opens it too (capped home + lever inside). */}
            <button
              type="button"
              onClick={() => setMyStudyOpen(true)}
              aria-label="Open My Study"
              title="Open My Study"
              className="chrome-metal chrome-metal-spectral"
            >
              <span aria-hidden="true">❖</span>
              <span>My Study</span>
            </button>
            {/* S124 W5 — chrome Notes button. Opens the NotesPanel
                without an anchor (free-form path) so partners can
                read existing notes or add free-form entries without
                anchoring to a specific verse. Per §22, the chrome
                cluster becomes [Notes][Theme][Subscription CTA] —
                same bordered-chrome button family per §1. S166: now
                sits right of the new §29 Bookmarks button. */}
            <button
              type="button"
              onClick={openNotesPanel}
              aria-label="Open notes"
              title="Open notes"
              className="chrome-metal chrome-metal-scarlet"
            >
              <span aria-hidden="true">✎</span>
              <span>Notes</span>
            </button>
            {/* S228 — door back to the Today home hub. The hub is now the
                app's post-auth landing, so the Reader needs a one-tap way
                home (peer to The Appointed Times and Settings — same
                full-page <a href> navigation, not a modal). Gold register
                (the feast-gold front-door light), ☼ glyph for the new day.
                Free at all tiers — the hub needs no backend. */}
            <a
              href="/today"
              aria-label="Go to Today — the home hub"
              title="Today"
              className="chrome-metal chrome-metal-gold"
            >
              <span aria-hidden="true">☼</span>
              <span>Today</span>
            </a>
            {/* S227 — chrome entry point to The Appointed Times (the
                biblical-calendar surface at /calendar). The calendar was
                built as a standalone, auth-free route (it doubles as the
                engine's live demo), but the app drops authenticated
                partners straight into the reader and never shows the
                website Landing page — so before this there was NO in-app
                door to it. It sits in the main chrome cluster alongside
                the other feature buttons (a top-level destination, peer
                to ⚙ Settings — hence the same `<a href>` full-page
                navigation, not a modal). The calendar's own Header
                carries a "← Back to reading" link to /read, so the round
                trip lands the partner back in the reader, not a dead end.
                Its dedicated `moedim` register (techelet firmament body,
                gold feast frame) previews the calendar surface and stays
                distinct from Search (techelet) and Listen (gold). ☾ glyph
                for the moon-reckoned moedim. Free at all tiers — the
                calendar needs no backend. */}
            <a
              href="/calendar"
              aria-label="Open The Appointed Times calendar"
              title="The Appointed Times"
              className="chrome-metal chrome-metal-moedim"
            >
              <span aria-hidden="true">☾</span>
              <span>The Appointed Times</span>
            </a>
            <ThemeToggle />
            {/* S172 — Settings entry in the top-right chrome cluster.
                Slots between the Theme toggle (display chrome) and the
                Account CTA (subscription state). Same bordered-chrome
                button family per §1 as the other cluster buttons.
                ⚙ gear glyph + 'Settings' label. Opens /settings. */}
            <a
              href="/settings"
              aria-label="Open settings"
              title="Open settings"
              className="chrome-metal chrome-metal-bronze"
            >
              <span aria-hidden="true">⚙</span>
              <span>Settings</span>
            </a>
            {/* S172 + S174 — account / partnership chrome in the
                metallic emerald register. Foundational ongoing
                relationship per §3 — the same green that marks Tanakh-
                foundation books in the cross-reference pills, here
                applied to the account that grounds the partner's
                access.
                S174 changes:
                  - "Manage partnership" → "Manage account" per Yoshi
                    voice-call. The page at /manage continues to surface
                    partnership state for the partners who have one.
                  - Anonymous branch added: when the me-fetch has
                    completed and returned no session (meChecked &&
                    !me), surface a "Sign in" chrome entry in the same
                    emerald register. Before S174 the only sign-in path
                    for a logged-out partner went through a paid-tier
                    CTA gate; now the chrome carries it directly.
                Plain "Sign in" copy stands as the auth-doorway label —
                the framework voice doesn't impose on neutral utility
                verbs, and the emerald color thread already names this
                slot as the relationship gateway. */}
            {me && (me.status === "active" || me.status === "trialing") ? (
              <a href="/manage" className="chrome-metal chrome-metal-emerald">
                Manage account
              </a>
            ) : me && me.status === "none" ? (
              isNativeShell() ? null : (
                <a href="/pricing" className="chrome-metal chrome-metal-emerald">
                  Become a partner
                </a>
              )
            ) : me &&
              (me.status === "canceled" ||
                me.status === "past_due" ||
                me.status === "unpaid" ||
                me.status === "incomplete" ||
                me.status === "incomplete_expired") ? (
              isNativeShell() ? null : (
                <a href="/pricing" className="chrome-metal chrome-metal-emerald">
                  Resubscribe
                </a>
              )
            ) : meChecked ? (
              <a href="/sign-in" className="chrome-metal chrome-metal-emerald">
                Sign in
              </a>
            ) : null}
          </div>
        </div>
      </header>

      {booksError && (
        <div className="mb-4 rounded border border-red-300 bg-red-50 p-3 text-sm text-red-800">
          Books failed to load: {booksError}
        </div>
      )}

      <div className="mb-6 flex flex-wrap items-center gap-3 font-sans">
        {/*
          S121 — chrome chapter-nav arrows (W2). Bordered-chrome button
          family per DESIGN_LANGUAGE.md §1 + §19; chevron glyph carries
          the §5 spectral-blue accent. Disabled state at category edges
          with 200ms shake on click for bounce affordance. 44px+ hit
          target per §13 accessibility floor.
        */}
        <button
          type="button"
          onClick={navigatePrev}
          aria-label="Previous chapter"
          aria-disabled={prevTarget === null}
          title="Previous chapter (← arrow key)"
          className={`flex items-center justify-center rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1.5 text-base font-semibold text-[var(--reader-accent)] hover:opacity-90 ${
            prevTarget === null ? "opacity-30" : ""
          } ${bouncePrev ? "nav-bounce" : ""}`}
          style={{ minHeight: "2.5rem", minWidth: "2.5rem" }}
        >
          <span aria-hidden="true">←</span>
        </button>
        {/* S207 — min-w-0/max-w-full on the label AND the select: a
            <select>'s intrinsic min-width is its longest option, and the
            full 157-book library carries titles like "The Prayer of
            Azariah and the Song of the Three Children" (451px). Without
            the clamp the picker forces the whole page wider than narrow
            viewports and every surface clips off the right edge — the
            S206 "clipping bug", which only reproduced for signed-in
            partners at paid tiers because the free 66-book canon has no
            long titles. Clamped, the closed select ellipsizes its label;
            the opened dropdown is OS-rendered at full width, so nothing
            is lost. Verified live via 390px iframe probe (516px → 384px
            doc width) before commit. */}
        <label className="flex min-w-0 max-w-full items-center gap-2 text-sm text-[var(--reader-muted)]">
          <span>Book</span>
          <select
            value={selectedBookSlug}
            onChange={(e) => {
              setSelectedBookSlug(e.target.value);
              setSelectedChapter(1);
              // S116 — picker change resets verse to 1 so the save
              // effect doesn't briefly persist the previous chapter's
              // last-visible verse against the new book/chapter pair.
              setCurrentVerse(1);
            }}
            className="min-w-0 max-w-full rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 text-[var(--reader-text)]"
          >
            {/* S226 — metallic section dividers woven between the
                witness-category optgroups; see the bookMenuNodes memo.
                Each book stays keyed by b.id (Session 40 fix: Session 35
                widened books.slug UNIQUE to composite (edition_id, slug),
                so slugs like 'judith'/'tobit' recur across apocrypha
                editions and only the numeric id is unique). value={b.slug}
                stays — the picker's downstream consumers still key on
                slug. */}
            {bookMenuNodes}
          </select>
        </label>

        <label className="flex items-center gap-2 text-sm text-[var(--reader-muted)]">
          <span>Chapter</span>
          <select
            value={selectedChapter}
            onChange={(e) => {
              setSelectedChapter(Number(e.target.value));
              // S116 — chapter picker change resets verse to 1 for
              // the same reason as the book picker above.
              setCurrentVerse(1);
            }}
            className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 text-[var(--reader-text)]"
          >
            {chaptersForBook.map((c) => (
              <option key={c.chapter_number} value={c.chapter_number}>
                {c.chapter_number}
              </option>
            ))}
          </select>
        </label>
        {/* S121 — chrome next arrow (W2). Mirrors the prev arrow above. */}
        <button
          type="button"
          onClick={navigateNext}
          aria-label="Next chapter"
          aria-disabled={nextTarget === null}
          title="Next chapter (→ arrow key)"
          className={`flex items-center justify-center rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1.5 text-base font-semibold text-[var(--reader-accent)] hover:opacity-90 ${
            nextTarget === null ? "opacity-30" : ""
          } ${bounceNext ? "nav-bounce" : ""}`}
          style={{ minHeight: "2.5rem", minWidth: "2.5rem" }}
        >
          <span aria-hidden="true">→</span>
        </button>
        {/* S211 — Arranged Reading toggle: opens the chronological
            event-order sequence overlay. Separate from the canonical
            picker; does not change book order. */}
        <button
          type="button"
          onClick={() => setArrangedOpen((v) => !v)}
          aria-pressed={arrangedOpen}
          title="Arranged reading — read the whole library in chronological, event order. A separate sequence; it does not change the book order."
          className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1.5 text-sm font-medium text-[var(--reader-accent)] hover:opacity-90"
        >
          {arrangedOpen ? "Hide arranged" : "Arranged reading"}
        </button>
      </div>

      {arrangedOpen && (
        <ArrangedReading
          currentSlug={selectedBookSlug}
          currentChapter={selectedChapter}
          onNavigate={(slug, ch) => {
            setSelectedBookSlug(slug);
            setSelectedChapter(ch);
            setCurrentVerse(1);
          }}
        />
      )}

      {chapterError && (
        <div className="mb-4 rounded border border-red-300 bg-red-50 p-3 text-sm text-red-800">
          {chapterError}
        </div>
      )}

      {chapterLoading && !chapterDetail && (
        <p className="text-sm text-[var(--reader-muted)]">Loading…</p>
      )}

      {chapterDetail && (
        <article
          onPointerDown={onArticlePointerDown}
          onPointerMove={onArticlePointerMove}
          onPointerUp={onArticlePointerUp}
          onPointerCancel={onArticlePointerCancel}
          style={{ touchAction: "pan-y" }}
        >
          {/*
            S229 — Display-options bar (Yoshi "Option 2"). The study-aid
            + layer toggles that used to sit AFTER the scripture now live
            in this slim bar pinned at the TOP of the reading column
            (.study-bar in index.css is position:sticky; top:0), so they
            stay one tap away while reading. The bar collapses to a thin
            labelled handle (chevron) via studyBarCollapsed, persisted at
            localStorage rop_study_bar_collapsed_v1. Every toggle below is
            unchanged — only placement + the collapse affordance are new.
          */}
          <div
            className="study-bar"
            data-collapsed={studyBarCollapsed ? "true" : "false"}
          >
            <button
              type="button"
              onClick={toggleStudyBar}
              aria-expanded={!studyBarCollapsed}
              aria-controls="study-bar-pills"
              title={
                studyBarCollapsed
                  ? "Show display options (English helpers, Strong's, Interlinear, study aids, the Prophesied Kingdom Gospel, the Red-Pill Witness)"
                  : "Hide display options"
              }
              className="study-bar-handle"
            >
              <span className="study-bar-handle-label">Display options</span>
              <span className="study-bar-chevron" aria-hidden="true">
                {studyBarCollapsed ? "▼" : "▲"}
              </span>
            </button>
            {!studyBarCollapsed && (
              <div id="study-bar-pills" className="study-bar-pills">
            {/*
              S144 — parentheticals-hide toggle. Sits left of the study-
              aid toggle in the chrome strip. Default OFF (parentheticals
              visible) per the voice-skill retention-mechanism for first-
              time Christian readers; the reader who has internalized the
              restored names opts INTO the strip.

              Copy renamed 2026-05-26 (Yoshi): "Hide / Show English
              helpers" — friendlier than the prior "name translations"
              copy, and names what the parentheticals actually are for
              the reader (training wheels for the Hebrew restorations).

              Styling 2026-05-26 (Yoshi): metallic-emerald gradient per
              COLOR_PALETTE §3 (the expansion register) — same treatment
              as the ChapterCommentary "Read the basic walk →" / "Read
              the deeper dive →" pills. Semantically fits: "metallic
              green = more is hidden here, click to expand" reads as
              "metallic green = English helpers can be expanded/collapsed
              from this control." Sized to match the techelet study-aid
              toggle to its right (px-4 py-1.5 text-xs uppercase) so the
              chrome strip stays visually aligned.
            */}
            <button
              type="button"
              onClick={toggleHideParentheticals}
              aria-pressed={hideParentheticals}
              title="Hide or show the English helpers in parentheses after restored Sacred Names (e.g., Yahuah (LORD), Yashar'el (Israel), Mosheh (Moses)). Persists across chapters and reloads."
              className="rounded-md border border-[#2EFFA1] bg-gradient-to-r from-[#04321E] via-[#15A86A] to-[#04321E] px-4 py-1.5 font-sans text-xs font-semibold uppercase tracking-wide text-[#E6FFF2] shadow-sm hover:opacity-90"
            >
              {hideParentheticals
                ? "Show English helpers"
                : "Hide English helpers"}
            </button>
            {/*
              S160 — Strong's superscripts toggle (§27). Metallic argaman
              gradient per COLOR_PALETTE §1 covenant-body register —
              each Strong's number ties an English word back to its
              Hebrew/Greek covenant lexeme, which reads as the
              covenant-body affordance the argaman register carries.
              Distinct from the §144 English-helpers metallic-emerald
              gradient to its left so the partner reads two different
              functional registers. Same size + chrome-strip placement
              as the parentheticals toggle. Default OFF; tapping flips
              state and persists via lib/useStrongsSuperscriptsToggle
              (localStorage `rop_strongs_superscripts_v1`).
            */}
            <button
              type="button"
              onClick={toggleShowStrongsSuperscripts}
              aria-pressed={showStrongsSuperscripts}
              title="Show or hide Strong's H- and G-numbers as small superscripts after every word in the verse text. Tap any superscript to open the Strong's lookup, same as tapping the word itself. Persists across chapters and reloads."
              className="rounded-md border border-[#D4B0E0] bg-gradient-to-r from-[#3D1B5C] via-[#8E4FB3] to-[#3D1B5C] px-4 py-1.5 font-sans text-xs font-semibold uppercase tracking-wide text-[#F5E6FA] shadow-sm hover:opacity-90"
            >
              {showStrongsSuperscripts
                ? "Hide Strong's"
                : "Show Strong's"}
            </button>
            {/*
              S168 / S169 — §28 Interlinear toggle. S169 repaint per Yoshi
              live-walk redline 1: moved from metallic argaman to the
              **existing metallic-gold register** already in use on the
              §17 NT cross-reference mini-pill in
              `components/ChapterEndCard.tsx` (deep `#645028` shadow →
              `#B4A078` bright midtone → `#FCECAF` highlight specular).
              Snapped to those existing stops verbatim per Yoshi's
              live-walk call — the cross-refs gold renders prettier
              against the dark chrome strip than the deeper composed
              variant tried earlier; the lock is on the cross-refs
              stops. The §28 chrome pill and the NT cross-reference
              pill now share the same metallic-gold register;
              COLOR_PALETTE.md §3b is the register's formal
              documentation. The original-language layer is the
              priestly-witness register because the interlinear shows
              the source-language scripture the translators worked
              from — the priestly-text witness underneath the English.

              For Companion+ (`partnerAtCompanion`), the button toggles
              the InterlinearLayer mount per verse and persists via
              `useInterlinearToggle`. For below-Companion partners, the
              button still renders in the chrome strip (the gate is
              visible, not hidden, per the §20 stub-catalog "tier-
              locked-stub" convention) but tapping routes to /pricing
              and a small "Companion" chip distinguishes the locked
              state — chip uses gold-shadow `#645028` to match the
              locked register's deep stop.
            */}
            <button
              type="button"
              onClick={() => {
                if (partnerAtCompanion) {
                  toggleShowInterlinear();
                } else {
                  if (typeof window !== "undefined") {
                    window.location.href = "/pricing";
                  }
                }
              }}
              aria-pressed={partnerAtCompanion ? showInterlinear : false}
              title={
                partnerAtCompanion
                  ? "Show or hide the Hebrew/Greek interlinear layer above each English word — lemma, transliteration, morphology, gloss. Long-press the morphology cell to expand the abbreviation. Persists across chapters and reloads."
                  : "Hebrew/Greek interlinear layer — upgrade to the Companion tier to enable. Tap to view pricing."
              }
              className="relative rounded-md border border-[#FCECAF] bg-gradient-to-r from-[#645028] via-[#B4A078] to-[#645028] px-4 py-1.5 font-sans text-xs font-semibold uppercase tracking-wide text-[#FFF8E1] shadow-sm hover:opacity-90"
            >
              {partnerAtCompanion
                ? showInterlinear
                  ? "Hide Interlinear"
                  : "Show Interlinear"
                : "Interlinear"}
              {!partnerAtCompanion && (
                <span
                  className="ml-2 inline-flex items-center rounded-sm border border-[#FFF8E1]/40 bg-[#645028] px-1.5 py-0.5 text-[0.55rem] font-semibold uppercase tracking-wider text-[#FFF8E1]"
                  aria-label="Companion tier required"
                >
                  Companion
                </span>
              )}
            </button>
            {/*
              S169 — Study Aids toggle (hideCommentary under the hood).
              Upgraded from flat techelet `#1A6FE5` to the metallic-
              techelet register per Yoshi live-walk redline 1 (now
              formally defined in COLOR_PALETTE.md §3a — gradient
              `#0A2D84 → #1A6FE5 → #5A9CF5 → #A8C8F0 → ...` mirroring
              the §3 bracket-emerald 7-stop structure on the techelet
              hue family). The chrome strip now reads four metallic
              pills across the four locked theological registers:

                emerald (§144 English Helpers / expansion register)
                argaman (§27 Strong's / covenant-body register)
                gold    (§28 Interlinear / priestly-witness register)
                techelet(Study Aids / divine-name register)

              "Study Aids" covers the chapter-intro + commentary +
              cross-reference apparatus — the divine-name lexical
              witness register fits because the commentary surfaces
              the framework's reading of the divine name and the
              theological architecture the names anchor. State +
              persistence unchanged (toggleHideCommentary).
            */}
            <button
              type="button"
              onClick={toggleHideCommentary}
              aria-pressed={hideCommentary}
              title="Show or hide all study aids (chapter intro, commentary, cross-references). Persists across chapters and reloads."
              className="rounded-md border border-[#A8C8F0] bg-gradient-to-r from-[#0A2D84] via-[#1A6FE5] to-[#0A2D84] px-4 py-1.5 font-sans text-xs font-semibold uppercase tracking-wide text-[#E6F0FA] shadow-sm hover:opacity-90"
            >
              {hideCommentary ? "Show study aids" : "Hide study aids"}
            </button>
            {/*
              S205 — The Kingdom toggle (working title: Blue Pill).
              The TWO-TONE register: metallic emerald + metallic gold
              joined in one pill — the two sticks of Ezekiel 37:15-22
              made one in his hand ("uniting the old and new
              testament" — Yoshi). Hard seam, blend border. ON marks
              every member verse with the two-tone quote pair; tap to
              unfold the come-and-see card. FREE for every partner —
              the proclamation surface; no tier chip, ever. No dot
              glyph (Yoshi, S205 proof). S209: moved ABOVE the Witness
              (Yoshi) — the Witness sits last in the stack.

              S217 (Yoshi, "option a"): the Kingdom and Witness each own
              a w-full column group so each feature's style row sits
              DIRECTLY beneath its OWN pill. Before this, both style rows
              were full-width siblings below the shared pill strip, so the
              Kingdom options visually fell under the Witness pill. The
              w-full wrapper breaks each group onto its own line within
              the justify-end strip; items-end keeps pill + options right-
              aligned with the rest of the strip.
            */}
            <div className="flex w-full flex-col items-end gap-2">
              <button
                type="button"
                onClick={toggleKingdom}
                aria-pressed={kingdomOn}
                title="The Prophesied Kingdom Gospel — nothing in the new testament is new. Marks every teaching, act, and promise beside the scripture it was taught from. Tap a marked verse to see both sides quoted in full."
                className="chrome-metal chrome-metal-kingdom !px-4 !py-1.5 text-xs font-semibold uppercase tracking-wide"
              >
                <span className="flex flex-col items-center leading-tight">
                  <span>
                    {kingdomOn ? "Hide" : "Show"} the Prophesied Kingdom Gospel
                  </span>
                  <span className="mt-0.5 text-[0.6rem] font-normal normal-case tracking-normal opacity-85">
                    (nothing new in the new testament)
                  </span>
                </span>
              </button>
              {/*
                S214 — the Kingdom style row (Yoshi: "settings also of
                quotes or underline"). Visible while the Kingdom is ON.
                Default "underline" (S217 Yoshi). Persists at
                rop_kingdom_style_v1.
              */}
              {kingdomOn && (
                <div className="flex flex-wrap items-center justify-end gap-1.5 font-sans">
                  {(["quotes", "underline"] as const).map((s) => (
                    <button
                      key={s}
                      type="button"
                      className="kingdom-style-chip"
                      aria-pressed={kingdomStyle === s}
                      onClick={() => pickKingdomStyle(s)}
                    >
                      {KINGDOM_STYLE_LABELS[s]}
                    </button>
                  ))}
                </div>
              )}
            </div>
            {/*
              S204 — The Witness toggle (working title: Red Pill), the
              ninth metallic register (dedicated witness red — proof
              Option B, Yoshi sign-off). The inverted red-letter
              overlay: ON marks every member verse with the capsule;
              tap a capsule to unfold the come-and-see card. FREE for
              every partner — the proclamation surface; this pill never
              carries a tier chip. The label follows the Study Aids
              show/hide convention; the red capsule glyph anchors the
              card eyebrows + end-card rows as the Witness family mark
              (S204c — the ◉ glyph was dropped from the pill, Yoshi:
              "why does it even have the white circle?").
            */}
            <div className="flex w-full flex-col items-end gap-2">
              <button
                type="button"
                onClick={toggleWitness}
                aria-pressed={witnessOn}
                title="The Red-Pill Witness — marks every verse where the Messiah claims what the Tanakh gives to Yahuah alone. Tap a marked verse to see both sides quoted in full."
                className="chrome-metal chrome-metal-witness !px-4 !py-1.5 text-xs font-semibold uppercase tracking-wide"
              >
                {witnessOn
                  ? "Hide the Red-Pill Witness"
                  : "Show the Red-Pill Witness"}
              </button>
              {/*
                S204b — the Witness style row ("red pill options and then
                they choose" — Yoshi). Visible while the Witness is ON.
                Default "text" (the inverted red-letter: red used to mean
                "he speaks," now it means he claims the Name). Persists at
                rop_witness_style_v1.
              */}
              {witnessOn && (
                <div className="flex flex-wrap items-center justify-end gap-1.5 font-sans">
                  {(
                    ["text", "quotes", "highlight", "capsule"] as const
                  ).map((s) => (
                    <button
                      key={s}
                      type="button"
                      className="witness-style-chip"
                      aria-pressed={witnessStyle === s}
                      onClick={() => pickWitnessStyle(s)}
                    >
                      {WITNESS_STYLE_LABELS[s]}
                    </button>
                  ))}
                </div>
              )}
            </div>
              </div>
            )}
          </div>
          {/* S123 W4 — range-mode banner. Renders whenever the partner
              is in selecting mode (anchor pinned, waiting for end-verse
              tap). The captured state doesn't render this banner — the
              RangeActionPicker takes over the UI focus once a range is
              captured. Locked at DESIGN_LANGUAGE.md §21. */}
          {rangeState.status === "selecting" && (
            <div
              role="status"
              aria-live="polite"
              className="mb-3 flex items-center justify-between gap-3 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2"
            >
              <span className="text-base text-[var(--reader-text)]">
                <span className="text-[var(--reader-accent)]">Range mode</span>
                <span className="text-[var(--reader-muted)]">
                  {" "}— tap an end verse
                </span>
              </span>
              <button
                type="button"
                onClick={cancelRange}
                className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1 font-sans text-xs text-[var(--reader-text)] hover:bg-[var(--reader-bg)]"
                aria-label="Cancel range selection"
              >
                Cancel
              </button>
            </div>
          )}
          {/*
            S130 — chapter number recolored to bright bracket-emerald
            highlight #2EFFA1 per Yoshi's call: the "metallic green from
            the expander buttons." The earlier argaman didn't survive
            the thin font weight, and my first follow-up (icy silver-
            blue from the olive-leaf register) was the wrong green —
            cool blue with a green hint, not the actual metallic emerald
            Yoshi was pointing at. The bracket gradient's bright stop
            #2EFFA1 reads cleanly against the dark pane and matches the
            same green register the expander pills and Tanakh ref pills
            already use. Chapter-scope navigation pointer now uses §3
            expansion-register green; verse-scope stays in §2 spectral
            blue. Weight nudged to font-medium for legibility.
          */}
          {/* S172 — book heading rendered as a source-class metallic pill
              per COLOR_PALETTE.md §9 + S130's pill register. Tanakh →
              emerald, NT → gold, Extras → argaman. S172.9 — chapter
              number rendered as a miniature tabernacle veil
              (chap-veil-box in index.css): techelet interior + woven
              emerald→argaman→gold border + scarlet number. The five
              sacred-color registers compressed into one element,
              repeated as a visual confession in every chapter heading
              across canon + library. */}
          {/*
            S202 — aleph-bet section-break divider PULLED. On review the
            Grok-generated asset is NOT authentic paleo-Hebrew (invented /
            rune-like glyphs, an up-arrow, wrong forms and order). Wrong
            Hebrew on a study-Bible page is worse than no ornament, so the
            section break is removed until a letterform-accurate strip is
            built (rendered from a real Phoenician/paleo-Hebrew font, not an
            AI image gen). The botanical chapter→apparatus divider is
            unaffected.
          */}
          <h2 className="mb-1 text-xl font-semibold text-[var(--reader-text)] flex items-center gap-2 flex-wrap">
            <span className={bookPillClassName(chapterDetail.book.slug)}>
              {chapterDetail.book.title}
            </span>
            <span className="chap-veil-box">
              {chapterDetail.chapter.chapter_number}
            </span>
          </h2>
          {chapterDetail.chapter.chapter_title &&
            chapterDetail.chapter.chapter_title !==
              `Chapter ${chapterDetail.chapter.chapter_number}` && (
              <p className="mb-3 text-base italic text-[var(--reader-muted)]">
                {chapterDetail.chapter.chapter_title}
              </p>
            )}
          {/*
            Session 110 round-1 follow-up: render the chapter with proper
            pericope-style paragraph breaks. The break points come from
            paragraphStarts (extracted from KJV USFX XML). For each chapter,
            we group consecutive verses into <p> elements, opening a new
            paragraph whenever a verse number appears in the paragraph_starts
            list for that book + chapter.
          */}
          <div className="mt-4 leading-relaxed text-[1.05rem] text-[var(--reader-text)]">
            {(() => {
              // S232 — paragraph_starts.json is now keyed `edition::slug`
              // (so two same-slug books in different editions — e.g. the KJV
              // apocrypha `judith` and the Charles-vol1 `judith` — get their
              // own break maps and can't collide). Fall back to the bare
              // `slug` key for any book whose edition-qualified entry hasn't
              // been written yet (canon books stay bare-slug keyed).
              const editionKey = `${chapterDetail.book.edition_slug}::${chapterDetail.book.slug}`;
              const bookStarts =
                (paragraphStarts[editionKey] ??
                  paragraphStarts[chapterDetail.book.slug])?.[
                  String(chapterDetail.chapter.chapter_number)
                ] || [];
              const startsSet = new Set(bookStarts);
              const groups: Array<typeof chapterDetail.verses> = [];
              for (const v of chapterDetail.verses) {
                if (groups.length === 0 || startsSet.has(v.verse_number)) {
                  groups.push([v]);
                } else {
                  groups[groups.length - 1].push(v);
                }
              }
              return groups.map((verses, gIdx) => {
                // S204 — The Witness come-and-see card unfolds directly
                // under the paragraph that contains the tapped member
                // verse: both sides quoted in full, stand-alone italics,
                // the claim and its Tanakh anchor side by side. One card
                // open at a time; tapping the capsule again (or ✕) folds
                // it. The card respects the partner's parentheticals +
                // sacred-name display prefs like every reading surface.
                const expandedWitnessEntry =
                  witnessOn &&
                  expandedWitnessVerseId !== null &&
                  verses.some((vv) => vv.id === expandedWitnessVerseId)
                    ? witnessByVerse[expandedWitnessVerseId]
                    : undefined;
                // S205 — same unfold contract for the Kingdom card.
                const expandedKingdomEntry =
                  kingdomOn &&
                  expandedKingdomVerseId !== null &&
                  verses.some((vv) => vv.id === expandedKingdomVerseId)
                    ? kingdomByVerse[expandedKingdomVerseId]
                    : undefined;
                return (
                <Fragment key={`p-${gIdx}-${verses[0].id}`}>
                <p className="mb-3 indent-0">
                  {verses.map((v) => {
                    // S113 → S117 multi-mark — layer 0..3 marks on the
                    // verse via nested spans. Each mark wraps the inner
                    // content with its own mark-{style} class + per-color
                    // CSS variables. Multi-underline stacking: for each
                    // underline mark, compute text-underline-offset based
                    // on its index among the underline marks (2px, 7px,
                    // 12px) so multiple colored underlines render as
                    // distinct stacked lines instead of overlapping.
                    const marks = highlightsByVerse[v.id] || [];
                    // S121 W3 — align verse text against the chapter
                    // verse_words so individual Strong's-tagged words
                    // render as tappable spans. Falls back to a single
                    // plain segment if the words for this verse
                    // haven't arrived yet (progressive enrichment).
                    const verseWords = wordsByVerse[v.id] || [];
                    const segments: Segment[] =
                      verseWords.length > 0
                        ? alignVerse(v.text, verseWords, String(v.id))
                        : [{ kind: "plain", text: v.text }];
                    // S124 W5 — bookmark glyph after the verse number
                    // for any verse with a bookmark on it. Per §22, the
                    // glyph renders in §5 spectral-blue accent at 0.85
                    // opacity, OR in the bookmark's color_tint when set
                    // (partner's color vocabulary surfaces inline). Not
                    // a tap target — partner accesses the bookmark
                    // sheet via the standard long-press → menu →
                    // Bookmark path so we avoid the S121 W3 word-
                    // tappable interaction-conflict surface.
                    const bookmark = bookmarksByVerse[v.id];
                    const bookmarkGlyphColor: string | undefined =
                      bookmark?.color_tint
                        ? HIGHLIGHT_HEX[bookmark.color_tint]
                        : undefined;
                    // S204/S204b — The Witness treatment on member
                    // verses while the toggle is ON, in the partner's
                    // chosen style (red text / red quotes / highlight
                    // wash / capsule). Tapping the verse (or the
                    // capsule / quote marks) unfolds the come-and-see
                    // card under this paragraph; tap again folds it.
                    const witnessEntry = witnessOn
                      ? witnessByVerse[v.id]
                      : undefined;
                    const toggleWitnessCard = () => {
                      setExpandedWitnessVerseId(
                        expandedWitnessVerseId === v.id ? null : v.id
                      );
                    };
                    // S205 — The Kingdom mark on member verses while
                    // the toggle is ON: the two-tone quote pair
                    // (emerald outside, gold inside) at both ends of
                    // the verse. Tapping the glyphs (or the verse,
                    // when it carries no Witness card) unfolds the
                    // Kingdom come-and-see card under this paragraph.
                    const kingdomEntry = kingdomOn
                      ? kingdomByVerse[v.id]
                      : undefined;
                    const toggleKingdomCard = () => {
                      setExpandedKingdomVerseId(
                        expandedKingdomVerseId === v.id ? null : v.id
                      );
                    };
                    let content: React.ReactNode = (
                      <>
                        <sup className="verse-number mr-1">
                          {v.verse_number}
                        </sup>
                        {witnessEntry && witnessStyle === "capsule" && (
                          <button
                            type="button"
                            className="pill-mark-witness"
                            aria-label={`The Witness: ${witnessEntry.card_title}. Tap to unfold.`}
                            aria-expanded={
                              expandedWitnessVerseId === v.id
                            }
                            title={witnessEntry.card_title}
                            onClick={(e) => {
                              e.stopPropagation();
                              toggleWitnessCard();
                            }}
                          />
                        )}
                        {witnessEntry && witnessStyle === "quotes" && (
                          <span
                            className="witness-quote"
                            aria-hidden="true"
                            title={witnessEntry.card_title}
                            onClick={(e) => {
                              e.stopPropagation();
                              toggleWitnessCard();
                            }}
                          >
                            {"“"}
                          </span>
                        )}
                        {kingdomEntry && kingdomStyle === "quotes" && (
                          <span
                            role="button"
                            aria-label={`The Kingdom: ${kingdomEntry.card_title}. Tap to unfold.`}
                            aria-expanded={
                              expandedKingdomVerseId === v.id
                            }
                            title={kingdomEntry.card_title}
                            onClick={(e) => {
                              e.stopPropagation();
                              toggleKingdomCard();
                            }}
                          >
                            <span className="kingdom-quote kingdom-quote-tanakh">
                              {"‘"}
                            </span>
                            <span className="kingdom-quote kingdom-quote-nt">
                              {"‘"}
                            </span>
                          </span>
                        )}
                        {bookmark && (
                          <span
                            className="verse-bookmark-glyph"
                            aria-label="Verse bookmarked"
                            title={
                              bookmark.short_description ?? "Bookmarked"
                            }
                            style={
                              bookmarkGlyphColor
                                ? { color: bookmarkGlyphColor }
                                : undefined
                            }
                          >
                            {"⚑"}
                          </span>
                        )}
                        {segments.map((seg, segIdx) => {
                          // S121 W3 — every segment ends with a trailing
                          // space so adjacent-segment renders preserve
                          // the original verse text's word spacing. The
                          // tokenizer dropped whitespace; the renderer
                          // rebuilds it. Without this, two tappable
                          // segments side-by-side (compound clusters
                          // like "Yahuah Elohim") render as "YahuahElohim",
                          // and tappable-then-plain ("Elohim" + "(God)")
                          // renders as "Elohim(God)". The trailing-space
                          // pattern matches the existing pattern for
                          // plain segments and reconstructs the source
                          // spacing accurately.
                          if (seg.kind === "plain") {
                            // S144 — apply the parentheticals-strip toggle
                            // ONLY to plain segments. Tappable Strong's-
                            // tagged segments carry the restored Hebrew
                            // word (e.g., "Yahuah", "Elohim") with no
                            // parenthetical; the parens live in the
                            // adjacent plain segment (e.g., " (LORD)",
                            // " (God)"). Stripping plain-only preserves
                            // the tappable boundaries and Strong's
                            // linkage while removing the English
                            // parentheticals when the reader has opted
                            // in. When the toggle is OFF, applyParensStrip
                            // returns the input unchanged (no-op).
                            return (
                              <span key={`p-${segIdx}`}>
                                {applyTextPrefs(seg.text)}{" "}
                              </span>
                            );
                          }
                          // tappable
                          const word = {
                            strong: seg.strong,
                            surface: seg.surface,
                          };
                          // S168 — §28 interlinear column-stack swap.
                          // When the partner has the §28 toggle ON AND
                          // is at Companion+, render this tappable
                          // segment as a column-stack (lemma + translit
                          // + morph + gloss above the surface word).
                          // The verse-align key encodes the position
                          // as `${verseId}:${position}` — parse it to
                          // find the matching VerseWord in the S168-
                          // extended payload.
                          if (showInterlinear && partnerAtCompanion) {
                            const posStr = seg.key.split(":").pop();
                            const pos = posStr ? Number.parseInt(posStr, 10) : NaN;
                            const matched = Number.isFinite(pos)
                              ? verseWords.find((vw) => vw.position === pos)
                              : undefined;
                            if (
                              matched &&
                              (matched.lemma ||
                                matched.transliteration ||
                                matched.morphology)
                            ) {
                              return (
                                <InterlinearWordColumn
                                  key={seg.key}
                                  verseWord={matched}
                                  verseId={v.id}
                                  showStrongsSuperscripts={showStrongsSuperscripts}
                                  // S172 — apply sacred-name mask to the
                                  // column-stack's bottom English surface row
                                  // before render. Parens-strip intentionally
                                  // NOT applied here (the segment is a single
                                  // word, no English parens). Caught at S172
                                  // live-walk: Genesis 2:4 was rendering
                                  // "Yahuah" in interlinear mode despite the
                                  // mask being set to "yhwh".
                                  surfaceOverride={applySacredMask(seg.text)}
                                  handlers={{
                                    onWordTap: handleWordQuickTap,
                                    onWordPointerDown: handlePointerDown,
                                    onWordPointerCancel: handlePointerCancel,
                                    onWordContextMenu: handleContextMenu,
                                  }}
                                />
                              );
                            }
                            // Fall through to inline-tappable render
                            // when the verseWord didn't match or the
                            // S168 payload fields are empty for this
                            // word (defensive — the surface still
                            // renders cleanly without the column).
                          }
                          return (
                            <span key={seg.key}>
                              <span
                                className="word-tappable"
                                onPointerDown={(e) => {
                                  e.stopPropagation();
                                  handlePointerDown(v.id, word);
                                }}
                                onPointerUp={(e) => {
                                  e.stopPropagation();
                                  handlePointerCancel();
                                }}
                                onPointerCancel={(e) => {
                                  e.stopPropagation();
                                  handlePointerCancel();
                                }}
                                onPointerLeave={handlePointerCancel}
                                onContextMenu={(e) => {
                                  e.stopPropagation();
                                  handleContextMenu(v.id, e, word);
                                }}
                                onClick={(e) => {
                                  e.stopPropagation();
                                  handleWordQuickTap(word, v.id);
                                }}
                              >
                                {seg.text}
                              </span>
                              {/*
                                S160 — §27 always-visible Strong's superscript.
                                Renders only when the chrome-strip toggle is
                                ON. The sup's own onClick fires the same
                                handleWordQuickTap that the word-tappable does,
                                so tapping the H#### / G#### opens the same
                                StrongsLookup modal a word-tap opens.
                                Bracket-emerald midtone color per COLOR_PALETTE
                                §3 (the expansion register, in its small-text
                                solid form) — distinct from the spectral-blue
                                §2 verse-number superscript register so the
                                partner reads two superscript layers on the
                                line without confusion.
                              */}
                              {showStrongsSuperscripts && seg.strong && (
                                <sup
                                  className="strongs-superscript"
                                  onClick={(e) => {
                                    e.stopPropagation();
                                    handleWordQuickTap(word, v.id);
                                  }}
                                  aria-label={`Strong's ${seg.strong} — open lexicon entry`}
                                  title={`Strong's ${seg.strong} — tap to open the lexicon entry`}
                                >
                                  {seg.strong}
                                </sup>
                              )}
                              {" "}
                            </span>
                          );
                        })}
                        {witnessEntry && witnessStyle === "quotes" && (
                          <span
                            className="witness-quote"
                            aria-hidden="true"
                            title={witnessEntry.card_title}
                            onClick={(e) => {
                              e.stopPropagation();
                              toggleWitnessCard();
                            }}
                          >
                            {"” "}
                          </span>
                        )}
                        {kingdomEntry && kingdomStyle === "quotes" && (
                          <span
                            role="button"
                            aria-label={`The Kingdom: ${kingdomEntry.card_title}. Tap to unfold.`}
                            aria-expanded={
                              expandedKingdomVerseId === v.id
                            }
                            title={kingdomEntry.card_title}
                            onClick={(e) => {
                              e.stopPropagation();
                              toggleKingdomCard();
                            }}
                          >
                            <span className="kingdom-quote kingdom-quote-nt">
                              {"’"}
                            </span>
                            <span className="kingdom-quote kingdom-quote-tanakh">
                              {"’ "}
                            </span>
                          </span>
                        )}
                      </>
                    );
                    // S204b — red-text / highlight-wash treatments wrap
                    // the whole verse content (same wrapping point the
                    // partner highlight marks use, so the verse number
                    // and glyphs behave identically across both
                    // systems). Both open the card on tap via the
                    // outer verse span's click handler.
                    if (witnessEntry && witnessStyle === "text") {
                      content = (
                        <span
                          className="witness-verse-text"
                          title={witnessEntry.card_title}
                        >
                          {content}
                        </span>
                      );
                    } else if (
                      witnessEntry &&
                      witnessStyle === "highlight"
                    ) {
                      content = (
                        <span
                          className="witness-verse-fill"
                          title={witnessEntry.card_title}
                        >
                          {content}
                        </span>
                      );
                    }
                    // S214 — Kingdom "underline" treatment: the two-tone
                    // emerald→gold register drawn as a gradient underline
                    // beneath the member verse (the alternative to the
                    // bracketing two-tone quote glyphs). Opens the Kingdom
                    // card on a plain verse tap, same as the witness
                    // text/highlight treatments.
                    if (kingdomEntry && kingdomStyle === "underline") {
                      content = (
                        <span
                          className="kingdom-verse-underline"
                          title={kingdomEntry.card_title}
                        >
                          {content}
                        </span>
                      );
                    }
                    let underlineIdx = 0;
                    for (const mark of marks) {
                      const inlineStyle: React.CSSProperties = {
                        ...markCssVarsFor(mark.color),
                      };
                      if (mark.style === "underline") {
                        // 2, 7, 12 — readable stack to 3 levels per the
                        // S117 cap.
                        inlineStyle.textUnderlineOffset = `${
                          2 + underlineIdx * 5
                        }px`;
                        underlineIdx++;
                      }
                      content = (
                        <span
                          className={markClassFor(mark.style)}
                          style={inlineStyle}
                        >
                          {content}
                        </span>
                      );
                    }
                    // S123 W4 — range-mode visual + interaction state for
                    // this verse. Anchor = the start verse of an
                    // in-progress or captured range. inCapturedRange =
                    // any verse in [start, end] of a captured range
                    // (rendered with the tint until the action picker
                    // commits or cancels).
                    const isRangeAnchor =
                      (rangeState.status === "selecting" ||
                        rangeState.status === "captured") &&
                      rangeState.start?.verseId === v.id;
                    const inCapturedRange =
                      rangeState.status === "captured" &&
                      rangeState.start !== null &&
                      rangeState.end !== null &&
                      rangeIsSameChapter(rangeState) &&
                      v.verse_number >= rangeState.start.verseNumber &&
                      v.verse_number <= rangeState.end.verseNumber;
                    const rangeClass =
                      isRangeAnchor && rangeState.status === "selecting"
                        ? " range-anchor"
                        : inCapturedRange
                          ? " range-captured"
                          : "";
                    // S157 — TTS currently-spoken verse visual treatment
                    // per DESIGN_LANGUAGE.md §25 (matches §21 range-
                    // anchor register: left-border 2px in spectral-blue
                    // + 8% alpha tint).
                    const ttsClass =
                      playingVerseId === v.id ? " tts-spoken" : "";
                    return (
                      <span
                        key={v.id}
                        data-verse-number={v.verse_number}
                        data-verse-id={v.id}
                        className={`verse-interactive${rangeClass}${ttsClass}`}
                        onPointerDown={() => handlePointerDown(v.id)}
                        onPointerUp={handlePointerCancel}
                        onPointerCancel={handlePointerCancel}
                        onPointerLeave={handlePointerCancel}
                        onContextMenu={(e) => handleContextMenu(v.id, e)}
                        onClick={(e) => {
                          // Suppress click event if long-press already fired
                          // (so opening the menu doesn't also count as a
                          // verse-text tap if we wire that in later).
                          if (longPressFiredRef.current) {
                            e.preventDefault();
                            longPressFiredRef.current = false;
                            return;
                          }
                          // S123 W4 — in range-selecting mode, any verse
                          // click is the end-verse commit. The
                          // word-tappable spans' own onClick handles the
                          // word-level case via handleWordQuickTap's
                          // selecting-mode branch; this is the
                          // plain-text-between-words case (and the
                          // fallback when verse_words haven't arrived).
                          if (rangeState.status === "selecting") {
                            commitEndVerse(v.id);
                            return;
                          }
                          // S204b — a plain tap on a Witness member
                          // verse unfolds/folds its come-and-see card
                          // (word taps stopPropagation first, so
                          // Strong's lookups still win on words).
                          // S205 — when a verse carries only a Kingdom
                          // mark, a plain tap unfolds the Kingdom card;
                          // when it carries both, the Witness keeps the
                          // plain tap and the Kingdom opens from its
                          // quote glyphs (which stopPropagation).
                          if (witnessEntry) {
                            toggleWitnessCard();
                          } else if (kingdomEntry) {
                            toggleKingdomCard();
                          }
                        }}
                      >
                        {content}
                      </span>
                    );
                  })}
                </p>
                {expandedWitnessEntry && (
                  <WitnessCard
                    entry={expandedWitnessEntry}
                    register="witness"
                    hideParentheticals={hideParentheticals}
                    sacredNameMask={sacredNameMask}
                    onClose={() => setExpandedWitnessVerseId(null)}
                  />
                )}
                {expandedKingdomEntry && (
                  <KingdomCard
                    entry={expandedKingdomEntry}
                    hideParentheticals={hideParentheticals}
                    sacredNameMask={sacredNameMask}
                    onClose={() => setExpandedKingdomVerseId(null)}
                  />
                )}
                </Fragment>
                );
              });
            })()}
          </div>

          {/*
            S202 — botanical "end of scripture" divider. Moved here (Yoshi)
            to sit directly after the chapter verses and BEFORE the study-
            tools toggle strip, so it marks the close of scripture and stays
            visible even when study aids / helpers / notes are hidden. Not
            gated by hideCommentary — it's a permanent scripture-end seam.
            Hidden in light mode until the parchment variant ships
            (.reader-divider in index.css).
          */}
          <ReaderDivider variant="botanical" />

          {/*
            S202 — the tiered Basic / Deeper-Dive commentary stack
            (ChapterCommentary) is no longer rendered. Per Yoshi: "take away
            all the deeper dives and just have the commentary." The reader now
            shows only the single free Commentary (chapter_intro).
            S217 ordering (Yoshi): below the floral break the chapter-end stack
            reads pills → Kingdom end card → Witness end card → cross-reference
            end card → Commentary. Commentary renders LAST, after the cross-
            references. The ChapterCommentary component + its
            matt-N-short.md / matt-N.md sources are left in the tree (data
            untouched) so the tiered stack can be restored if wanted again.
          */}

          {/*
            S229 — the study-aid + layer toggle strip that used to render
            HERE (directly below the botanical break) was moved to the slim
            collapsible "Display options" bar pinned at the TOP of the
            reading column (see the .study-bar block just inside <article>).
            The chapter-end cards (Kingdom / Witness / commentary /
            cross-references) still render below, gated by the same toggles.
          */}

          {/*
            S205 — the Kingdom chapter-end card: every pairing in this
            chapter listed cross-reference style (marked verse ↔ its
            source scriptures), each opening the full come-and-see card
            inline. Rides the Kingdom toggle, NOT hideCommentary — the
            proclamation stands when study aids fold.
            S214 (Yoshi): sits directly under the pills, above the Witness
            card, the commentary, and the cross-reference card.
          */}
          {kingdomOn && (
            <KingdomEndCard
              entries={Object.values(kingdomByVerse).sort(
                (a, b) => a.verse_number - b.verse_number
              )}
              hideParentheticals={hideParentheticals}
              sacredNameMask={sacredNameMask}
            />
          )}

          {/*
            S204b — the Witness chapter-end card: every pairing in this
            chapter listed cross-reference style (marked verse ↔ Tanakh
            anchors), each opening the full come-and-see card inline.
            Rides the Witness toggle (its own surface, not gated by
            hideCommentary — the proclamation stands even when the
            study aids are folded away).
          */}
          {witnessOn && (
            <WitnessEndCard
              entries={Object.values(witnessByVerse).sort(
                (a, b) => a.verse_number - b.verse_number
              )}
              hideParentheticals={hideParentheticals}
              sacredNameMask={sacredNameMask}
            />
          )}

          {/*
            Session 74 — chapter-end cross-reference card. Renders the
            per-verse curated cross-references plus the framework-
            diagnostic threads per api/CHAPTER_END_CARD_CONTRACT.md.
            Every row is curated and framework-bearing; the TSK
            comprehensive-baseline direction rolled back at S75. The
            card hides itself silently when both lists come back empty.
            S130: also gated by the App-level scripture-only toggle.
            S217 (Yoshi): the chapter-end stack renders Kingdom → Witness
            → cross-references → commentary. Cross-references sit ABOVE the
            commentary; the commentary is the LAST block before the nav.
          */}
          {!hideCommentary && (
            <ChapterEndCard
              bookSlug={chapterDetail.book.slug}
              chapterNumber={chapterDetail.chapter.chapter_number}
              userTier={me?.tier ?? "free"}
              onNavigate={jumpToVerseRef}
              hideParentheticals={hideParentheticals}
              sacredNameMask={sacredNameMask}
            />
          )}

          {!hideCommentary && chapterDetail.chapter_intro && (
            <aside className="mt-4 text-[var(--reader-text)]">
              {/*
                S202 — the Commentary body now renders at FULL white
                (var(--reader-text)), not muted. Per Yoshi's no-greyed-out-
                whites rule: content stays fully readable, and the botanical
                divider above (the chapter→apparatus seam) does the work of
                differentiating commentary from scripture — not a lowered
                text color. Header recolored techelet #1A6FE5 → spectral
                blue (var(--reader-accent)); techelet is divine-names-only
                (S127 §3 lock), chrome headers carry the apparatus accent.
                S217 (Yoshi): commentary renders LAST — below the cross-
                reference card — as the final block before the nav arrows.
              */}
              <h3 className="mb-2 font-sans font-semibold uppercase tracking-wide text-xs text-[var(--reader-accent)]">
                Commentary
              </h3>
              {/*
                Session 110 Round-1 italic-fix: render chapter_intro through
                the shared markdown helper so `*italic*` spans render as
                <em> and `\n\n` paragraph breaks produce real <p> elements.
                Sacred names are already restored with parentheticals at
                the seed-data layer and render as plain inline text.
              */}
              <div className="space-y-0">
                {/*
                  S144 — apply the parentheticals-strip toggle to the
                  chapter_intro (free-tier commentary) before passing to
                  renderMarkdownBody. When the toggle is OFF the function
                  is a no-op; when ON it removes the English-form
                  parentheticals after restored Sacred Names per
                  lib/stripParentheticals.ts.
                */}
                {renderMarkdownBody(
                  applyTextPrefs(chapterDetail.chapter_intro)
                )}
              </div>
            </aside>
          )}

          {/*
            S121 — bottom-of-chapter continuation row (W2). Duplicate
            prev/next pair after the cross-reference card, before the
            footer, as the natural reading-flow continuation. Larger
            affordance than the chrome arrows; shows the destination
            chapter's label as a preview when known. The reader who
            finishes a chapter does not have to scroll back up to the
            picker. Per DESIGN_LANGUAGE.md §19.
          */}
          <nav
            aria-label="Chapter navigation"
            className="mt-10 flex items-stretch justify-between gap-3 border-t border-[var(--reader-rule)] pt-6 font-sans"
          >
            <button
              type="button"
              onClick={navigatePrev}
              aria-label="Previous chapter"
              aria-disabled={prevTarget === null}
              disabled={prevTarget === null}
              className={`flex flex-1 items-center justify-start gap-3 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3 text-left text-base text-[var(--reader-text)] hover:opacity-90 disabled:opacity-30 disabled:cursor-not-allowed ${
                bouncePrev ? "nav-bounce" : ""
              }`}
            >
              <span
                aria-hidden="true"
                className="text-lg font-semibold text-[var(--reader-accent)]"
              >
                ←
              </span>
              <span className="flex flex-col">
                <span className="text-xs uppercase tracking-wide text-[var(--reader-muted)]">
                  Previous
                </span>
                <span className="font-medium">
                  {prevTarget
                    ? targetLabel(books, prevTarget)
                    : "—"}
                </span>
              </span>
            </button>
            <button
              type="button"
              onClick={navigateNext}
              aria-label="Next chapter"
              aria-disabled={nextTarget === null}
              disabled={nextTarget === null}
              className={`flex flex-1 items-center justify-end gap-3 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3 text-right text-base text-[var(--reader-text)] hover:opacity-90 disabled:opacity-30 disabled:cursor-not-allowed ${
                bounceNext ? "nav-bounce" : ""
              }`}
            >
              <span className="flex flex-col">
                <span className="text-xs uppercase tracking-wide text-[var(--reader-muted)]">
                  Next
                </span>
                <span className="font-medium">
                  {nextTarget
                    ? targetLabel(books, nextTarget)
                    : "—"}
                </span>
              </span>
              <span
                aria-hidden="true"
                className="text-lg font-semibold text-[var(--reader-accent)]"
              >
                →
              </span>
            </button>
          </nav>
        </article>
      )}

      {/*
        S121 W3 — modal stack. Long-press / right-click opens the
        VerseActionMenu first; menu items route to HighlightPicker
        (S113) or StrongsLookup (S121). Quick-tap on a tappable word
        bypasses the menu and opens StrongsLookup directly.
      */}
      {menuState !== null && chapterDetail && (
        <VerseActionMenu
          scopeLabel={menuState.word ? menuState.word.surface : "Verse actions"}
          sections={buildMenuSections(
            menuState,
            chapterDetail.verses.find(
              (v) => v.id === menuState.verseId
            ) ?? null,
            chapterDetail.book.title,
            chapterDetail.book.slug,
            chapterDetail.chapter.chapter_number,
            // S122 — partner tier drives stub state. Tier-locked stubs
            // render as Coming soon (not locked) for partners already at
            // or above the required tier; /pricing routes only fire for
            // partners who genuinely need to upgrade.
            me?.tier ?? null,
            {
              onStrongs: (w) => setStrongsState(w),
              onLexicon: (w) => {
                // S164 — §26 menu-direct path. Language inferred from the
                // Strong's-number prefix; BDB serves Hebrew + Aramaic, LSJ
                // serves Greek. (Aramaic is folded into the Hebrew branch
                // here because BDB's Aramaic block is sourced under the
                // 'bdb' enum just like the Hebrew block.)
                setLexiconState({
                  strong: w.strong,
                  language: w.strong.startsWith("G") ? "greek" : "hebrew",
                });
              },
              onHighlight: (vid) => setPickerVerseId(vid),
              onStartRange: (vid) => startRangeFromVerse(vid),
              onBookmark: (vid) => openBookmarkSheet(vid),
              onAddNote: (vid) => openNotesPanelWithAnchor(vid),
              onPlayFromHere: (vid) => startPlaybackFromVerseId(vid),
              // S172.12 — Remove highlight wiring. hasHighlights is
              // computed from highlightsByVerse for the menu's targeted
              // verse; onRemoveHighlights walks every mark on the verse
              // and deletes them in parallel, then drops them from
              // local state.
              hasHighlights:
                (highlightsByVerse[menuState.verseId] ?? []).length > 0,
              onRemoveHighlights: async (vid) => {
                const marks = highlightsByVerse[vid] ?? [];
                if (marks.length === 0) return;
                setMenuState(null);
                try {
                  await Promise.all(marks.map((m) => deleteHighlight(m.id)));
                } catch {
                  // Non-fatal — the next chapter load will reconcile.
                }
                setHighlightsByVerse((prev) => {
                  const next = { ...prev };
                  delete next[vid];
                  return next;
                });
              },
              // S197 — public-domain tool surfaces. Each closes the menu and
              // mounts the corresponding sheet (Companion-gated server-side).
              onVincents: (ref) => {
                setMenuState(null);
                setVincentsState(ref);
              },
              onNikkudot: (ref) => {
                setMenuState(null);
                setNikkudotState(ref);
              },
              onTreasury: (ref) => {
                setMenuState(null);
                setTskState(ref);
              },
              onNaves: (initialQuery) => {
                setMenuState(null);
                setNavesState({ initialQuery });
              },
              onMaps: () => {
                setMenuState(null);
                setMapsOpen(true);
              },
              onCompare: (ref) => {
                setMenuState(null);
                setCompareState(ref);
              },
            },
            // S172 — text-transform passed in so the §24 share/copy
            // path inside buildMenuSections can apply the partner's
            // sacred-name mask before paint. Pure function, no React.
            applySacredMask
          )}
          onClose={() => setMenuState(null)}
        />
      )}

      {strongsState !== null && (
        <StrongsLookup
          strongNumber={strongsState.strong}
          surface={strongsState.surface}
          onNavigate={(bookSlug, chapterNumber, verseNumber) => {
            // S121 W3 iteration — concordance tap-to-navigate.
            // Mirrors the S121 W2 nav handlers' state-reset
            // contract: set book/chapter together and reset
            // currentVerse so the S116 save effect doesn't briefly
            // persist the previous chapter's last-visible verse
            // against the new (book, chapter) pair. The target
            // verseNumber is set as currentVerse so a refresh
            // resumes at the right place; the post-load scroll
            // effect lands the partner on the verse via the
            // initialScrollVerse path (set when target > 1).
            setSelectedBookSlug(bookSlug);
            setSelectedChapter(chapterNumber);
            setCurrentVerse(verseNumber);
            if (verseNumber > 1) {
              setInitialScrollVerse(verseNumber);
            }
          }}
          onOpenVerseMenu={
            strongsState.verseId != null
              ? () => {
                  const vid = strongsState.verseId!;
                  setStrongsState(null);
                  // word:null → verse scope (Highlight / Note / Copy /
                  // Share); the Word-study section drops out since the
                  // partner is already looking at the Strong's entry.
                  setMenuState({ verseId: vid, word: null });
                }
              : undefined
          }
          onClose={() => setStrongsState(null)}
        />
      )}

      {/*
        S164 — §26 menu-direct LexiconSheet mount. Opens when the
        VerseActionMenu BDB / LSJ Word-study items fire (Companion+
        only; below-Companion partners see the tier-locked badge and
        tap routes to /pricing). LexiconSheet is z-60 so it stacks
        above any open StrongsLookup; closing returns the partner to
        whatever was beneath.
      */}
      {lexiconState !== null && (
        <LexiconSheet
          strongNumber={lexiconState.strong}
          language={lexiconState.language}
          onClose={() => setLexiconState(null)}
        />
      )}

      {/* S197 — public-domain tool surfaces. All z-60, Companion-gated
          server-side, each rendering its untouched PD base + the framework
          correction band (ToolAnnotationBand). */}
      {vincentsState !== null && (
        <VincentsSheet
          bookSlug={vincentsState.bookSlug}
          chapter={vincentsState.chapter}
          verse={vincentsState.verse}
          verseLabel={vincentsState.verseLabel}
          onClose={() => setVincentsState(null)}
        />
      )}
      {nikkudotState !== null && (
        <NikkudotSheet
          bookSlug={nikkudotState.bookSlug}
          chapter={nikkudotState.chapter}
          verse={nikkudotState.verse}
          verseLabel={nikkudotState.verseLabel}
          onClose={() => setNikkudotState(null)}
        />
      )}
      {tskState !== null && (
        <TskSheet
          bookSlug={tskState.bookSlug}
          chapter={tskState.chapter}
          verse={tskState.verse}
          verseLabel={tskState.verseLabel}
          onClose={() => setTskState(null)}
        />
      )}
      {navesState !== null && (
        <NavesSheet
          initialQuery={navesState.initialQuery}
          onClose={() => setNavesState(null)}
        />
      )}
      {mapsOpen && <MapsSheet onClose={() => setMapsOpen(false)} />}
      {compareState !== null && chapterDetail && (
        <CompareSheet
          bookSlug={compareState.bookSlug}
          bookTitle={compareState.bookTitle}
          chapter={compareState.chapter}
          verse={compareState.verse}
          verseLabel={compareState.verseLabel}
          readerVerses={chapterDetail.verses.map((v) => ({
            verse_number: v.verse_number,
            text: v.text,
          }))}
          applySacredMask={applySacredMask}
          onClose={() => setCompareState(null)}
        />
      )}

      {/*
        S123 W4 — RangeActionPicker opens automatically when the
        range-selection mechanic captures a range (rangeState transitions
        to "captured" via commitEndVerse). Three actions in the picker:
        Highlight range (Live this wheel) + Copy/Share with watermark
        (Coming-soon, W7). Any close path (Cancel, ✕, backdrop, Escape)
        exits range mode entirely per §21 "close = cancel" model.
      */}
      {rangePickerOpen &&
        rangeState.status === "captured" &&
        chapterDetail &&
        rangeIsSameChapter(rangeState) && (
          <RangeActionPicker
            rangeRef={`${chapterDetail.book.title} ${chapterDetail.chapter.chapter_number}:${rangeState.start!.verseNumber}${
              rangeState.start!.verseNumber !== rangeState.end!.verseNumber
                ? `–${rangeState.end!.verseNumber}`
                : ""
            }`}
            rangeSize={sameChapterRangeSize(rangeState)}
            onHighlight={() => {
              const ids = resolveSameChapterRange(
                rangeState,
                chapterDetail.verses
              );
              if (ids.length === 0) return;
              setPickerRangeVerseIds(ids);
              setRangePickerOpen(false);
              // Leave rangeState as captured for the duration of the
              // multi-target HighlightPicker session; cleared when the
              // picker closes (see HighlightPicker invocation below).
            }}
            onCopyRange={() => {
              // S127 W7 — Copy-range-with-watermark Live.
              const ids = resolveSameChapterRange(
                rangeState,
                chapterDetail.verses
              );
              if (ids.length === 0) return;
              const verses = buildVerseRenderList(ids, chapterDetail.verses, applySacredMask);
              if (verses.length === 0) return;
              const meta = buildSameChapterRangeMeta(
                chapterDetail.book.title,
                chapterDetail.book.slug,
                chapterDetail.chapter.chapter_number,
                rangeState.start!.verseNumber,
                rangeState.end!.verseNumber
              );
              setRangePickerOpen(false);
              cancelRange();
              void executeCopy({ verses, meta });
            }}
            onShareRange={() => {
              // S127 W7 — Share-range-with-watermark Live.
              const ids = resolveSameChapterRange(
                rangeState,
                chapterDetail.verses
              );
              if (ids.length === 0) return;
              const verses = buildVerseRenderList(ids, chapterDetail.verses, applySacredMask);
              if (verses.length === 0) return;
              const meta = buildSameChapterRangeMeta(
                chapterDetail.book.title,
                chapterDetail.book.slug,
                chapterDetail.chapter.chapter_number,
                rangeState.start!.verseNumber,
                rangeState.end!.verseNumber
              );
              setRangePickerOpen(false);
              cancelRange();
              void executeShare({ verses, meta });
            }}
            onClose={cancelRange}
          />
        )}

      {/*
        S123 W4 — multi-target HighlightPicker invocation. Distinct from
        the single-verse pickerVerseId branch below so the two modes
        stay cleanly separable (single-verse keeps the S117 chips +
        cap UX unchanged; multi-target uses the new mode HighlightPicker
        rendering). targetVerseIds is what flips the picker into
        multi-target mode.
      */}
      {pickerRangeVerseIds !== null && pickerRangeVerseIds.length > 0 && (
        <HighlightPicker
          verseId={pickerRangeVerseIds[0]}
          current={[]}
          userTier={(me?.tier ?? "free") as ContentTier}
          targetVerseIds={pickerRangeVerseIds}
          onSaved={(h) =>
            // Each successful per-verse commit calls back here once.
            // Reuse the S117 multi-mark reducer: append + dedup-on-tuple.
            setHighlightsByVerse((prev) => {
              const existing = prev[h.verse_id] ?? [];
              const filtered = existing.filter(
                (m) => !(m.color === h.color && m.style === h.style)
              );
              return { ...prev, [h.verse_id]: [...filtered, h] };
            })
          }
          // onDeleted is unused in multi-target mode (chips row hidden)
          // but the prop is required by the component.
          onDeleted={() => {}}
          onClose={() => {
            setPickerRangeVerseIds(null);
            // Exit range mode fully on picker close (success or cancel).
            cancelRange();
          }}
        />
      )}

      {pickerVerseId !== null && (
        <HighlightPicker
          verseId={pickerVerseId}
          current={highlightsByVerse[pickerVerseId] ?? []}
          userTier={(me?.tier ?? "free") as ContentTier}
          onSaved={(h) =>
            // S117 multi-mark — append the new mark, dedup'ing on the
            // (color, style) tuple in case the API returned an existing
            // row for an exact-duplicate insert (insert-or-no-op
            // semantics).
            setHighlightsByVerse((prev) => {
              const existing = prev[h.verse_id] ?? [];
              const filtered = existing.filter(
                (m) => !(m.color === h.color && m.style === h.style)
              );
              return { ...prev, [h.verse_id]: [...filtered, h] };
            })
          }
          onDeleted={(highlightId) =>
            // S117 multi-mark — delete by mark id (not by verse id).
            // Filter the mark out of every verse's array; drop the
            // verse key when the resulting array is empty so the map
            // stays clean.
            setHighlightsByVerse((prev) => {
              const next: Record<number, Highlight[]> = {};
              for (const [verseIdStr, marks] of Object.entries(prev)) {
                const filtered = marks.filter((m) => m.id !== highlightId);
                if (filtered.length > 0) {
                  next[Number(verseIdStr)] = filtered;
                }
              }
              return next;
            })
          }
          onClose={() => setPickerVerseId(null)}
        />
      )}

      {/*
        S124 W5 — BookmarkSheet. Opens when bookmarkSheetVerseId is
        set (long-press → menu → Bookmark). Pre-fills from
        bookmarksByVerse if a bookmark already exists on the target
        verse (edit-mode); otherwise renders empty (create-mode).
        Suggested tags pool aggregated from every bookmark across the
        partner's full chapter set (deduplicated, sorted by recency).
      */}
      {bookmarkSheetVerseId !== null && chapterDetail && (() => {
        const targetVerse = chapterDetail.verses.find(
          (vv) => vv.id === bookmarkSheetVerseId
        );
        if (!targetVerse) return null;
        const verseRef = `${chapterDetail.book.title} ${chapterDetail.chapter.chapter_number}:${targetVerse.verse_number}`;
        // Suggested tags pool — every distinct tag from every bookmark
        // on every verse currently in bookmarksByVerse. Free V1 only
        // has per-chapter bookmarks loaded; a future cross-chapter
        // pool would need a separate /v1/bookmarks/tags endpoint.
        const suggestedTags = Array.from(
          new Set(
            Object.values(bookmarksByVerse).flatMap(
              (bm) => bm.tags ?? []
            )
          )
        );
        return (
          <BookmarkSheet
            verseId={bookmarkSheetVerseId}
            verseRef={verseRef}
            versePreview={targetVerse.text}
            current={bookmarksByVerse[bookmarkSheetVerseId] ?? null}
            suggestedTags={suggestedTags}
            onSaved={handleBookmarkSaved}
            onDeleted={handleBookmarkDeleted}
            onClose={() => setBookmarkSheetVerseId(null)}
          />
        );
      })()}

      {/*
        S124 W5 — NotesPanel. Opens via either the verse-scope Add-note
        menu path (sets pendingNoteAnchor with the verseRef) or the
        chrome Notes button (pendingNoteAnchor null = free-form mode).
      */}
      {notesOpen && (
        <NotesPanel
          notes={notes}
          pendingAnchor={pendingNoteAnchor}
          onSaved={handleNoteSaved}
          onClose={closeNotesPanel}
        />
      )}

      {/*
        S166 — §29 BookmarksIndex. Opens via the chrome Bookmarks button.
        Component owns its own fetch + cache; App provides the navigate
        callback (jumpToVerseRef) and the close callback. Tapping a row
        closes the sheet AND jumps to the verse — chapter loads if not
        currently active, scrolls to the verse, inline-glyph renders.
      */}
      {bookmarksIndexOpen && (
        <BookmarksIndex
          onNavigate={jumpToVerseRef}
          onClose={() => setBookmarksIndexOpen(false)}
        />
      )}

      {/*
        S203 — Session C "My Study" home. Full-screen overlay holding
        the partner's whole apparatus (notes + bookmarks + highlights):
        client-side search incl. the highlight-color filter, collections
        (flat tags, folder-feel), Highlights tab color sections with
        fill/underline/outline sub-groups, Markdown + PDF export.
        Component owns its fetch; tier signal rides note_cap in the
        index payload (null = paid).
      */}
      {myStudyOpen && (
        <MyStudy
          books={books}
          onNavigate={jumpToVerseRef}
          onClose={() => setMyStudyOpen(false)}
        />
      )}

      {/*
        S125 W6 — SearchModal per DESIGN_LANGUAGE.md §23. Pop-up search
        from chrome (button click or Cmd-K/Ctrl-K). Tap-on-result jumps
        to verse via jumpToSearchResult (sets the W2 nav state-reset
        contract + initialScrollVerse for S116 post-load scroll). Tap
        on a tier-locked row's upgrade card routes to /pricing.
      */}
      {searchOpen && (
        <SearchModal
          partnerTier={me?.tier ?? null}
          onSelectResult={jumpToSearchResult}
          onUpgradeFromLockedRow={upgradeFromLockedSearchRow}
          onClose={closeSearchModal}
        />
      )}

      {/*
        S157 — AudioPlayer per DESIGN_LANGUAGE.md §25. Bottom-pinned
        slide-up bar; not a modal (z-30 sits above content, below the
        modal stack at z-40+). Opens via chrome ▶ button or the §20
        "Play from here" menu item. Reuses §19 navigateNext for
        chapter-boundary auto-advance per the §25 continuous-play
        contract. Free at all tiers per §9 + S141 launch-scope revision.
      */}
      {audioPlayerOpen && chapterDetail && (
        <AudioPlayer
          playing={playingVerseId !== null}
          currentVerseRef={
            playingVerseId !== null
              ? (() => {
                  const v = chapterDetail.verses.find(
                    (vv) => vv.id === playingVerseId,
                  );
                  return v
                    ? `${chapterDetail.book.title} ${chapterDetail.chapter.chapter_number}:${v.verse_number}`
                    : null;
                })()
              : null
          }
          voices={voices}
          prefs={ttsPrefs}
          onPlayPause={handlePlayPause}
          onPrev={
            chapterDetail.verses.length > 0 &&
            playingVerseId !== null &&
            chapterDetail.verses.findIndex((v) => v.id === playingVerseId) > 0
              ? handleSkipPrevVerse
              : null
          }
          onNext={
            chapterDetail.verses.length > 0 && playingVerseId !== null
              ? handleSkipNextVerse
              : null
          }
          onPrefsChange={handlePrefsChange}
          onPreviewVoice={handlePreviewVoice}
          onClose={handleAudioPlayerClose}
        />
      )}

      <footer className="mt-12 border-t border-[var(--reader-rule)] pt-4 font-sans text-xs text-[var(--reader-muted)]">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <a
            href="https://remnantofpromise.org"
            className="font-medium text-[var(--reader-muted)] underline-offset-2 hover:underline hover:text-[var(--reader-text)]"
          >
            ← Back to Remnant of Promise
          </a>
          <span>
            Live from{" "}
            <code className="rounded bg-[var(--reader-surface)] px-1 py-0.5">
              api.bible.remnantofpromise.org/v1
            </code>
          </span>
        </div>
      </footer>
    </div>
  );
}

/**
 * S121 W3 — build the section-grouped menu for VerseActionMenu.
 * S122 — full stub catalog. Every future-wheel item renders today as
 * a dimmed stub (tier-locked or coming-soon) so partners see the full
 * tool catalog up front. See DESIGN_LANGUAGE.md §20 for the locked
 * stub catalog + the three render states.
 *
 * Five locked categories per DESIGN_LANGUAGE.md §20:
 *
 *   - Word study (word scope) — Strong's (live); BDB / LSJ /
 *     Vincent's Word Studies / interlinear / nikkudot stubs
 *     (Wheels 9-11; Library). [S195: Vincent's replaced copyrighted Vine's]
 *   - Marking (verse scope) — Highlight (live); Bookmark stub (W5)
 *   - Notes (verse scope) — Add note stub (W5, Free); Open notes
 *     for this verse stub (W5, Notes)
 *   - Cross-references (verse scope) — Nave's / Related passages stubs
 *     (Wheels 9, 12; Library)
 *   - Reference tools (verse scope) — Treasury (TSK) stub, standalone
 *     opt-in annotated foil (S195 re-scope off the cross-ref surface)
 *   - Share (verse scope) — Copy verse (live); Share-with-watermark
 *     + Multi-verse range stubs (W6, Free)
 *
 * Word-study stubs are language-conditional: BDB + Nikkudot fire on
 * H#### words only, Thayer's fires on G#### words only. The other
 * stubs are scope-conditional only.
 *
 * Partner-tier-aware: a tier-locked stub renders as Coming soon (not
 * locked) when the partner is already at or above the required tier.
 * The /pricing route is reserved for partners who genuinely need to
 * upgrade to use the eventual feature.
 *
 * Copy uses navigator.clipboard.writeText directly with the verse
 * text + reference, bypassing DOM selection entirely. This avoids the
 * fight with the S113 long-press picker AND the whitespace-artifact
 * problem of selecting-across-spans inside the W3 word-tappable
 * structure.
 */
function partnerAtOrAboveTier(
  partnerTier: PartnerTier | null,
  required: "notes" | "library"
): boolean {
  if (!partnerTier || partnerTier === "free") return false;
  if (required === "notes") {
    // Any paid tier qualifies for Notes-tier features.
    return (
      partnerTier === "study_notes" ||
      partnerTier === "extras" ||
      partnerTier === "complete_study" ||
      partnerTier === "everything"
    );
  }
  // Library tier — study_notes is below.
  return (
    partnerTier === "extras" ||
    partnerTier === "complete_study" ||
    partnerTier === "everything"
  );
}

function makeTierStub(
  key: string,
  label: string,
  tier: "notes" | "library",
  partnerTier: PartnerTier | null
): MenuItem {
  if (partnerAtOrAboveTier(partnerTier, tier)) {
    // Partner already qualifies; render as Coming soon (no /pricing route).
    return { key, label, comingSoon: true, onSelect: () => {} };
  }
  return {
    key,
    label,
    lockedTier: tier,
    onSelect: () => {
      // Browser-native navigation per App.tsx routing model (see line
      // 119 comment) — no react-router import needed.
      if (typeof window !== "undefined") {
        window.location.href = "/pricing";
      }
    },
  };
}

/**
 * S127 W7 — build the VerseRender[] list for a captured same-chapter
 * range. Maps the resolver's ordered verse-id list back to verse
 * number + text from chapterDetail.verses. Returns [] if any id can't
 * be matched (defensive — should never happen given the resolver
 * walks the same chapterVerses array).
 */
function buildVerseRenderList(
  verseIds: number[],
  chapterVerses: { id: number; verse_number: number; text: string }[],
  // S172 — sacred-name mask. Applied to each verse text before it
  // reaches the share/copy pipeline so the exported PNG / clipboard
  // text honors the partner's preference. Default is identity for
  // backwards-compat with any non-share consumer.
  textTransform: (text: string) => string = (t) => t
): VerseRender[] {
  const byId = new Map(chapterVerses.map((v) => [v.id, v]));
  const out: VerseRender[] = [];
  for (const id of verseIds) {
    const v = byId.get(id);
    if (!v) return [];
    out.push({ verseNumber: v.verse_number, text: textTransform(v.text) });
  }
  return out;
}

/**
 * S127 W7 — build the RangeMeta discriminator for a captured same-
 * chapter range. Range-of-one (start === end) collapses to kind="single"
 * so the range-header / filename use the cleaner single-verse format
 * (e.g., "Psalm 23:1" not "Psalm 23:1–1"). Cross-chapter / cross-book
 * are W7+ deferred and handled by the range-selection helper's
 * resolver when it lands; this builder produces same-chapter or single
 * only, matching the W4 UX scope.
 */
function buildSameChapterRangeMeta(
  bookTitle: string,
  bookSlug: string,
  chapterNumber: number,
  startVerseNumber: number,
  endVerseNumber: number
): RangeMeta {
  if (startVerseNumber === endVerseNumber) {
    return {
      kind: "single",
      bookTitle,
      bookSlug,
      chapter: chapterNumber,
      verse: startVerseNumber,
    };
  }
  return {
    kind: "same-chapter",
    bookTitle,
    bookSlug,
    chapter: chapterNumber,
    startVerse: startVerseNumber,
    endVerse: endVerseNumber,
  };
}

function buildMenuSections(
  state: {
    verseId: number;
    word: { strong: string; surface: string } | null;
  },
  verse: { id: number; verse_number: number; text: string } | null,
  bookTitle: string,
  bookSlug: string,
  chapterNumber: number,
  partnerTier: PartnerTier | null,
  handlers: {
    onStrongs: (w: { strong: string; surface: string }) => void;
    /** S164 — §26 menu-direct lexicon path. Wired by BDB / LSJ items
     *  in the Word-study section. Below-Companion partners never reach
     *  this handler — the items render as tier-locked stubs that route
     *  to /pricing instead. */
    onLexicon: (w: { strong: string; surface: string }) => void;
    onHighlight: (verseId: number) => void;
    /** S123 W4 — "Start range here" in the new Range section. Anchors the
     *  long-pressed verse as the range start and enters selecting mode. */
    onStartRange: (verseId: number) => void;
    /** S124 W5 — "Bookmark" in the Marking section. Opens BookmarkSheet
     *  for the targeted verse in create-mode or edit-mode based on
     *  whether a bookmark already exists on the verse. */
    onBookmark: (verseId: number) => void;
    /** S124 W5 — "Add note" in the Notes section. Opens NotesPanel with
     *  the targeted verse pinned as the pending anchor; Save commits a
     *  new entry row with verse_id set. */
    onAddNote: (verseId: number) => void;
    /** S157 — "Play from here" in the new Listen section. Starts TTS
     *  playback from the targeted verse; AudioPlayer opens automatically. */
    onPlayFromHere: (verseId: number) => void;
    /** S172.12 — whether the targeted verse currently has any
     *  highlight marks. Drives the conditional "Remove highlight" item. */
    hasHighlights?: boolean;
    /** S172.12 — "Remove highlight" handler. Deletes ALL marks on the
     *  verse in one call. Selective removal of a single mark stays in
     *  the HighlightPicker chip-× path. */
    onRemoveHighlights?: (verseId: number) => void;
    /** S197 — Vincent's Word Studies verse panel (§26). */
    onVincents?: (ref: {
      bookSlug: string;
      chapter: number;
      verse: number;
      verseLabel: string;
    }) => void;
    /** S197 — Nikkudot pointed-Hebrew sibling view (§20, Hebrew only). */
    onNikkudot?: (ref: {
      bookSlug: string;
      chapter: number;
      verse: number;
      verseLabel: string;
    }) => void;
    /** S197 — Treasury (TSK) standalone reference tool. */
    onTreasury?: (ref: {
      bookSlug: string;
      chapter: number;
      verse: number;
      verseLabel: string;
    }) => void;
    /** S197 — Nave's topical foil. Optional initial query. */
    onNaves?: (initialQuery?: string) => void;
    /** S197 — Maps own-tile dispersion/gathering surface (standalone). */
    onMaps?: () => void;
    /** S224 — "Compare to another version" lens for the long-pressed verse. */
    onCompare?: (ref: {
      bookSlug: string;
      bookTitle: string;
      chapter: number;
      verse: number;
      verseLabel: string;
    }) => void;
  },
  /** S172 — sacred-name mask transform. Applied to verse text before
   *  the §24 share/copy pipeline paints. Pure function; no React. */
  applySacredMask: (text: string) => string = (t) => t
): MenuSection[] {
  // S197 — function-level Companion gate (the word-scope `isAtCompanion` below
  // is computed inside the `if (state.word)` block; the verse-scope reference
  // tools need the same check in their own scope).
  const isCompanionTier =
    partnerTier === "complete_study" || partnerTier === "everything";

  // ── Word study (word scope only) ─────────────────────────────────
  const wordStudy: MenuItem[] = [];
  if (state.word) {
    const isHebrew = state.word.strong.startsWith("H");
    const isGreek = state.word.strong.startsWith("G");

    wordStudy.push({
      key: "strongs",
      label: "Strong's lookup",
      icon: isGreek ? "G" : "H",
      hint: state.word.strong,
      onSelect: () => handlers.onStrongs(state.word!),
    });
    // S164 — §26 BDB / LSJ menu items. Locked label per §26 S47 relock:
    // "Library" → "Companion" (the lockedTier Literal stays "library" for
    // now since the broader system-wide rename is out of scope here;
    // partner-perceived badge text remains "Library" until that rename
    // sweeps; the API gate is the source of truth either way).
    //
    // Tier check: Companion = complete_study or higher (matches the
    // server-side gate at GET /v1/lexicon/{strong}). Extras-tier and
    // below see the tier-locked stub routing to /pricing; Companion+
    // see a live menu item that opens LexiconSheet directly via the
    // onLexicon handler.
    const isAtCompanion =
      partnerTier === "complete_study" || partnerTier === "everything";
    if (isHebrew) {
      if (isAtCompanion) {
        wordStudy.push({
          key: "bdb",
          label: "BDB",
          hint: state.word.strong,
          onSelect: () => handlers.onLexicon(state.word!),
        });
      } else {
        wordStudy.push(makeTierStub("bdb", "BDB", "library", partnerTier));
      }
    }
    if (isGreek) {
      // §26 S159 rename: Thayer's → LSJ (the actual V1 Greek source per
      // the LSJ-swap decision logged in §26).
      if (isAtCompanion) {
        wordStudy.push({
          key: "lsj",
          label: "LSJ",
          hint: state.word.strong,
          onSelect: () => handlers.onLexicon(state.word!),
        });
      } else {
        wordStudy.push(makeTierStub("lsj", "LSJ", "library", partnerTier));
      }
    }
    // S195 — Vine's dropped (URAA-restored, copyrighted to ~2035; the
    // earlier §26 "Vine's deprecation" note had it right) and replaced by
    // the genuinely-PD Vincent's *Word Studies in the New Testament*
    // (Marvin R. Vincent, 1886–1900, d. 1922). Same annotated-foil
    // treatment as BDB / LSJ. Left unconditional for now (Vincent's is
    // NT-scoped; integration may gate it on isGreek alongside LSJ).
    // S197 — Vincent's comes off "coming soon": Companion+ partners get a live
    // verse panel (data loads AND surface renders); below-Companion partners
    // still see the tier-locked stub routing to /pricing. Verse-scoped, so it
    // only goes live when the verse object resolved.
    if (isAtCompanion && verse && handlers.onVincents) {
      const v = verse;
      wordStudy.push({
        key: "vincents",
        label: "Vincent's Word Studies",
        onSelect: () =>
          handlers.onVincents!({
            bookSlug,
            chapter: chapterNumber,
            verse: v.verse_number,
            verseLabel: `${bookTitle} ${chapterNumber}:${v.verse_number}`,
          }),
      });
    } else {
      wordStudy.push(
        makeTierStub("vincents", "Vincent's Word Studies", "library", partnerTier)
      );
    }
    // S168 — §20 *Hebrew/Greek interlinear* stub REMOVED per the §28
    // deprecation lock (DESIGN_LANGUAGE.md §28 "§20 menu-stub
    // deprecation locked A"). The chrome-strip Interlinear toggle now
    // covers the whole-verse layered view; a per-word stub here would
    // duplicate without adding partner value (the partner who wants
    // to drill into one word already has Strong's → LexiconSheet via
    // §20 / §26). Same pattern S159 / S164 set for Vine's deprecation.
    if (isHebrew) {
      // S197 — Nikkudot comes off "coming soon" for Companion+ on a resolved
      // verse: the pointed-Hebrew sibling view + the Name-pointing note.
      if (isAtCompanion && verse && handlers.onNikkudot) {
        const v = verse;
        wordStudy.push({
          key: "nikkudot",
          label: "Nikkudot siblings",
          onSelect: () =>
            handlers.onNikkudot!({
              bookSlug,
              chapter: chapterNumber,
              verse: v.verse_number,
              verseLabel: `${bookTitle} ${chapterNumber}:${v.verse_number}`,
            }),
        });
      } else {
        wordStudy.push(
          makeTierStub("nikkudot", "Nikkudot siblings", "library", partnerTier)
        );
      }
    }
  }

  // ── Marking (verse scope) ────────────────────────────────────────
  const marking: MenuItem[] = [];
  marking.push({
    key: "highlight",
    label: state.word ? "Highlight verse" : "Highlight",
    icon: "✎",
    onSelect: () => handlers.onHighlight(state.verseId),
  });
  // S172.12 — discoverable one-tap unhighlight. Only shown when the
  // verse actually has marks. Deletes ALL marks on the verse in one
  // call; selective removal of a single mark (when the verse has
  // multiple) remains available via the × chips in the HighlightPicker.
  // Caught at S172.11 close — Yoshi: "we don't have a way to
  // unhighlight a verse, I just tried" — the chip-× path inside the
  // re-opened picker was the only delete affordance and wasn't
  // discoverable enough.
  if (handlers.hasHighlights && handlers.onRemoveHighlights) {
    marking.push({
      key: "remove-highlight",
      label: "Remove highlight",
      icon: "✕",
      onSelect: () => handlers.onRemoveHighlights!(state.verseId),
    });
  }
  // S124 W5 — Bookmark promoted from Coming-soon to Live (Free).
  marking.push({
    key: "bookmark",
    label: "Bookmark",
    icon: "⚑",
    onSelect: () => handlers.onBookmark(state.verseId),
  });

  // ── Notes (verse scope) ──────────────────────────────────────────
  const notes: MenuItem[] = [];
  // S124 W5 — Add note promoted from Coming-soon to Live (Free).
  notes.push({
    key: "add-note",
    label: "Add note",
    icon: "✏",
    onSelect: () => handlers.onAddNote(state.verseId),
  });
  // Open notes for this verse stays Tier-locked at the Study Notes tier.
  // Per-verse hub is W8, not W5 (drift on the §20 catalog table
  // attribution was fixed in the same edit that promoted the W5 Live
  // items — fifth drift-caught-while-editing-the-doc instance per
  // the forward standard).
  notes.push({
    ...makeTierStub(
      "open-notes-for-verse",
      "Open notes for this verse",
      "notes",
      partnerTier
    ),
    icon: "☰",
  });

  // ── Cross-references (verse scope) ───────────────────────────────
  // S195 re-scope (APP_BUILDOUT_ROADMAP "annotated foil, never the default
  // surface" policy): Treasury (TSK) moved OUT of this Cross-references group
  // into the standalone Reference tools section below. The chapter-end card
  // (ChapterEndCard) stays curated-threads-only; TSK never returns to a
  // cross-reference *surface*. It ships as a late, opt-in, click-to-open
  // standalone reference (same annotated-foil treatment as BDB / LSJ /
  // Vine's), flagged for a pre-launch framework distortion-class sweep.
  // Nave's topical stays here for now (a topical index is genuinely
  // cross-reference in kind); its own re-scope call is deferred.
  const crossRefs: MenuItem[] = [];
  // S197 — Nave's comes off "coming soon" for Companion+: a search/browse foil
  // with the framework correction on the four load-bearing headings. Seeded with
  // a salient word from the tapped surface (if any) so it opens on content.
  if (isCompanionTier && handlers.onNaves) {
    const seedQuery = state.word?.surface;
    crossRefs.push({
      key: "naves",
      label: "Nave's topical",
      onSelect: () => handlers.onNaves!(seedQuery),
    });
  } else {
    crossRefs.push(makeTierStub("naves", "Nave's topical", "library", partnerTier));
  }
  crossRefs.push(
    makeTierStub("related-passages", "Related passages", "library", partnerTier)
  );

  // ── Reference tools (verse scope — standalone opt-in annotated foils) ──
  // S195 — standalone, late-integration, opt-in reference set kept visibly
  // subordinate to the curated threads. TSK lands here, off the cross-ref
  // surface, per the unifying "annotated foil, never the default surface"
  // policy (DESIGN_LANGUAGE.md §20). Requires a pre-launch distortion sweep
  // (grace/law, Jew/Gentile, church-as-Israel, Torah-as-curse pairings)
  // before it comes off stub.
  const referenceTools: MenuItem[] = [];
  // S197 — Treasury (TSK) comes off "coming soon" for Companion+ on a resolved
  // verse: the standalone, opt-in chain foil with the four distortion-class
  // notes (gate passed S196). Subordinate by design — the curated threads are
  // the page.
  if (isCompanionTier && verse && handlers.onTreasury) {
    const v = verse;
    referenceTools.push({
      key: "treasury",
      label: "Treasury (TSK)",
      onSelect: () =>
        handlers.onTreasury!({
          bookSlug,
          chapter: chapterNumber,
          verse: v.verse_number,
          verseLabel: `${bookTitle} ${chapterNumber}:${v.verse_number}`,
        }),
    });
  } else {
    referenceTools.push(
      makeTierStub("treasury", "Treasury (TSK)", "library", partnerTier)
    );
  }
  // S199 Maps surface REBUILT and back live for Companion+. The S197 version was
  // pulled (2026-06-04) for two failures: (1) a bare point-cloud on a blank canvas,
  // not a legible map; (2) far worse, the overlay confined the scattering to the
  // Assyrian/Babylonian ANE exiles and the gathering to a return to the old land —
  // erasing the WORLDWIDE dispersion the prophets name (Deut 28:64; Amos 9:9 sifted
  // among ALL nations; Isaiah 11:11-12 the four corners + islands of the sea;
  // Jeremiah 31:8-10 the coasts/ends of the earth) and the gathering of the
  // scattered seed from every nation — the living remnant (Texas included) written
  // out of the promise, the exact lie the framework exists to dismantle. The S199
  // rebuild draws on a real public-domain WORLD map (Natural Earth, PD; our own
  // SVG) with the scattering fanning out to every continent and the gathering home
  // from the four corners + far isles, visibly reaching the Americas — and the
  // maps/dispersion-overlay framework band rewritten to the worldwide reading
  // (session199_maps_overlay_rewrite.sql, prophets quoted in full). Maps is
  // verse-independent (standalone), so no `verse` gate — Companion tier + handler.
  if (isCompanionTier && handlers.onMaps) {
    referenceTools.push({
      key: "maps",
      label: "Maps (dispersion & gathering)",
      onSelect: () => handlers.onMaps!(),
    });
  } else {
    referenceTools.push(
      makeTierStub("maps", "Maps (dispersion & gathering)", "library", partnerTier)
    );
  }

  // ── Compare (verse scope, added S224) ────────────────────────────
  // "Compare to another version" — opens the comparison lens (nine public-
  // domain translations incl. Brenton's LXX) beside the reader's text for
  // this verse or this chapter. Companion-gated like the other library tool
  // surfaces; verse-scoped, so it only goes live on a resolved verse.
  // Below-Companion partners see the tier-locked stub routing to /pricing.
  const compare: MenuItem[] = [];
  if (isCompanionTier && verse && handlers.onCompare) {
    const v = verse;
    compare.push({
      key: "compare-versions",
      label: "Compare to another version",
      icon: "⇄",
      onSelect: () =>
        handlers.onCompare!({
          bookSlug,
          bookTitle,
          chapter: chapterNumber,
          verse: v.verse_number,
          verseLabel: `${bookTitle} ${chapterNumber}:${v.verse_number}`,
        }),
    });
  } else {
    compare.push(
      makeTierStub(
        "compare-versions",
        "Compare to another version",
        "library",
        partnerTier,
      ),
    );
  }

  // ── Share (verse scope) ──────────────────────────────────────────
  // Copy verse writes clean verse text (+ reference + attribution) to
  // the clipboard via executeCopy (text-only — S173 back-edit reverted
  // the S127 canvas-PNG/share-sheet routing that broke plain copy on
  // the native shells). Share with watermark renders the canvas PNG and
  // routes through the share pipeline (native @capacitor/share →
  // navigator.share → <a download>). Both are owned by the lib; App.tsx
  // only assembles the VerseRender[] + RangeMeta inputs.
  const share: MenuItem[] = [];
  if (verse) {
    const singleVerseMeta: RangeMeta = {
      kind: "single",
      bookTitle,
      bookSlug,
      chapter: chapterNumber,
      verse: verse.verse_number,
    };
    // S172 — apply sacred-name mask to the verse text BEFORE the
    // share-card pipeline paints it on canvas. Same partner-pref
    // honored across in-app display + every share export. Parens
    // strip intentionally NOT applied here — the share-card spec
    // (§24) carries the source-echo "(LORD)" so receiving partners
    // see the framework's restored-name treatment unless they're
    // the YHWH-mode partner whose mask we honor.
    const singleVerseVerses: VerseRender[] = [
      { verseNumber: verse.verse_number, text: applySacredMask(verse.text) },
    ];
    share.push({
      key: "copy",
      label: "Copy verse",
      icon: "⧉",
      hint: `${bookTitle} ${chapterNumber}:${verse.verse_number}`,
      onSelect: () => {
        // Fire-and-forget — transport pipeline handles every failure
        // mode (share-sheet abort, clipboard.write rejected, etc.) and
        // returns a TransportResult. We don't block the UI on it; the
        // menu has already closed by the time the pipeline runs.
        void executeCopy({
          verses: singleVerseVerses,
          meta: singleVerseMeta,
        });
      },
    });
    share.push({
      key: "share-watermark",
      label: "Share with watermark",
      icon: "↗",
      onSelect: () => {
        void executeShare({
          verses: singleVerseVerses,
          meta: singleVerseMeta,
        });
      },
    });
  }

  // ── Range (verse scope, added S123 — Wheel 4 of the pre-launch sweep) ─
  // One shared menu entry for the range-selection mechanic per
  // DESIGN_LANGUAGE.md §21. Replaces the S122-locked Share-section
  // "Multi-verse range" Coming-soon stub — its placeholder role is
  // fulfilled by the actual Range section + post-capture action picker.
  // Live + Free tier this wheel because multi-verse highlight is free
  // per §9; future W7 Copy + Share-with-watermark land as additional
  // Live items in the RangeActionPicker, not as new top-level menu items.
  const range: MenuItem[] = [];
  range.push({
    key: "start-range",
    label: "Start range here",
    icon: "↔",
    onSelect: () => handlers.onStartRange(state.verseId),
  });

  // ── Listen (verse scope, added S157 — Phase 9.4 launch-blocker) ──────
  // New section housing the §25 native-OS TTS audio narration entry
  // point. "Play from here" starts the AudioPlayer at the long-pressed
  // verse, queues the rest of the chapter, auto-advances at chapter
  // boundary per §25. Free at all tiers per §9 + S141 launch-scope
  // revision — audio narration is the accessibility surface. Future
  // Scribe-tier "Listen in Yoshi's voice" item (S141 Tier B item 12)
  // lands in the same section when the ElevenLabs PVC wheel ships.
  const listen: MenuItem[] = [];
  listen.push({
    key: "play-from-here",
    label: "Play from here",
    icon: "▶",
    onSelect: () => handlers.onPlayFromHere(state.verseId),
  });

  return [
    { title: "Listen", items: listen },
    { title: "Word study", items: wordStudy },
    { title: "Marking", items: marking },
    { title: "Notes", items: notes },
    { title: "Cross-references", items: crossRefs },
    { title: "Reference tools", items: referenceTools },
    { title: "Compare", items: compare },
    { title: "Share", items: share },
    { title: "Range", items: range },
  ];
}

function prettyCategory(cat: string): string {
  switch (cat) {
    case "canon":
      return "Canon (Protestant 66)";
    case "apocrypha":
      return "Apocrypha";
    case "pseudepigrapha":
      return "Pseudepigrapha";
    case "apostolic_fathers":
      return "Apostolic Fathers";
    case "apocryphal_gospels":
      return "Apocryphal Gospels";
    case "historical_witness":
      return "Historical Witness";
    case "disputed_witness":
      return "Disputed";
    default:
      return cat;
  }
}
