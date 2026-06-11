/**
 * Typed client for the Remnant of Promise Bible API.
 *
 * Production API: https://api.bible.remnantofpromise.org/v1/...
 *   (Session 40 lock — moved off bible.remnantofpromise.org so the PWA
 *   can claim the bare subdomain. The api. subdomain serves the FastAPI
 *   service; the bare subdomain serves the static PWA.)
 *
 * Override at build time with VITE_API_BASE — Render Static Site sets
 * this in the build env per hosting/render.yaml; localhost dev can set
 * it in app/.env.local to point at a local FastAPI uvicorn instance.
 *
 * SSO (Session 36 + Session 40): the cross-subdomain cookie at
 * Domain=.remnantofpromise.org is visible to both
 * bible.remnantofpromise.org (the PWA) and api.bible.remnantofpromise.org
 * (the API), so the existing rop_jwt cookie flow keeps working across
 * the subdomain split. When present, the JWT is also attached as
 * Authorization: Bearer on every API call. The API still allows
 * credentials via CORS, and includes the PWA origin in CORS_ORIGINS.
 * Anonymous callers — no cookie, no header — see the 66-book free canon.
 *
 * S176 — native auth path. The Capacitor native shell loads from
 * https://localhost, which can't see the .remnantofpromise.org cookie.
 * The native shell stores its JWT in Capacitor Preferences via
 * lib/native-auth.ts after the system-browser sign-in flow lands the
 * token through the /auth-callback deep link. readAccessToken() below
 * checks the in-memory native-token cache FIRST, then falls back to
 * the document.cookie path used by the PWA. Both code paths end at the
 * same Authorization: Bearer attach — the API treats them identically
 * (api/auth.py reads either the cookie or the header). credentials:
 * "include" stays in every call because the cookie path on the PWA
 * still relies on it (the native shell's fetch ignores the credentials
 * flag — no cookie to send anyway).
 */

import { getCachedNativeToken } from "./native-auth";

const API_BASE: string =
  import.meta.env.VITE_API_BASE ?? "https://api.bible.remnantofpromise.org/v1";

const SSO_COOKIE_NAME = "rop_jwt";

/**
 * Read the JWT from the `rop_jwt` cookie if present.
 *
 * Returns null when the cookie is not set, when document is undefined
 * (SSR safety), or when the cookie value is empty. The fetch helper
 * still sends the cookie via credentials: 'include' regardless — this
 * function is the JS-side path that attaches a Bearer header for
 * direct-API debug + future mobile-client parity.
 */
function readJwtCookie(): string | null {
  if (typeof document === "undefined") return null;
  const prefix = `${SSO_COOKIE_NAME}=`;
  const parts = document.cookie ? document.cookie.split("; ") : [];
  for (const part of parts) {
    if (part.startsWith(prefix)) {
      const value = part.slice(prefix.length);
      return value ? decodeURIComponent(value) : null;
    }
  }
  return null;
}

/**
 * Resolve the access token from whichever source has one — the
 * native-shell Preferences cache OR the PWA cookie. Native cache wins
 * when both are present (which won't happen in practice — native
 * shells don't see the cookie, PWA shells don't run the
 * Preferences-loader effect — but the precedence keeps the contract
 * explicit). Returns null when neither path has a token; callers send
 * the request anonymously and the API returns the 66-book free canon.
 */
function readAccessToken(): string | null {
  const native = getCachedNativeToken();
  if (native) return native;
  return readJwtCookie();
}

// ----- Response shapes (mirror api/models.py) ----------------------------

export type WitnessCategory =
  | "canon"
  | "apocrypha"
  | "pseudepigrapha"
  | "apostolic_fathers"
  | "apocryphal_gospels"
  | "historical_witness"
  | "disputed_witness";

export type ContentTier =
  | "free"
  | "study_notes"
  | "extras"
  | "complete_study"
  | "everything";

export interface BookSummary {
  id: number;
  slug: string;
  title: string;
  short_title: string | null;
  canonical_order: number;
  witness_category: WitnessCategory;
  tier_required: ContentTier;
  abstract: string | null;
  // S232 — the owning edition's slug. The API has always returned this
  // (api/models.py BookSummary.edition_slug); the field was simply absent
  // from this interface. It is now load-bearing: the reader keys
  // paragraph_starts.json by `edition::slug` (so two same-slug books in
  // different editions can't collide), and the book-picker suppresses the
  // duplicate apocrypha edition by edition_slug.
  edition_slug: string;
}

export interface BookDetail extends BookSummary {
  chapter_count: number;
}

export interface ChapterSummary {
  id: number;
  chapter_number: number;
  chapter_title: string | null;
  verse_count: number;
}

export interface BookChaptersResponse {
  book: BookSummary;
  chapters: ChapterSummary[];
}

export interface Verse {
  id: number;
  verse_number: number;
  text: string;
}

export interface ChapterDetail {
  book: BookSummary;
  chapter: ChapterSummary;
  chapter_intro: string | null;
  verses: Verse[];
}

export interface HealthResponse {
  status: "ok" | "degraded";
  schema_version: string | null;
  db_reachable: boolean;
  checked_at: string;
}

// ----- Chapter-end cross-reference card (Session 74) ---------------------
//
// Mirrors api/models.py ChapterEndCardResponse. The endpoint returns
// the per-verse cross-reference list (one block per chapter verse that
// has at least one curated target) plus the framework-diagnostic
// threads (each thread that has at least one member whose source verse
// falls in the rendered chapter). Every cross_references row is a
// curated framework-bearing call — the Session 75 rollback closed the
// TSK comprehensive-baseline direction, so the apparatus grows by
// curated threads on Yoshi's design call, not by corpus ingestion. The
// PWA hides the card entirely when both lists come back empty (the
// expected state for any chapter the apparatus hasn't reached yet).

export interface CrossRefTarget {
  verse_id: number;
  book_slug: string;
  chapter_number: number;
  verse_number: number;
  preview: string;
  source: string;
  tier_required: ContentTier;
}

export interface BaselineSourceVerse {
  verse_number: number;
  preview: string;
}

export interface BaselineEntry {
  source_verse: BaselineSourceVerse;
  targets: CrossRefTarget[];
}

export interface ThreadAnchor {
  book_slug: string;
  chapter_number: number;
  verse_start: number;
  verse_end: number;
}

export interface ThreadMemberTarget {
  book_slug: string;
  chapter_number: number;
  verse_number: number;
  preview: string;
}

export interface ThreadMember {
  sort_order: number;
  source_verse_number: number;
  target: ThreadMemberTarget;
  member_note: string | null;
}

export interface ChapterEndThread {
  slug: string;
  title: string;
  summary_md: string;
  anchor: ThreadAnchor | null;
  tier_required: ContentTier;
  members_in_chapter: ThreadMember[];
}

export interface ChapterEndCardBookRef {
  slug: string;
  title: string;
  edition_slug: string;
}

export interface ChapterEndCardChapterRef {
  number: number;
  title: string | null;
}

export interface ChapterEndCardResponse {
  book: ChapterEndCardBookRef;
  chapter: ChapterEndCardChapterRef;
  baseline: BaselineEntry[];
  threads: ChapterEndThread[];
}

// ----- The Witness (working title: Red Pill) — Session 204 -----------------
//
// Mirrors api/models.py WitnessEntry / ChapterWitnessResponse. The
// inverted red-letter overlay: one entry per marked verse in the
// chapter, each carrying the full come-and-see tap-card (both sides
// quoted in full, stand-alone italics, sacred names intact). Free
// tier — the proclamation surface. Pill-generic by design: the
// Kingdom (blue pill) rides the same shape next.

export type WitnessClaimClass = "direct" | "title" | "act" | "structural";

export interface WitnessEntry {
  verse_id: number;
  verse_number: number;
  claim_class: WitnessClaimClass;
  class_label: string;
  card_title: string;
  card_md: string;
  anchor_refs: string[];
}

export interface ChapterWitnessResponse {
  book: ChapterEndCardBookRef;
  chapter: ChapterEndCardChapterRef;
  entries: WitnessEntry[];
}

// ----- The Kingdom (working title: Blue Pill) — Session 205 ---------------
//
// Mirrors api/models.py KingdomEntry / ChapterKingdomResponse. The
// nothing-new overlay: every new-testament mention of what the
// Messiah did, what the good news is, what the kingdom is, what grace
// is — paired with the scripture it was taught from, both quoted in
// full. Free tier — the proclamation surface. Register: the two
// sticks of Ezekiel 37:15-22 — metallic emerald + metallic gold
// joined in one pill.

export type KingdomStrand =
  | "gathering"
  | "good_news"
  | "kingdom"
  | "grace"
  | "teaching";

export interface KingdomEntry {
  verse_id: number;
  verse_number: number;
  strand: KingdomStrand;
  strand_label: string;
  card_title: string;
  card_md: string;
  anchor_refs: string[];
}

export interface ChapterKingdomResponse {
  book: ChapterEndCardBookRef;
  chapter: ChapterEndCardChapterRef;
  entries: KingdomEntry[];
}

// ----- Tiered commentary surface (Session 112) ---------------------------
//
// Mirrors api/models.py ChapterCommentaryResponse. Returns every
// commentary_entries row scoped to the chapter (chapter_id matches,
// verse_id is null) with tier-gating applied per row. Locked rows come
// back with body=null + locked=true so the PWA can render an upgrade
// affordance in place of the content. The free chapter_intro is NOT
// included here — it rides on ChapterDetail.chapter_intro and renders
// above this surface in the PWA stack.

export type SurfaceKind = "inline" | "featured" | "deep_dive";

export interface ChapterCommentaryEntry {
  id: number;
  title: string | null;
  body: string | null;
  surface_kind: SurfaceKind;
  tier_required: ContentTier;
  locked: boolean;
}

export interface ChapterCommentaryResponse {
  book: ChapterEndCardBookRef;
  chapter: ChapterEndCardChapterRef;
  entries: ChapterCommentaryEntry[];
}

// ----- Highlights (Session 113) ------------------------------------------
//
// Locked per DESIGN_LANGUAGE.md §6, §7, §8 (S77/S78):
//   - 12 tribe-palette colors + 1 neon-yellow free baseline
//   - 3 mark styles: fill (translucent tinted background), underline
//     (3px body solid colored line), outline (4-direction text-shadow,
//     same technique as the sacred-name treatment in §2)
//   - Free tier: 1 color (neon_yellow) × 1 style (fill) = 1 mark config
//   - $1.99+: 13 colors × 3 styles = 39 mark configs (12 × 3 paid +
//     neon_yellow × 3 — the neon-yellow free baseline still works at
//     paid tiers + the underline/outline styles unlock for it too)
//   - One mark per (user, verse) — re-marking replaces
//   - Free-form color-meaning dictionary at $1.99 (empty by default,
//     no preloaded framework labels in V1)

export type HighlightColor =
  | "neon_yellow"
  | "crimson"
  | "tangerine"
  | "honey"
  | "sage"
  | "emerald"
  | "teal"
  | "sky_blue"
  | "periwinkle"
  | "lilac"
  | "magenta"
  | "rose"
  | "parchment";

export type MarkStyle = "fill" | "underline" | "outline";

/** The canonical picker render order. Mirrors PALETTE_ORDER in api/main.py. */
export const HIGHLIGHT_PALETTE_ORDER: readonly HighlightColor[] = [
  "neon_yellow",
  "crimson",
  "tangerine",
  "honey",
  "sage",
  "emerald",
  "teal",
  "sky_blue",
  "periwinkle",
  "lilac",
  "magenta",
  "rose",
  "parchment",
] as const;

/** The 12 tribe-palette colors (without neon_yellow). */
export const HIGHLIGHT_TRIBE_COLORS: readonly HighlightColor[] =
  HIGHLIGHT_PALETTE_ORDER.slice(1);

/** Exact hex per DESIGN_LANGUAGE.md §6 + §7. */
export const HIGHLIGHT_HEX: Record<HighlightColor, string> = {
  neon_yellow: "#FFE600",
  crimson: "#D14555",
  tangerine: "#F0A050",
  honey: "#E8C04A",
  sage: "#97C459",
  emerald: "#4DAE7F",
  teal: "#5FB8B0",
  sky_blue: "#87C5E8",
  periwinkle: "#9F9FE0",
  lilac: "#D4B0E0",
  magenta: "#E060A5",
  rose: "#D17BA4",
  parchment: "#C5B795",
};

export const MARK_STYLES: readonly MarkStyle[] = [
  "fill",
  "underline",
  "outline",
] as const;

export interface Highlight {
  id: string;
  verse_id: number;
  color: HighlightColor;
  style: MarkStyle;
  created_at: string;
}

export interface ChapterHighlightsResponse {
  highlights: Highlight[];
}

export interface CreateHighlightRequest {
  verse_id: number;
  color: HighlightColor;
  style: MarkStyle;
}

export interface HighlightLabel {
  color: HighlightColor;
  label: string;
  tier_required: ContentTier;
}

export interface HighlightLabelsResponse {
  labels: HighlightLabel[];
}

export interface UpdateHighlightLabelEntry {
  color: HighlightColor;
  label: string;
}

export interface UpdateHighlightLabelsRequest {
  labels: UpdateHighlightLabelEntry[];
}

// ----- Subscription types (Session 38) -----------------------------------
//
// Mirror api/subscriptions.py's request/response shapes. The me-endpoint
// returns status='none' when the partner has no subscription row yet —
// the reader chrome uses that to decide between "Upgrade" and "Manage".

export type SubscriptionStatus =
  | "none"
  | "trialing"
  | "active"
  | "past_due"
  | "canceled"
  | "unpaid"
  | "incomplete"
  | "incomplete_expired";

export type BillingCadence = "monthly" | "annual";

export type PartnerTier =
  | "free"
  | "study_notes"
  | "extras"
  | "complete_study"
  | "everything";

export interface SubscriptionMe {
  status: SubscriptionStatus;
  tier: PartnerTier | null;
  cadence: BillingCadence | null;
  is_founder_pricing: boolean;
  is_promo_subscriber: boolean;
  locked_price_cents: number | null;
  current_period_end: string | null;
  cancel_at_period_end: boolean;
}

export interface CheckoutCreateRequest {
  tier: Exclude<PartnerTier, "free">;
  cadence: BillingCadence;
  is_founder: boolean;
  success_url: string;
  cancel_url: string;
}

export interface CheckoutCreateResponse {
  checkout_url: string;
  stripe_session_id: string;
}

/**
 * Session 39 — partner-initiated cancellation response.
 *
 * Mirrors SubscriptionMe so the Manage surface can swap rendered state
 * in place from the response without a follow-up /me fetch. tier /
 * cadence / locked_price_cents are preserved through the wind-down —
 * the partner keeps access through current_period_end and the forever-
 * locked price stays with them if they resubscribe later.
 */
export interface CancelResponse {
  status: SubscriptionStatus;
  tier: PartnerTier | null;
  cadence: BillingCadence | null;
  is_founder_pricing: boolean;
  is_promo_subscriber: boolean;
  locked_price_cents: number | null;
  current_period_end: string | null;
  cancel_at_period_end: boolean;
}

// ----- Fetch helpers -----------------------------------------------------

async function get<T>(
  path: string,
  options?: { signal?: AbortSignal },
): Promise<T> {
  const headers: Record<string, string> = { Accept: "application/json" };
  const token = readAccessToken();
  if (token) {
    headers.Authorization = `Bearer ${token}`;
  }
  const res = await fetch(`${API_BASE}${path}`, {
    headers,
    // Include the rop_jwt cookie on cross-subdomain requests. The API
    // accepts the cookie directly when no Authorization header is
    // present; sending both is the belt-and-suspenders default so
    // SSR/incognito/cookie-block edge cases still resolve cleanly.
    credentials: "include",
    // Session 125 (W6 Search V1 UI) — optional AbortSignal so the
    // SearchModal can cancel in-flight requests when the partner types
    // faster than the debounce window resolves. AbortError must be
    // swallowed by the caller (not surfaced as a real error).
    signal: options?.signal,
  });
  if (!res.ok) {
    throw new Error(`API ${path} → ${res.status} ${res.statusText}`);
  }
  return (await res.json()) as T;
}

async function post<TReq, TRes>(path: string, body: TReq): Promise<TRes> {
  const headers: Record<string, string> = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  const token = readAccessToken();
  if (token) {
    headers.Authorization = `Bearer ${token}`;
  }
  const res = await fetch(`${API_BASE}${path}`, {
    method: "POST",
    headers,
    credentials: "include",
    body: JSON.stringify(body),
  });
  if (!res.ok) {
    // Try to surface the FastAPI {detail: "..."} message; fall back to status text.
    let detail = res.statusText;
    try {
      const json = (await res.json()) as { detail?: string };
      if (json.detail) detail = json.detail;
    } catch {
      // Body wasn't JSON; keep statusText.
    }
    throw new Error(`API ${path} → ${res.status} ${detail}`);
  }
  return (await res.json()) as TRes;
}

async function put<TReq, TRes>(path: string, body: TReq): Promise<TRes> {
  const headers: Record<string, string> = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  const token = readAccessToken();
  if (token) {
    headers.Authorization = `Bearer ${token}`;
  }
  const res = await fetch(`${API_BASE}${path}`, {
    method: "PUT",
    headers,
    credentials: "include",
    body: JSON.stringify(body),
  });
  if (!res.ok) {
    let detail = res.statusText;
    try {
      const json = (await res.json()) as { detail?: string };
      if (json.detail) detail = json.detail;
    } catch {
      // not JSON
    }
    throw new Error(`API ${path} → ${res.status} ${detail}`);
  }
  return (await res.json()) as TRes;
}

async function patch<TReq, TRes>(path: string, body: TReq): Promise<TRes> {
  const headers: Record<string, string> = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  const token = readAccessToken();
  if (token) {
    headers.Authorization = `Bearer ${token}`;
  }
  const res = await fetch(`${API_BASE}${path}`, {
    method: "PATCH",
    headers,
    credentials: "include",
    body: JSON.stringify(body),
  });
  if (!res.ok) {
    let detail = res.statusText;
    try {
      const json = (await res.json()) as { detail?: string };
      if (json.detail) detail = json.detail;
    } catch {
      // not JSON
    }
    throw new Error(`API ${path} → ${res.status} ${detail}`);
  }
  return (await res.json()) as TRes;
}

async function del(path: string): Promise<void> {
  const headers: Record<string, string> = { Accept: "application/json" };
  const token = readAccessToken();
  if (token) {
    headers.Authorization = `Bearer ${token}`;
  }
  const res = await fetch(`${API_BASE}${path}`, {
    method: "DELETE",
    headers,
    credentials: "include",
  });
  if (!res.ok && res.status !== 204) {
    let detail = res.statusText;
    try {
      const json = (await res.json()) as { detail?: string };
      if (json.detail) detail = json.detail;
    } catch {
      // not JSON
    }
    throw new Error(`API ${path} → ${res.status} ${detail}`);
  }
}

// ----- Endpoints ---------------------------------------------------------

export function getHealth(): Promise<HealthResponse> {
  return get<HealthResponse>("/health");
}

/**
 * Fetch the requester's most-recent subscription row.
 *
 * Returns `{status: "none"}` for partners with no row (anonymous +
 * SSO-authenticated-but-not-yet-subscribed). 401 is thrown when no JWT
 * cookie is present at all — the reader treats that as anonymous +
 * routes to the WordPress sign-in flow before showing /pricing.
 */
export function getSubscriptionMe(): Promise<SubscriptionMe> {
  return get<SubscriptionMe>("/subscriptions/me");
}

/**
 * Create a Stripe Checkout Session for the requested tier × cadence ×
 * founder tuple. Returns the URL the browser navigates to (the Stripe-
 * hosted checkout page). The page surfaces an "Add promotion code"
 * field automatically because the API sets `allow_promotion_codes=True`
 * on the session.
 */
export function createCheckoutSession(
  body: CheckoutCreateRequest
): Promise<CheckoutCreateResponse> {
  return post<CheckoutCreateRequest, CheckoutCreateResponse>(
    "/subscriptions/checkout",
    body
  );
}

/**
 * Cancel the partner's active subscription.
 *
 * Sets cancel_at_period_end=True on Stripe; access continues through
 * the end of the current billing period and the locked price is
 * preserved on the row. Idempotent — clicking Cancel twice no-ops the
 * second call and returns the current row state. Throws on 4xx/5xx
 * (handled by the caller — surface the API's `detail` string as the
 * partner-facing error).
 */
export function cancelSubscription(): Promise<CancelResponse> {
  return post<Record<string, never>, CancelResponse>(
    "/subscriptions/cancel",
    {}
  );
}

export function listBooks(opts?: {
  witnessCategory?: WitnessCategory;
}): Promise<BookSummary[]> {
  const qs = opts?.witnessCategory
    ? `?witness_category=${encodeURIComponent(opts.witnessCategory)}`
    : "";
  return get<BookSummary[]>(`/books${qs}`);
}

export function getBook(slug: string): Promise<BookDetail> {
  return get<BookDetail>(`/books/${encodeURIComponent(slug)}`);
}

export function listChapters(slug: string): Promise<BookChaptersResponse> {
  return get<BookChaptersResponse>(
    `/books/${encodeURIComponent(slug)}/chapters`
  );
}

export function getChapter(
  slug: string,
  chapterNumber: number
): Promise<ChapterDetail> {
  return get<ChapterDetail>(
    `/books/${encodeURIComponent(slug)}/chapters/${chapterNumber}`
  );
}

/**
 * Chapter-end cross-reference card.
 *
 * Returns the per-verse cross-reference list (one entry per chapter
 * verse with at least one curated target) plus the framework-
 * diagnostic threads (the five-thread overlay seeded in Sessions 73
 * and 74). Every cross_references row is curated and framework-
 * bearing — the TSK comprehensive-baseline direction rolled back at
 * Session 75. The reader UI calls this after a chapter renders and
 * hides the card entirely when both `baseline` and `threads` come
 * back empty.
 *
 * Canon-only at v1; `?edition=` lands when apocrypha-anchored curated
 * threads land.
 */
export function getChapterCrossReferences(
  slug: string,
  chapterNumber: number
): Promise<ChapterEndCardResponse> {
  return get<ChapterEndCardResponse>(
    `/books/${encodeURIComponent(slug)}/chapters/${chapterNumber}/cross-references`
  );
}

/**
 * The Witness marks for one chapter (Session 204 — working title:
 * Red Pill). Empty `entries` when the chapter carries no marks; the
 * reader renders nothing on that state. Free tier — no per-row tier
 * strip, ever.
 */
export function getChapterWitness(
  slug: string,
  chapterNumber: number
): Promise<ChapterWitnessResponse> {
  return get<ChapterWitnessResponse>(
    `/books/${encodeURIComponent(slug)}/chapters/${chapterNumber}/witness`
  );
}

/**
 * The Kingdom marks for one chapter (Session 205 — working title:
 * Blue Pill). Empty `entries` when the chapter carries no marks; the
 * reader renders nothing on that state. Free tier — no per-row tier
 * strip, ever.
 */
export function getChapterKingdom(
  slug: string,
  chapterNumber: number
): Promise<ChapterKingdomResponse> {
  return get<ChapterKingdomResponse>(
    `/books/${encodeURIComponent(slug)}/chapters/${chapterNumber}/kingdom`
  );
}

/**
 * Tiered chapter commentary (Session 112).
 *
 * Returns every commentary_entries row scoped to the chapter, with
 * tier-gating applied. Rows the caller's tier satisfies come back with
 * body populated; locked rows come back with body=null + locked=true
 * so the PWA can render an upgrade affordance (Yoshi's "catch the eye"
 * locked-state requirement). The free chapter_intro is NOT included
 * here — it stays on ChapterDetail.chapter_intro and renders above
 * the tiered stack in the reader.
 *
 * Canon-only at v1, same as the cross-references endpoint. Returns an
 * empty entries[] when the chapter has no commentary_entries rows yet
 * (most non-Matthew chapters as of S112); the renderer hides the
 * whole stack in that case.
 */
export function getChapterCommentary(
  slug: string,
  chapterNumber: number
): Promise<ChapterCommentaryResponse> {
  return get<ChapterCommentaryResponse>(
    `/books/${encodeURIComponent(slug)}/chapters/${chapterNumber}/commentary`
  );
}

/**
 * Highlights (Session 113).
 *
 * Per-partner verse marks. The picker UI calls these on long-press of a
 * verse + on swatch selection. All five endpoints require auth — free
 * callers can list / create / delete their own marks (with the tier-
 * restricted color + style); $1.99+ unlocks the full palette and the
 * free-form color-meaning dictionary.
 */
export function listChapterHighlights(
  bookSlug: string,
  chapterNumber: number
): Promise<ChapterHighlightsResponse> {
  const qs = new URLSearchParams({
    book_slug: bookSlug,
    chapter_number: String(chapterNumber),
  });
  return get<ChapterHighlightsResponse>(`/highlights?${qs.toString()}`);
}

export function createOrReplaceHighlight(
  body: CreateHighlightRequest
): Promise<Highlight> {
  return post<CreateHighlightRequest, Highlight>("/highlights", body);
}

export function deleteHighlight(highlightId: string): Promise<void> {
  return del(`/highlights/${encodeURIComponent(highlightId)}`);
}

export function getHighlightLabels(): Promise<HighlightLabelsResponse> {
  return get<HighlightLabelsResponse>("/highlights/labels");
}

export function updateHighlightLabels(
  body: UpdateHighlightLabelsRequest
): Promise<HighlightLabelsResponse> {
  return put<UpdateHighlightLabelsRequest, HighlightLabelsResponse>(
    "/highlights/labels",
    body
  );
}

// ----- Reading position (Session 116) ------------------------------------
//
// Single-row-per-user "where I left off" pointer. Schema-side and
// API-side documented in api/models.py + api/main.py. The PWA stores
// the same shape in localStorage as a parallel fallback for anonymous
// readers and for when the API is unreachable.
//
// Free-tier feature per DESIGN_LANGUAGE.md §9. No tier gate on either
// endpoint — every authenticated partner can resume.

export interface ReadingPositionResponse {
  book_slug: string;
  chapter_number: number;
  verse_number: number;
  updated_at: string;
}

export interface UpsertReadingPositionRequest {
  book_slug: string;
  chapter_number: number;
  verse_number: number;
}

/**
 * Fetch the authenticated partner's saved reading position.
 *
 * Returns the row when present; the caller catches and handles 404
 * ("no row yet — fall through to localStorage / Genesis 1") and 401
 * ("anonymous — fall through to localStorage / Genesis 1") the same
 * way. Both are normal first-visit / anonymous states, not errors.
 */
export function getReadingPosition(): Promise<ReadingPositionResponse> {
  return get<ReadingPositionResponse>("/reading-position");
}

/**
 * Save the partner's current reading position.
 *
 * The PWA calls this debounced (~1500ms) on chapter-change and on the
 * topmost-visible verse changing (IntersectionObserver). Anonymous
 * callers get a 401 from the API; the helper module
 * (lib/reading-position.ts) catches and writes localStorage instead.
 */
export function putReadingPosition(
  body: UpsertReadingPositionRequest
): Promise<ReadingPositionResponse> {
  return put<UpsertReadingPositionRequest, ReadingPositionResponse>(
    "/reading-position",
    body
  );
}

// ----- Display preferences cross-device sync (Session 173) ---------------
//
// Mirrors api/models.py DisplayPrefs. The wire shape is sparse — every
// field optional + null when absent on the row. The client treats null
// as "server has no preference for this key" and falls back to
// localStorage (then to the in-code default). On PUT the client sends
// the full intended state; the server replaces the JSONB column with
// the body (whole-object semantics, not partial merge — keeps the
// server canonical without merge-stale-state bugs across multi-device
// usage).

export type SacredNameMaskValue = "yahuah" | "yhwh";
export type ReaderThemeValue = "light" | "dark";
export type ReaderFontSizeValue = "small" | "medium" | "large";

export interface DisplayPrefs {
  sacred_name_mask: SacredNameMaskValue | null;
  hide_parentheticals: boolean | null;
  theme: ReaderThemeValue | null;
  font_size: ReaderFontSizeValue | null;
  interlinear_default: boolean | null;
  tts_voice: string | null;
}

/**
 * Fetch the authenticated partner's stored display preferences.
 *
 * The server returns an all-null DisplayPrefs when the row has never
 * been written; the helper module (lib/display-prefs-sync.ts) treats
 * that as "nothing to reconcile, localStorage is authoritative." 401
 * for anonymous callers — sync layer no-ops in that case (no signed-in
 * server canonical state to reconcile against).
 */
export function getDisplayPrefs(): Promise<DisplayPrefs> {
  return get<DisplayPrefs>("/me/display-prefs");
}

/**
 * Push the partner's current local display preferences to the server.
 *
 * Whole-object replacement on the row's JSONB column. Send only the
 * keys the partner has explicitly set (null/absent keys are omitted
 * server-side so the JSONB stays sparse).
 */
export function putDisplayPrefs(body: DisplayPrefs): Promise<DisplayPrefs> {
  return put<DisplayPrefs, DisplayPrefs>("/me/display-prefs", body);
}

// ----- Strong's tap-on-word (Session 121, Wheel 3) -----------------------
//
// Two client surfaces:
//   - getChapterWords(slug, chapter) — batched per-chapter fetch of every
//     verse's Strong's-tagged tokens, in one round trip. PWA fires this
//     alongside getChapter so tap-on-word becomes available without
//     firing N parallel /v1/verses/{id}/words requests (browsers cap
//     ~6 concurrent connections per host; long chapters like Psalm 119
//     would serialize badly).
//   - getStrongEntry(strongNumber) — one lexicon entry by primary key.
//     PWA fires this when a tagged word is tapped, modal renders the
//     response.
//
// Both endpoints public per §9 (free-tier feature). Anonymous callers
// get the same data; no auth/tier gate.

export type StrongLanguage = "hebrew" | "greek" | "aramaic";

export interface StrongEntry {
  strong_number: string;
  language: StrongLanguage;
  lemma: string;
  transliteration: string;
  pronunciation: string | null;
  short_definition: string | null;
  definition: string;
  derivation: string | null;
}

export interface VerseWord {
  position: number;
  surface: string;
  strong_number: string | null;
  /**
   * S168 — §28 interlinear extension fields. Populated for Companion+
   * callers (server-side tier-gate at the chapter-words endpoint);
   * null for anonymous + below-Companion callers. The PWA renders the
   * §28 InterlinearLayer column-stack from these fields.
   *
   * `morphology` is the raw STEPBible morph code (e.g., 'V-AAI-3S',
   * 'HR/Ncfsa'); the PWA decodes via lib/interlinear-helpers.ts's
   * formatMorphology. `lemma`/`transliteration`/`short_definition`
   * come from the joined strong_entries row. `language` drives font-
   * stack selection (SBL Hebrew / SBL BibLit / body fallback).
   */
  morphology?: string | null;
  lemma?: string | null;
  transliteration?: string | null;
  short_definition?: string | null;
  language?: "hebrew" | "greek" | "aramaic" | null;
}

export interface ChapterVerseWords {
  verse_id: number;
  verse_number: number;
  words: VerseWord[];
}

export interface ChapterWordsResponse {
  chapter_id: number;
  verses: ChapterVerseWords[];
}

/** Batched chapter-level Strong's-tagged-token alignment. */
export function getChapterWords(
  slug: string,
  chapterNumber: number
): Promise<ChapterWordsResponse> {
  return get<ChapterWordsResponse>(
    `/books/${encodeURIComponent(slug)}/chapters/${chapterNumber}/words`
  );
}

/** One Strong's lexicon entry. 'H0001' / 'G3056' canonical form. */
export function getStrongEntry(strongNumber: string): Promise<StrongEntry> {
  return get<StrongEntry>(`/strongs/${encodeURIComponent(strongNumber)}`);
}

export interface StrongOccurrence {
  verse_id: number;
  book_slug: string;
  book_title: string;
  chapter_number: number;
  verse_number: number;
  verse_text: string;
  position: number;
}

export interface StrongOccurrencesResponse {
  strong_number: string;
  total_count: number;
  occurrences: StrongOccurrence[];
}

/**
 * Concordance — every verse where the Strong's number appears, in
 * canonical book / chapter / verse order. Paginated (limit + offset)
 * because common words have thousands of occurrences. PWA renders the
 * first page inside the StrongsLookup modal under "Other verses using
 * this word" with a "Show more" affordance.
 */
export function getStrongOccurrences(
  strongNumber: string,
  opts?: { limit?: number; offset?: number }
): Promise<StrongOccurrencesResponse> {
  const params = new URLSearchParams();
  if (opts?.limit !== undefined) params.set("limit", String(opts.limit));
  if (opts?.offset !== undefined) params.set("offset", String(opts.offset));
  const qs = params.toString();
  return get<StrongOccurrencesResponse>(
    `/strongs/${encodeURIComponent(strongNumber)}/occurrences${
      qs ? `?${qs}` : ""
    }`
  );
}

// ----- Bookmarks (Session 124 — Wheel 5) ----------------------------------
//
// Per DESIGN_LANGUAGE.md §22 (locked S124): single-verse flag with richer
// metadata. All endpoints auth-required, all Free-tier (no tier gate per
// §9). All 13 color_tint values valid for every tier (bookmark color is
// personal organization, NOT marking vocabulary that creates the upgrade
// gate per §7).
//
// Distinct surface from highlights and notes — a verse can carry a
// bookmark AND notes AND up to 3 highlights simultaneously.

/** color_tint reuses the §6 13-color palette exactly. Alias for clarity. */
export type BookmarkColorTint = HighlightColor;

export interface Bookmark {
  id: string;
  verse_id: number;
  short_description: string | null;
  tags: string[] | null;
  color_tint: BookmarkColorTint | null;
  created_at: string;
  updated_at: string;
}

export interface ChapterBookmarksResponse {
  bookmarks: Bookmark[];
}

export interface CreateOrReplaceBookmarkRequest {
  verse_id: number;
  short_description?: string | null;
  tags?: string[] | null;
  color_tint?: BookmarkColorTint | null;
}

/** List the partner's bookmarks for one chapter. */
export function listChapterBookmarks(
  bookSlug: string,
  chapterNumber: number
): Promise<ChapterBookmarksResponse> {
  const qs = new URLSearchParams({
    book_slug: bookSlug,
    chapter_number: String(chapterNumber),
  });
  return get<ChapterBookmarksResponse>(`/bookmarks?${qs.toString()}`);
}

/** Create-or-edit a bookmark on one verse. */
export function createOrReplaceBookmark(
  body: CreateOrReplaceBookmarkRequest
): Promise<Bookmark> {
  return post<CreateOrReplaceBookmarkRequest, Bookmark>("/bookmarks", body);
}

/** Remove one bookmark. Idempotent — 204 even if already deleted. */
export function deleteBookmark(bookmarkId: string): Promise<void> {
  return del(`/bookmarks/${encodeURIComponent(bookmarkId)}`);
}

// ----- Bookmarks Index (Session 166 — DESIGN_LANGUAGE.md §29) -------------
//
// Per DESIGN_LANGUAGE.md §29 (locked S166): partner's global bookmarks list.
// One read endpoint, auth-required, Free-tier (no paywall). Returns every
// bookmark across the canon joined with book + chapter + verse metadata,
// sorted by created_at DESC. The BookmarksIndex sheet renders the response
// in a flat scrollable list with navigate-on-tap rows.

export interface BookmarkIndexEntry {
  id: string;
  verse_id: number;
  book_slug: string;
  book_title: string;
  chapter_number: number;
  verse_number: number;
  verse_text: string;
  short_description: string | null;
  tags: string[] | null;
  color_tint: BookmarkColorTint | null;
  created_at: string;
  updated_at: string;
}

export interface BookmarksIndexResponse {
  bookmarks: BookmarkIndexEntry[];
}

/** List every bookmark the requesting partner has across the canon,
 *  joined with book + chapter + verse metadata, sorted newest-first. */
export function listBookmarksIndex(): Promise<BookmarksIndexResponse> {
  return get<BookmarksIndexResponse>("/bookmarks/index");
}

// ----- Notes V1 (Session 124 — Wheel 5) -----------------------------------
//
// Per DESIGN_LANGUAGE.md §22 (locked S124): single global notepad for the
// Free tier with verse-anchor injection. The PWA panel renders the
// chronological journal (oldest entry top → newest entry bottom). All
// endpoints auth-required, all Free-tier (no tier gate per §9).
//
// V1 ships GET/POST only. Edit/delete per-entry is a W8 ($1.99) affordance.

export interface NoteEntry {
  id: string;
  verse_id: number | null;
  chapter_id: number | null;
  title: string | null;
  body: string;
  /** Server-resolved verse reference (e.g. "Hosea 1:10") for verse-
   *  anchored entries. Null when the entry is free-form (verse_id null)
   *  or when the verse can't resolve in the canon edition. */
  verse_ref: string | null;
  created_at: string;
  updated_at: string;
}

export interface NotesResponse {
  notes: NoteEntry[];
}

export interface CreateNoteRequest {
  verse_id?: number | null;
  body: string;
  /** S203 — collections (Study Notes tier; free callers sending tags
   *  receive 403 with the upgrade trigger). */
  tags?: string[] | null;
}

/** List the partner's notes, ordered chronologically (oldest first). */
export function listNotes(): Promise<NotesResponse> {
  return get<NotesResponse>("/notes");
}

/** Append a new entry to the partner's notepad. */
export function appendNote(body: CreateNoteRequest): Promise<NoteEntry> {
  return post<CreateNoteRequest, NoteEntry>("/notes", body);
}

// ----- My Study (Session 203 — Session C) ----------------------------------
//
// The unified personal-apparatus home per the S203 signed-off proof:
// one payload carrying everything the partner has marked — notes,
// bookmarks, highlights — joined with verse + book metadata, plus the
// color-label dictionary and the free-tier note-cap meter. Search,
// the color filter, grouping, and export all run client-side over
// this payload (a partner's apparatus is hundreds of rows at most).

export interface StudyNoteEntry {
  id: string;
  verse_id: number | null;
  title: string | null;
  body: string;
  /** Collections — flat tags presented folder-style. */
  tags: string[] | null;
  verse_ref: string | null;
  verse_text: string | null;
  book_slug: string | null;
  chapter_number: number | null;
  verse_number: number | null;
  created_at: string;
  updated_at: string;
}

export interface StudyHighlightEntry {
  id: string;
  verse_id: number;
  color: HighlightColor;
  style: MarkStyle;
  book_slug: string;
  book_title: string;
  chapter_number: number;
  verse_number: number;
  verse_text: string;
  created_at: string;
}

export interface StudyIndexResponse {
  notes: StudyNoteEntry[];
  bookmarks: BookmarkIndexEntry[];
  highlights: StudyHighlightEntry[];
  labels: HighlightLabel[];
  note_count: number;
  /** Free-tier note ceiling (10), or null for paid tiers. */
  note_cap: number | null;
}

export interface UpdateNoteRequest {
  body?: string;
  /** Replaces the whole array when present; empty list clears. */
  tags?: string[] | null;
}

/** The partner's whole study apparatus in one payload. */
export function getStudyIndex(): Promise<StudyIndexResponse> {
  return get<StudyIndexResponse>("/study/index");
}

/** Edit a note's body and/or tags — Study Notes tier ($1.99+). */
export function updateNote(
  noteId: string,
  body: UpdateNoteRequest,
): Promise<NoteEntry> {
  return patch<UpdateNoteRequest, NoteEntry>(`/notes/${noteId}`, body);
}

/** Delete (archive) a note — Study Notes tier ($1.99+). */
export function deleteNote(noteId: string): Promise<void> {
  return del(`/notes/${noteId}`);
}

// ----- Search V1 (Session 125 — Wheel 6) ----------------------------------
//
// Per DESIGN_LANGUAGE.md §23 (locked S125): pg_trgm trigram search across
// the verses.text body of every book in every edition. Public endpoint
// (no auth), no tier filter — the PWA renders the gate-(c) tier-aware
// snippet card client-side via the new tier_required field on each hit,
// using the existing partnerAtOrAboveTier() helper in App.tsx for the
// tier-ladder resolution. See §23 *API surface* for the inline
// justification on client-side rendering vs server-side filtering.

export interface VerseSearchHit {
  verse_id: number;
  book_slug: string;
  book_title: string;
  chapter_number: number;
  verse_number: number;
  text: string;
  /** pg_trgm similarity score (0.0–1.0); higher = closer match. */
  similarity: number;
  /** books.tier_required for the source book; values match the
   *  content_tier enum: 'free' | 'study_notes' | 'extras' |
   *  'complete_study' | 'everything'. */
  tier_required: string;
}

export interface VerseSearchResponse {
  query: string;
  total: number;
  hits: VerseSearchHit[];
}

/**
 * Run a verse-text search. Pass `signal` from an AbortController so a
 * fast-typing partner's old queries are cancelled before their late-
 * arriving responses can overwrite the current results render.
 *
 * Throws if the fetch fails. AbortError is the caller's signal that the
 * request was cancelled on purpose; the SearchModal swallows it.
 */
export function searchVerses(
  q: string,
  limit = 25,
  signal?: AbortSignal,
): Promise<VerseSearchResponse> {
  const qs = new URLSearchParams({ q, limit: String(limit) });
  return get<VerseSearchResponse>(`/verses/search?${qs.toString()}`, { signal });
}

// ----- Phase 9.3 — Lexicon (Session 163) -------------------------------
//
// Combined endpoint per S163 Q3 decision (single round-trip per word-tap).
// The 403/404 surface is distinct: 403 = below Companion tier (render the
// tier-locked card with the §20 pattern); 404 = no entry (LexiconSheet's
// coverage-fallback empty state per §26); 200 = render the body + callout.

export type LexiconSource = "bdb" | "lsj" | "gesenius";

export interface LexiconEntry {
  source: LexiconSource;
  strong_number: string;
  lemma: string;
  transliteration: string | null;
  pronunciation: string | null;
  part_of_speech: string | null;
  short_definition: string | null;
  body_html: string;
  derivation: string | null;
  citations_count: number;
  disclaimer: string;
}

export interface LexiconCallout {
  strong_number: string;
  term_display: string;
  gloss_error_summary: string;
  body_md: string;
  red_lines_cited: string[];
  last_reviewed_at: string | null;
}

export interface LexiconResponse {
  strong_number: string;
  entries: LexiconEntry[];
  callout: LexiconCallout | null;
  available_sources: LexiconSource[];
}

export type LexiconFetchResult =
  | { status: "ok"; data: LexiconResponse }
  | { status: "tier-locked"; tierRequired: string }
  | { status: "not-found" }
  | { status: "error"; message: string };

/**
 * Fetch the combined lexicon payload for a Strong's number.
 *
 * Returns a tagged-union result so the LexiconSheet can render the
 * tier-locked card (403), the empty-state (404), or the body+callout
 * (200) without throwing on any of those status codes — only network
 * failures + unexpected statuses surface as `status: "error"`.
 */
export async function fetchLexiconEntry(
  strongNumber: string,
): Promise<LexiconFetchResult> {
  const path = `/lexicon/${encodeURIComponent(strongNumber)}`;
  const headers: Record<string, string> = { Accept: "application/json" };
  const token = readAccessToken();
  if (token) headers.Authorization = `Bearer ${token}`;
  try {
    const res = await fetch(`${API_BASE}${path}`, {
      headers,
      credentials: "include",
    });
    if (res.status === 403) {
      let tierRequired = "complete_study";
      try {
        const payload = (await res.json()) as {
          detail?: { tier_required?: string };
        };
        if (payload?.detail?.tier_required) {
          tierRequired = payload.detail.tier_required;
        }
      } catch {
        // body wasn't JSON; keep default
      }
      return { status: "tier-locked", tierRequired };
    }
    if (res.status === 404) {
      return { status: "not-found" };
    }
    if (!res.ok) {
      return { status: "error", message: `${res.status} ${res.statusText}` };
    }
    const data = (await res.json()) as LexiconResponse;
    return { status: "ok", data };
  } catch (e) {
    return {
      status: "error",
      message: e instanceof Error ? e.message : String(e),
    };
  }
}

// ----- Session 196 — Tool annotations (framework annotation-layer overlay) ----
//
// The generalized overlay (APP_BUILDOUT_ROADMAP "annotation layer", locked S194):
// every public-domain tool (Vincent's, Nave's, Maps, TSK, Nikkudot, interlinear
// gloss cells) ships as an untouched base, and this fetches the framework
// correction rendered beside it at point of use. BDB/LSJ word-callouts come from
// fetchLexiconEntry (they live in lexicon_callouts); this is every other tool.
//
// A missing overlay on a known tool is a normal 200 with annotation=null — the
// caller simply renders the PD base with no band — so only kill-switch (404),
// tier-lock (403), and network failures are exceptional.

export type AnnotationTool =
  | "bdb"
  | "lsj"
  | "strongs"
  | "vincents"
  | "interlinear"
  | "nikkudot"
  | "naves"
  | "maps"
  | "tsk";

export interface ToolAnnotation {
  tool: AnnotationTool;
  entry_key: string;
  term_display: string | null;
  conflict_summary: string;
  annotation_md: string;
  tier_required: string;
  red_lines_cited: string[];
  is_punch_list_only: boolean;
  last_reviewed_at: string | null;
}

export interface ToolAnnotationsResponse {
  tool: AnnotationTool;
  entry_key: string;
  annotation: ToolAnnotation | null;
  tool_live_count: number;
}

export type ToolAnnotationFetchResult =
  | { status: "ok"; data: ToolAnnotationsResponse }
  | { status: "tier-locked"; tierRequired: string }
  | { status: "not-found" }
  | { status: "error"; message: string };

/**
 * Fetch the framework annotation-layer overlay for a public-domain tool entry.
 *
 * Returns a tagged-union result mirroring fetchLexiconEntry so the overlay band
 * can render the tier-locked card (403), the disabled/unknown-tool empty (404),
 * or the correction band (200, annotation possibly null) without throwing.
 */
export async function fetchToolAnnotation(
  tool: AnnotationTool,
  entryKey: string,
): Promise<ToolAnnotationFetchResult> {
  // entry_key is a {path} param server-side; encode each path segment so ':'
  // and '.' in verse+lemma / verse-pair keys survive without being mangled.
  const safeKey = entryKey
    .split("/")
    .map((seg) => encodeURIComponent(seg))
    .join("/");
  const path = `/tool-annotations/${encodeURIComponent(tool)}/${safeKey}`;
  const headers: Record<string, string> = { Accept: "application/json" };
  const token = readAccessToken();
  if (token) headers.Authorization = `Bearer ${token}`;
  try {
    const res = await fetch(`${API_BASE}${path}`, {
      headers,
      credentials: "include",
    });
    if (res.status === 403) {
      let tierRequired = "complete_study";
      try {
        const payload = (await res.json()) as {
          detail?: { tier_required?: string };
        };
        if (payload?.detail?.tier_required) {
          tierRequired = payload.detail.tier_required;
        }
      } catch {
        // body wasn't JSON; keep default
      }
      return { status: "tier-locked", tierRequired };
    }
    if (res.status === 404) {
      return { status: "not-found" };
    }
    if (!res.ok) {
      return { status: "error", message: `${res.status} ${res.statusText}` };
    }
    const data = (await res.json()) as ToolAnnotationsResponse;
    return { status: "ok", data };
  } catch (e) {
    return {
      status: "error",
      message: e instanceof Error ? e.message : String(e),
    };
  }
}

// ----- Session 197 — public-domain tool surfaces ------------------------------
//
// Five PD reference tools come off "coming soon" this session, each shipping as
// an untouched annotated-foil base with the framework correction rendered beside
// it via fetchToolAnnotation (S196). All five are Companion-gated and share the
// lexicon_enabled kill-switch server-side. Every fetcher returns the same
// tagged-union shape as fetchLexiconEntry so the sheets render tier-locked (403),
// empty (404), or data (200) without throwing.

export type ToolFetchResult<T> =
  | { status: "ok"; data: T }
  | { status: "tier-locked"; tierRequired: string }
  | { status: "not-found" }
  | { status: "error"; message: string };

/** Shared GET → tagged-union resolver for the S197 tool surfaces. */
async function fetchTagged<T>(path: string): Promise<ToolFetchResult<T>> {
  const headers: Record<string, string> = { Accept: "application/json" };
  const token = readAccessToken();
  if (token) headers.Authorization = `Bearer ${token}`;
  try {
    const res = await fetch(`${API_BASE}${path}`, {
      headers,
      credentials: "include",
    });
    if (res.status === 403) {
      let tierRequired = "complete_study";
      try {
        const payload = (await res.json()) as {
          detail?: { tier_required?: string };
        };
        if (payload?.detail?.tier_required) tierRequired = payload.detail.tier_required;
      } catch {
        // keep default
      }
      return { status: "tier-locked", tierRequired };
    }
    if (res.status === 404) return { status: "not-found" };
    if (!res.ok) return { status: "error", message: `${res.status} ${res.statusText}` };
    const data = (await res.json()) as T;
    return { status: "ok", data };
  } catch (e) {
    return { status: "error", message: e instanceof Error ? e.message : String(e) };
  }
}

// ── Vincent's Word Studies ───────────────────────────────────────────────────
export interface VincentEntry {
  entry_key: string;
  book_slug: string;
  chapter: number;
  verse: number;
  verse_key: string;
  headword: string | null;
  body: string;
  source_vol: string | null;
}

export interface VincentVerseResponse {
  book_slug: string;
  chapter: number;
  verse: number;
  verse_key: string;
  entries: VincentEntry[];
}

export function fetchVincentsVerse(
  bookSlug: string,
  chapter: number,
  verse: number,
): Promise<ToolFetchResult<VincentVerseResponse>> {
  return fetchTagged<VincentVerseResponse>(
    `/vincents/${encodeURIComponent(bookSlug)}/${chapter}/${verse}`,
  );
}

// ── Compare-only versions (S221 data, S224 UI) ───────────────────────────────
// A comparison LENS, never a reader. fetchCompareChapter pulls at most ONE
// chapter (or a single verse via the `verse` arg) of one public-domain
// version beside the reader's primary text; there is no paging client-side
// because the endpoint exposes none. Companion-gated, so both fetchers return
// the same tagged union as the other study tools (tier-locked / not-found / ok).
export interface CompareVersion {
  id: number;
  slug: string;
  title: string;
  abbreviation: string;
  year: string | null;
  has_old_testament: boolean;
  has_new_testament: boolean;
  /** True only for Brenton's LXX — the picker badges it as the Septuagint. */
  is_septuagint: boolean;
  notes: string | null;
}

export interface CompareVersionsResponse {
  versions: CompareVersion[];
}

export interface CompareVerseRow {
  chapter: number;
  verse: number;
  /** LXX lettered sub-verse ('' for the base row, 'a'/'b' for continuations). */
  verse_suffix: string;
  text: string;
}

export interface CompareChapterResponse {
  version: CompareVersion;
  book_code: string;
  book_name: string;
  book_slug: string;
  chapter: number;
  /** The book's verified chapter total — bounds only; never a paging cursor. */
  chapter_count: number;
  scope: "verse" | "chapter";
  verses: CompareVerseRow[];
}

/** Every comparison-only version, for the picker. Companion-gated. */
export function fetchCompareVersions(): Promise<
  ToolFetchResult<CompareVersionsResponse>
> {
  return fetchTagged<CompareVersionsResponse>("/compare/versions");
}

/**
 * One verse (pass `verse`) or one whole chapter (omit it) of a comparison
 * version. The HARD CAP — at most one chapter, no paging — lives server-side;
 * this client only ever requests a single (version, book, chapter).
 */
export function fetchCompareChapter(
  versionId: number,
  bookSlug: string,
  chapter: number,
  verse?: number,
): Promise<ToolFetchResult<CompareChapterResponse>> {
  const q = verse != null ? `?verse=${verse}` : "";
  return fetchTagged<CompareChapterResponse>(
    `/compare/${versionId}/${encodeURIComponent(bookSlug)}/${chapter}${q}`,
  );
}

// ── Nave's Topical ───────────────────────────────────────────────────────────
export interface NavesTopicSummary {
  topic_slug: string;
  section: string | null;
  subject: string;
}

export interface NavesSearchResponse {
  query: string;
  topics: NavesTopicSummary[];
}

export interface NavesTopic {
  topic_slug: string;
  section: string | null;
  subject: string;
  entry: string;
}

export function searchNaves(
  q: string,
): Promise<ToolFetchResult<NavesSearchResponse>> {
  return fetchTagged<NavesSearchResponse>(`/naves?q=${encodeURIComponent(q)}`);
}

export function fetchNavesTopic(
  slug: string,
): Promise<ToolFetchResult<NavesTopic>> {
  return fetchTagged<NavesTopic>(`/naves/${encodeURIComponent(slug)}`);
}

// ── Treasury of Scripture Knowledge (TSK) ────────────────────────────────────
export interface TskPair {
  to_ref: string;
  votes: number;
}

export interface TskVerseResponse {
  book_slug: string;
  chapter: number;
  verse: number;
  from_ref: string;
  pairs: TskPair[];
}

export function fetchTskVerse(
  bookSlug: string,
  chapter: number,
  verse: number,
): Promise<ToolFetchResult<TskVerseResponse>> {
  return fetchTagged<TskVerseResponse>(
    `/tsk/${encodeURIComponent(bookSlug)}/${chapter}/${verse}`,
  );
}

// ── Maps (own-tile render) ───────────────────────────────────────────────────
export interface MapPlace {
  place_id: string;
  name: string | null;
  lon: number;
  lat: number;
  kind: string | null;
  osis_refs: string[];
}

export interface MapPlacesResponse {
  places: MapPlace[];
  count: number;
}

export function fetchMapsPlaces(
  kind?: string,
): Promise<ToolFetchResult<MapPlacesResponse>> {
  const qs = kind ? `?kind=${encodeURIComponent(kind)}` : "";
  return fetchTagged<MapPlacesResponse>(`/maps/places${qs}`);
}

// ── Nikkudot (pointed Hebrew sibling view) ───────────────────────────────────
export interface NikkudotVerseResponse {
  book_slug: string;
  chapter: number;
  verse: number;
  verse_key: string;
  pointed_text: string;
  has_tetragrammaton: boolean;
}

export function fetchNikkudotVerse(
  bookSlug: string,
  chapter: number,
  verse: number,
): Promise<ToolFetchResult<NikkudotVerseResponse>> {
  return fetchTagged<NikkudotVerseResponse>(
    `/nikkudot/${encodeURIComponent(bookSlug)}/${chapter}/${verse}`,
  );
}
