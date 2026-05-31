/**
 * S173 — Cross-device sync for the partner's reader-display preferences.
 *
 * Pairs with `users.display_prefs JSONB` (S173 schema migration) +
 * `GET/PUT /v1/me/display-prefs` (S173 API endpoints). Bridges the
 * localStorage-backed S172 preference hooks (`useSacredNameMask`,
 * `useParentheticalsToggle`) with the server canonical state so a
 * preference flip on phone A carries to phone B at sign-in.
 *
 * Reconciliation rule (S172_SACRED_NAME_MASK_SPEC):
 *   "Synced on sign-in: server preference wins over localStorage if
 *    the two diverge."
 *
 * Execution flow:
 *   - App mount → `pullAndReconcile()` fires once when the JWT cookie
 *     is present. For every key the server returns non-null, the helper
 *     writes the server value into localStorage and dispatches the
 *     in-tab `rop:display-prefs-changed` CustomEvent so the React hooks
 *     re-read their state. Cross-tab updates piggyback on the native
 *     `storage` event the same way.
 *   - Hook `set()` → after persisting locally, the hook calls
 *     `pushSnapshot()` to PUT the full current snapshot to the server.
 *     `pushSnapshot()` no-ops when no JWT cookie is present (anonymous
 *     callers — there's no signed-in canonical state to write).
 *
 * Failure modes (all silent, all fall back to localStorage-only):
 *   - No JWT cookie (anonymous): pull + push both no-op.
 *   - API unreachable or 401/5xx: pull resolves to null (reconcile
 *     skipped); push catches and swallows.
 *   - localStorage unavailable (private window): the writeLocalSnapshot
 *     no-ops per the same SSR-safe guard the hooks use.
 *
 * The two preferences wired this session are sacred_name_mask and
 * hide_parentheticals — the two render-affecting prefs with active
 * S172 hooks. The other four keys in the DisplayPrefs shape
 * (theme/font_size/interlinear_default/tts_voice) round-trip through
 * the sync layer untouched and are forward-compatible for whenever
 * their Settings controls land.
 */

import {
  getDisplayPrefs,
  putDisplayPrefs,
  type DisplayPrefs,
  type SacredNameMaskValue,
} from "./api";
import { getCachedNativeToken } from "./native-auth";

// ----- localStorage key registry -----------------------------------------

const KEY_SACRED_NAME_MASK = "rop_sacred_name_mask_v1";
const KEY_HIDE_PARENTHETICALS = "rop_hide_parentheticals_v1";
// Theme / font-size / interlinear-default / TTS voice keys are not yet
// owned by S172/S173 hooks; the entries below are commented out until
// those settings controls land. Adding them later is a one-line change
// in `readLocalSnapshot` / `writeLocalSnapshot` plus the corresponding
// hook update.
// const KEY_THEME              = "rop_theme_v1";
// const KEY_FONT_SIZE          = "rop_font_size_v1";
// const KEY_INTERLINEAR        = "rop_interlinear_default_v1";
// const KEY_TTS_VOICE          = "rop_tts_voice_v1";

const SSO_COOKIE_NAME = "rop_jwt";

/**
 * The in-tab custom event the sync layer dispatches after writing
 * server-canonical values into localStorage. The S172 hooks listen for
 * this event in addition to the native `storage` event (which only
 * fires cross-tab) so a same-tab reconciliation still updates the React
 * tree.
 */
export const DISPLAY_PREFS_CHANGED_EVENT = "rop:display-prefs-changed";

// ----- Auth check --------------------------------------------------------

/**
 * Best-effort check that the partner is signed in. We don't decode
 * the token — the API enforces auth — but if neither the PWA cookie
 * nor a native-stored JWT is present, there's no point firing a
 * request that's going to 401.
 *
 * Two storage paths checked (S176):
 *   1. Native-shell Preferences cache — populated at app init when a
 *      Capacitor partner has signed in via the system-browser flow.
 *      The Capacitor webview's https://localhost origin can't see the
 *      .remnantofpromise.org cookie, so the in-memory native-token
 *      cache is the only signed-in signal on native.
 *   2. document.cookie path (S174 / Session 36) — the rop_jwt cookie
 *      set by the rop-sso-bridge WP plugin on PWA login.
 *
 * The function name stays `hasJwtCookie` for callsite stability —
 * semantic is now "the partner is signed in via either path."
 *
 * S174 — exported so the SacredNameWelcomeModal mount-condition check
 * in App.tsx can suppress the sign-in ask for partners who already
 * have a session (signed-in partners obviously don't need the ask).
 */
export function hasJwtCookie(): boolean {
  // S176 — native-token branch first. Sync (in-memory cache), cheap on
  // both web (returns null, falls through) and native (the only signal
  // there). Cookie path stays as the PWA fallback.
  if (getCachedNativeToken()) return true;
  if (typeof document === "undefined") return false;
  const prefix = `${SSO_COOKIE_NAME}=`;
  const parts = document.cookie ? document.cookie.split("; ") : [];
  for (const part of parts) {
    if (part.startsWith(prefix)) {
      // Empty value still means "cookie was set but cleared"; treat as
      // no cookie so we don't fire a doomed request.
      return part.slice(prefix.length).length > 0;
    }
  }
  return false;
}

// ----- localStorage read / write -----------------------------------------

function safeRead(key: string): string | null {
  if (typeof window === "undefined") return null;
  try {
    return window.localStorage.getItem(key);
  } catch {
    return null;
  }
}

function safeWrite(key: string, value: string): boolean {
  if (typeof window === "undefined") return false;
  try {
    window.localStorage.setItem(key, value);
    return true;
  } catch {
    return false;
  }
}

/**
 * Read the partner's current local display preferences out of
 * localStorage. Returns nulls for any key that's not been set — the
 * push path then omits those from the server payload so the JSONB on
 * the row stays sparse.
 */
export function readLocalSnapshot(): DisplayPrefs {
  const maskRaw = safeRead(KEY_SACRED_NAME_MASK);
  const sacred_name_mask: SacredNameMaskValue | null =
    maskRaw === "yahuah" || maskRaw === "yhwh" ? maskRaw : null;

  const parensRaw = safeRead(KEY_HIDE_PARENTHETICALS);
  const hide_parentheticals: boolean | null =
    parensRaw === "true" ? true : parensRaw === "false" ? false : null;

  return {
    sacred_name_mask,
    hide_parentheticals,
    theme: null,
    font_size: null,
    interlinear_default: null,
    tts_voice: null,
  };
}

/**
 * Write the server-canonical snapshot into localStorage. For each key
 * present (non-null) on the snapshot, the corresponding localStorage
 * key is overwritten. Null keys are NOT written (the server has no
 * opinion on that key; localStorage stays as-is).
 *
 * After writing, dispatches `rop:display-prefs-changed` so in-tab
 * hooks re-read. Cross-tab updates piggyback on the native `storage`
 * event the browser fires on its own.
 *
 * Returns true if any key was actually written (used by the reconcile
 * path to skip the event dispatch when there was nothing to update).
 */
export function writeLocalSnapshot(prefs: DisplayPrefs): boolean {
  let changed = false;

  if (prefs.sacred_name_mask !== null) {
    const current = safeRead(KEY_SACRED_NAME_MASK);
    if (current !== prefs.sacred_name_mask) {
      if (safeWrite(KEY_SACRED_NAME_MASK, prefs.sacred_name_mask)) {
        changed = true;
      }
    }
  }

  if (prefs.hide_parentheticals !== null) {
    const next = String(prefs.hide_parentheticals);
    const current = safeRead(KEY_HIDE_PARENTHETICALS);
    if (current !== next) {
      if (safeWrite(KEY_HIDE_PARENTHETICALS, next)) {
        changed = true;
      }
    }
  }

  if (changed && typeof window !== "undefined") {
    try {
      window.dispatchEvent(new CustomEvent(DISPLAY_PREFS_CHANGED_EVENT));
    } catch {
      /* CustomEvent unavailable in some test environments; harmless. */
    }
  }

  return changed;
}

// ----- Pull / push (network) ---------------------------------------------

/**
 * Fetch the server's canonical display preferences and reconcile them
 * into localStorage. Server wins on every key the server has set
 * (non-null on the response); keys the server has not set stay at the
 * partner's local value (which the next push will sync upward).
 *
 * No-ops when no JWT cookie is present (anonymous → no canonical
 * server state to reconcile against). Swallows network/HTTP errors so
 * a flaky API never blocks the reader from mounting.
 */
export async function pullAndReconcile(): Promise<void> {
  if (!hasJwtCookie()) return;
  let server: DisplayPrefs;
  try {
    server = await getDisplayPrefs();
  } catch {
    return; // anonymous (401), network down, or 5xx — fall through to localStorage
  }
  writeLocalSnapshot(server);
}

/**
 * Push the partner's current local display preferences to the server.
 * Whole-object replacement of the JSONB column on the row (the server
 * omits null keys when serializing so the JSONB stays sparse).
 *
 * No-ops when no JWT cookie is present (anonymous → nowhere to push).
 * Swallows network/HTTP errors so a transient API failure doesn't
 * surface to the partner — the local change is still persisted, and
 * the next successful `pushSnapshot` (next toggle, next sign-in) will
 * carry it.
 */
export async function pushSnapshot(): Promise<void> {
  if (!hasJwtCookie()) return;
  const snapshot = readLocalSnapshot();
  try {
    await putDisplayPrefs(snapshot);
  } catch {
    /* swallow — local write already succeeded; retry on next change */
  }
}
