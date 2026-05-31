/**
 * S176 — Native auth token storage + sync read.
 *
 * The PWA's auth path reads the rop_jwt cookie at .remnantofpromise.org
 * directly from document.cookie. That cookie is invisible to the
 * Capacitor native shell (the webview's origin is https://localhost;
 * the cookie's domain is .remnantofpromise.org — cookies don't cross).
 *
 * S176 closes the gap with a system-browser sign-in flow:
 *   1. SignIn route calls @capacitor/browser's Browser.open() with the
 *      WordPress /wp-json/rop/v1/native-auth-callback URL.
 *   2. The partner logs in to WordPress in the system browser (or, if
 *      already logged in, skips straight through).
 *   3. WP mints the JWT via the rop-sso-bridge plugin v1.1.0 endpoint
 *      and 302-redirects to bible.remnantofpromise.org/auth-callback
 *      ?token=<JWT>.
 *   4. The Android AndroidManifest intent-filter for /auth-callback
 *      (autoVerify) intercepts the URL and launches the native app
 *      with the URL attached.
 *   5. @capacitor/app's appUrlOpen event fires; the deep-link router
 *      (lib/deep-link.ts) extracts the token and calls
 *      storeNativeToken() below.
 *   6. storeNativeToken() persists to Capacitor Preferences AND seeds
 *      the in-memory cache so the very next API call (post-store)
 *      attaches the Bearer header without waiting for a re-read.
 *   7. api.ts's readAccessToken() consults the in-memory cache first
 *      (sync), falling back to the document.cookie path for the PWA.
 *
 * Why an in-memory cache + sync read.
 *
 *   The api.ts get / post / put / del helpers attach the auth header
 *   synchronously inside the fetch call setup — there is no await
 *   point in the hot path. Capacitor Preferences is asynchronous
 *   (file I/O under the hood on Android). If we required an await on
 *   every fetch, every API call would incur a Preferences round-trip
 *   for the token read — measurable cost on cold cache, ugly to
 *   plumb through the existing sync helpers.
 *
 *   Instead, we load the stored token once at app init (the
 *   loadStoredNativeToken() call in App.tsx's mount effect), seed the
 *   in-memory cache, and let every subsequent fetch read the cache
 *   synchronously. Auth-callback writes update the cache before
 *   returning. Logout clears it. The Preferences row is the durable
 *   store; the cache is the per-process snapshot.
 *
 * Why @capacitor/preferences specifically.
 *
 *   localStorage in the Capacitor webview *does* persist across app
 *   restarts (the webview's localStorage maps to per-app sandbox
 *   storage on Android). But Preferences gives us:
 *     - explicit lifecycle (no risk of webview clearing on update)
 *     - parity with iOS UserDefaults if we ever ship there
 *     - the standard Capacitor pattern (matches the broader native
 *       community's expectations)
 *
 * No-op on web.
 *
 *   Every public function on this module is web-safe. The Preferences
 *   import is lazy (inside the function bodies), so the web bundle
 *   doesn't pull the plugin in unless it actually runs on native. On
 *   web, loadStoredNativeToken() returns null, storeNativeToken() is
 *   a no-op, and getCachedNativeToken() always returns null — leaving
 *   the cookie path to do its job uninterrupted.
 */

/**
 * The Preferences key the token is stored under. Versioned so a future
 * payload shape change (e.g., wrapping the token in a {token, exp}
 * envelope) can land with a key bump rather than a migration script.
 */
const NATIVE_JWT_KEY = "rop_native_jwt_v1";

/**
 * In-memory token cache. Read synchronously by api.ts's helpers.
 * Updated on app-init load, on auth-callback receipt, and on logout.
 * Null when no token is stored (anonymous) or when the load hasn't
 * completed yet (the brief window between app mount and the first
 * Preferences read).
 */
let cachedToken: string | null = null;

/**
 * Returns true when the runtime is the Capacitor native shell. The
 * cookie path is the right one on web; the Preferences path is for
 * native only.
 */
async function isNativePlatform(): Promise<boolean> {
  try {
    const { Capacitor } = await import("@capacitor/core");
    return Capacitor.isNativePlatform();
  } catch {
    return false;
  }
}

/**
 * Sync read of the in-memory token cache. Called from api.ts on every
 * fetch. Returns null on web (cache is never populated) and on native
 * before the initial load completes — in both cases the caller falls
 * back to the cookie path, which is the right behavior on web and a
 * harmless no-op on native (the cookie doesn't exist there).
 */
export function getCachedNativeToken(): string | null {
  return cachedToken;
}

/**
 * Load the stored token from Capacitor Preferences and seed the
 * in-memory cache. Call once at App mount (after the Capacitor
 * runtime is confirmed available). No-op on web — cachedToken stays
 * null and the cookie path does its job.
 *
 * Returns the loaded token (or null) for callers that want to make a
 * post-load decision (e.g., kick off /v1/subscriptions/me on confirm).
 */
export async function loadStoredNativeToken(): Promise<string | null> {
  if (!(await isNativePlatform())) return null;
  try {
    const { Preferences } = await import("@capacitor/preferences");
    const { value } = await Preferences.get({ key: NATIVE_JWT_KEY });
    cachedToken = value && value.length > 0 ? value : null;
    return cachedToken;
  } catch {
    // Preferences plugin unavailable or storage read failed —
    // treat as anonymous, don't crash.
    cachedToken = null;
    return null;
  }
}

/**
 * Persist a token from a successful /auth-callback delivery. Updates
 * the in-memory cache synchronously (so the next fetch picks it up)
 * AND writes to Preferences (so it survives app restart).
 *
 * Web fallback: writes to document.cookie as well, in case the same
 * AuthCallback page is hit in the PWA. (Unusual but possible if the
 * partner manually copies the auth-callback URL into a browser.) The
 * cookie path then takes over the next render.
 */
export async function storeNativeToken(token: string): Promise<void> {
  cachedToken = token;
  if (!(await isNativePlatform())) {
    // Web: write the cookie at .remnantofpromise.org so the existing
    // api.ts readJwtCookie() path picks it up. document.cookie's
    // default domain is the current host, which is fine — the PWA
    // and the auth-callback land on the same host (bible.r.o).
    if (typeof document !== "undefined") {
      const maxAge = 7 * 24 * 60 * 60; // 7 days, matching the WP-side cookie lifetime
      document.cookie =
        "rop_jwt=" +
        encodeURIComponent(token) +
        "; path=/; max-age=" +
        String(maxAge) +
        "; secure; samesite=Lax";
    }
    return;
  }
  try {
    const { Preferences } = await import("@capacitor/preferences");
    await Preferences.set({ key: NATIVE_JWT_KEY, value: token });
  } catch {
    // Preferences write failed — the in-memory cache is still set,
    // so the partner stays signed in for this session. They'll just
    // need to sign in again next app launch.
  }
}

/**
 * Clear the stored token. Called from a future native Sign-Out
 * affordance (not implemented in S176 — V1.1+ adds an in-app sign-out
 * button). Wires the symmetric counterpart to storeNativeToken() so
 * the lifecycle is complete even if no UI surface invokes it yet.
 */
export async function clearNativeToken(): Promise<void> {
  cachedToken = null;
  if (!(await isNativePlatform())) {
    if (typeof document !== "undefined") {
      document.cookie =
        "rop_jwt=; path=/; max-age=0; secure; samesite=Lax";
    }
    return;
  }
  try {
    const { Preferences } = await import("@capacitor/preferences");
    await Preferences.remove({ key: NATIVE_JWT_KEY });
  } catch {
    // Storage clear failed — the in-memory cache is cleared, so the
    // partner is signed out for this session. The stale row will be
    // overwritten on the next sign-in.
  }
}

/**
 * S177 — In-app credential sign-in.
 *
 * The S176 Custom Tab + App Link round-trip turned out to be the wrong
 * pattern for first-party auth: the Custom Tab's cookie jar is
 * separate from any prior WP session, the WP-side wp-login redirect
 * chain gets hijacked by LoginWP (Peter's Login Redirect) overriding
 * redirect_to= and sending the partner to /wp-admin/, and Android's
 * App Link autoVerify handoff isn't reliable across Custom Tab 302
 * chains. Net result: partners got stuck on "Finishing sign-in…" with
 * no token reaching the native app.
 *
 * V1 architecture: replace the round-trip with a direct POST to the
 * jwt-auth plugin's stock /wp-json/jwt-auth/v1/token endpoint. The
 * partner types email/username + password into an in-app form, the
 * app exchanges credentials for a JWT directly, and storeNativeToken
 * persists it. No browser hop, no redirect chain, no deep-link
 * handoff — the standard mobile-app first-party auth pattern.
 *
 * The JWT shape jwt-auth issues is the same shape api/auth.py expects
 * (HS256 signed with JWT_AUTH_SECRET_KEY, data.user.id at minimum). On
 * the api side, DB-wins-over-JWT tier resolution (S114) means the
 * partner_tier claim is informational — the subscriptions table is the
 * source of truth for tier-gated content. So even though jwt-auth's
 * stock response doesn't carry partner_tier, the API still resolves
 * the tier correctly from DB on every request.
 *
 * CORS: the jwt-auth plugin only emits Access-Control-Allow-Origin
 * headers when JWT_AUTH_CORS_ENABLE is defined as true in wp-config.php.
 * Without it, the Capacitor native shell's https://localhost origin
 * will fail the cross-origin preflight. If sign-in returns
 * network_error, add `define('JWT_AUTH_CORS_ENABLE', true);` to
 * wp-config.php and redeploy / clear cache.
 */
const WP_JWT_AUTH_TOKEN_ENDPOINT =
  "https://remnantofpromise.org/wp-json/jwt-auth/v1/token";

/**
 * Thrown by loginWithCredentials when sign-in fails. `code` is the
 * upstream jwt-auth error code (or a synthetic one) for programmatic
 * branching; `message` is the partner-friendly string the SignIn form
 * surfaces directly.
 */
export class LoginCredentialsError extends Error {
  public readonly code: string;
  constructor(code: string, message: string) {
    super(message);
    this.name = "LoginCredentialsError";
    this.code = code;
  }
}

/**
 * Exchange a partner's credentials for a JWT and persist it. Throws
 * LoginCredentialsError on any failure; the form surface displays
 * error.message directly to the partner.
 *
 * On success, the JWT is stored via storeNativeToken (which seeds the
 * in-memory cache so the very next api.ts fetch carries the new Bearer
 * header without waiting for a Preferences re-read) and the same token
 * is returned for callers that want to make a post-sign-in decision.
 */
export async function loginWithCredentials(
  usernameOrEmail: string,
  password: string,
): Promise<string> {
  if (!usernameOrEmail || usernameOrEmail.length === 0) {
    throw new LoginCredentialsError(
      "empty_username",
      "Please enter your email or username.",
    );
  }
  if (!password || password.length === 0) {
    throw new LoginCredentialsError(
      "empty_password",
      "Please enter your password.",
    );
  }

  let response: Response;
  try {
    response = await fetch(WP_JWT_AUTH_TOKEN_ENDPOINT, {
      method: "POST",
      mode: "cors",
      credentials: "omit",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        username: usernameOrEmail,
        password,
      }),
    });
  } catch {
    throw new LoginCredentialsError(
      "network_error",
      "We couldn't reach remnantofpromise.org. Check your connection and try again.",
    );
  }

  let body: unknown;
  try {
    body = await response.json();
  } catch {
    throw new LoginCredentialsError(
      "bad_response",
      "Sign-in didn't return a recognizable response. Try again — if this keeps happening, sign in at remnantofpromise.org in your phone's browser first to confirm the account works there.",
    );
  }

  const bodyObj = (body && typeof body === "object" ? body : {}) as {
    token?: unknown;
    code?: unknown;
    message?: unknown;
  };

  if (response.ok && typeof bodyObj.token === "string" && bodyObj.token.length > 0) {
    await storeNativeToken(bodyObj.token);
    return bodyObj.token;
  }

  // jwt-auth failure shapes — examples:
  //   { code: "[jwt_auth] invalid_username", message: "Unknown user." }
  //   { code: "[jwt_auth] incorrect_password", message: "..." }
  //   { code: "[jwt_auth] empty_username" / "[jwt_auth] empty_password" }
  const rawCode =
    typeof bodyObj.code === "string" ? bodyObj.code : "unknown_error";
  const friendly = pickFriendlyError(rawCode, bodyObj.message);
  throw new LoginCredentialsError(rawCode, friendly);
}

function pickFriendlyError(rawCode: string, rawMessage: unknown): string {
  if (
    rawCode.includes("incorrect_password") ||
    rawCode.includes("invalid_username") ||
    rawCode.includes("invalid_email")
  ) {
    return "Email or password doesn't match. Try again, or use Forgot password.";
  }
  if (rawCode.includes("empty_")) {
    return "Please enter both email and password.";
  }
  if (typeof rawMessage === "string" && rawMessage.length > 0) {
    // jwt-auth occasionally returns HTML-flavored messages; strip tags
    // so the form-surface error stays plain text.
    const stripped = rawMessage.replace(/<[^>]+>/g, "").trim();
    if (stripped.length > 0) return stripped;
  }
  return "Sign-in didn't complete. Try again in a moment.";
}

/**
 * Parse a bible.remnantofpromise.org/auth-callback URL into either a
 * token (success path) or an error code (failure path). Returns null
 * when the URL doesn't match the auth-callback route — the deep-link
 * router uses this as the discriminator before routing to
 * storeNativeToken().
 *
 * Exported for the S176 sanity test. Retained for the unusual case
 * of a partner pasting an auth-callback URL into a browser; the S177
 * in-app flow bypasses this code path entirely.
 */
export type AuthCallbackResult =
  | { kind: "token"; token: string }
  | { kind: "error"; code: string };

export function parseAuthCallbackDeepLink(
  rawUrl: string,
): AuthCallbackResult | null {
  let url: URL;
  try {
    url = new URL(rawUrl);
  } catch {
    return null;
  }
  const host = url.hostname.toLowerCase();
  // Same hostname-allowlist as parseStrongsDeepLink — accept apex AND
  // api-subdomain because the WP 302 may resolve through either path
  // depending on the OS's redirect-following behavior.
  if (
    host !== "bible.remnantofpromise.org" &&
    host !== "api.bible.remnantofpromise.org"
  ) {
    return null;
  }
  if (url.pathname !== "/auth-callback") {
    return null;
  }
  const token = url.searchParams.get("token");
  if (token && token.length > 0) {
    return { kind: "token", token };
  }
  const error = url.searchParams.get("error");
  if (error && error.length > 0) {
    return { kind: "error", code: error };
  }
  // /auth-callback hit with neither token nor error — treat as a
  // malformed callback. The deep-link router surfaces a generic error.
  return { kind: "error", code: "missing_token" };
}
