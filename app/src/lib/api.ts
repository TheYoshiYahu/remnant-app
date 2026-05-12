/**
 * Typed client for the Remnant of Promise Bible API.
 *
 * Production API: https://bible.remnantofpromise.org/v1/...
 * Local dev hits the production API directly — render.yaml's
 * CORS_ORIGINS includes http://localhost:5173.
 *
 * Override at build time with VITE_API_BASE if pointing at staging
 * or a local FastAPI uvicorn instance.
 *
 * SSO (Session 36): the bible-app reader picks up a WordPress-issued
 * JWT from the `rop_jwt` cross-subdomain cookie (set at
 * Domain=.remnantofpromise.org by the Session-37 WordPress login
 * handler). When present, it's attached as `Authorization: Bearer`
 * on every API call. The API also accepts the cookie directly (sent
 * automatically via `credentials: 'include'`) for callers that don't
 * read document.cookie themselves. Anonymous callers — no cookie, no
 * header — see the 66-book free canon.
 */

const API_BASE: string =
  import.meta.env.VITE_API_BASE ?? "https://bible.remnantofpromise.org/v1";

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

// ----- Fetch helper ------------------------------------------------------

async function get<T>(path: string): Promise<T> {
  const headers: Record<string, string> = { Accept: "application/json" };
  const token = readJwtCookie();
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
  });
  if (!res.ok) {
    throw new Error(`API ${path} → ${res.status} ${res.statusText}`);
  }
  return (await res.json()) as T;
}

// ----- Endpoints ---------------------------------------------------------

export function getHealth(): Promise<HealthResponse> {
  return get<HealthResponse>("/health");
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
