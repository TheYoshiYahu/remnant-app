/**
 * visit.ts — S504 visit counter: one beacon per page load (design in
 * S504_VISIT_COUNTER_DESIGN.md).
 *
 * POST /v1/visit { anon_id, surface: 'app', path }. The API answers 204 and
 * decides who the visit belongs to: a signed-in reader (the rop_jwt cookie,
 * or the Bearer token in the native shell) is counted by account and the
 * anon_id is dropped; otherwise the API stores sha256(ANON_SALT + anon_id).
 *
 * anon_id is a random UUID made here and kept in localStorage — NOT a cookie,
 * so no cookie banner and no third party ever sees it; clearing site data
 * removes it. Nothing about notes, highlights or search is sent: the path is
 * the page the reader opened (the API keeps only ?book= ?chapter= ?edition=
 * from the query string, never the rest). Never throws, never awaited by the
 * app — the counter must not slow a page.
 */

import { getCachedNativeToken } from "./native-auth";

const API_BASE: string =
  import.meta.env.VITE_API_BASE ?? "https://api.bible.remnantofpromise.org/v1";
const KEY = "rop_visit_id";

function anonId(): string | null {
  try {
    let id = localStorage.getItem(KEY);
    if (!id) {
      id =
        typeof crypto !== "undefined" && "randomUUID" in crypto
          ? crypto.randomUUID()
          : Array.from(crypto.getRandomValues(new Uint8Array(16)), (b) =>
              b.toString(16).padStart(2, "0"),
            ).join("");
      localStorage.setItem(KEY, id);
    }
    return id;
  } catch {
    return null; // storage blocked: the visit is simply not counted
  }
}

export function recordVisit(): void {
  try {
    const id = anonId();
    if (!id) return;
    const headers: Record<string, string> = { "Content-Type": "application/json" };
    const native = getCachedNativeToken();
    if (native) headers.Authorization = `Bearer ${native}`;
    void fetch(`${API_BASE}/visit`, {
      method: "POST",
      headers,
      credentials: "include",
      keepalive: true,
      body: JSON.stringify({
        anon_id: id,
        surface: "app",
        path: location.pathname + location.search,
      }),
    }).catch(() => undefined);
  } catch {
    /* never let the counter break the app */
  }
}
