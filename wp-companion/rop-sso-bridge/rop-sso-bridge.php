<?php
/**
 * Plugin Name: Remnant of Promise — SSO Cookie Bridge
 * Plugin URI:  https://remnantofpromise.org/
 * Description: Sets the rop_jwt cross-subdomain cookie on WordPress login,
 *              clears it on logout. Bridges WordPress sessions into the
 *              bible-app (bible.remnantofpromise.org) JWT auth path. Also
 *              exposes a GET endpoint at /wp-json/rop/v1/native-auth-callback
 *              that mints the same JWT for a logged-in WP session and
 *              302-redirects to bible.remnantofpromise.org/auth-callback
 *              with the token — the Android App Link path the native shell
 *              uses to receive sign-in state (S176).
 *              Self-contained — uses native PHP hash_hmac, reads
 *              JWT_AUTH_SECRET_KEY from wp-config.php, reads
 *              rop_partner_tier from user-meta (written by the
 *              Session 37 Stripe webhook → WP-sync push).
 * Version:     1.1.1
 * Author:      Yoshi
 * License:     GPL-2.0-or-later
 * Text Domain: rop-sso-bridge
 */

/*
 * --- Why this plugin exists ---
 *
 * The JWT-Authentication-for-WP-REST-API plugin (Enrique Chavez) issues
 * JWTs only through its REST endpoint POST /wp-json/jwt-auth/v1/token.
 * It does NOT hook into the standard WordPress login flow. So when a
 * partner logs in at /wp-admin or wp-login.php on remnantofpromise.org,
 * no JWT cookie gets set, and the bible-app at bible.remnantofpromise.org
 * sees them as anonymous (66-book canon only).
 *
 * This companion plugin closes that gap. On the wp_login action it
 * mints an HS256 JWT (same secret + algorithm + payload shape that
 * api/auth.py::_decode_token expects), and writes it to the rop_jwt
 * cookie at Domain=.remnantofpromise.org so both bible. and api.bible.
 * subdomains pick it up automatically. On wp_logout it clears the
 * cookie.
 *
 * --- Wire shape (must match api/auth.py) ---
 *
 *   JWT_ALGORITHM = HS256
 *   Required claims: exp, iat   (pyjwt options={"require": ["exp", "iat"]})
 *   Payload:
 *     {
 *       "iss": home_url(),
 *       "iat": <unix ts>,
 *       "nbf": <unix ts>,
 *       "exp": <unix ts + lifetime>,
 *       "data": {
 *         "user": {
 *           "id":            "<numeric user id as string>",
 *           "login":         "<user_login>",
 *           "display_name":  "<display_name>",
 *           "partner_tier":  "<free|study_notes|extras|complete_study|everything>"
 *         }
 *       }
 *     }
 *
 *   Cookie attributes:
 *     name      = rop_jwt
 *     domain    = .remnantofpromise.org   (leading-dot — cross-subdomain)
 *     path      = /
 *     secure    = true                    (HTTPS only)
 *     httponly  = false                   (App.tsx::readJwtCookie reads
 *                                          document.cookie for the
 *                                          Bearer-header belt path)
 *     samesite  = Lax                     (matches the Session 36
 *                                          install file's manual paste)
 *     expires   = now + 7 days
 *
 * --- Install ---
 *
 * Either:
 *   (a) Zip the parent folder, upload via WP admin →
 *       Plugins → Add New → Upload Plugin → Activate; or
 *   (b) Upload this file (in its parent folder) to
 *       /wp-content/plugins/ via WP Engine User Portal File Manager
 *       or SFTP, then activate via WP admin → Plugins.
 *
 * After activation, log out + log back in once to issue the cookie.
 *
 * --- Dependencies ---
 *
 *   - WordPress 5.0+ (uses wp_login + wp_logout actions, both stock)
 *   - PHP 7.3+       (setcookie() options-array form for SameSite)
 *   - JWT_AUTH_SECRET_KEY constant defined in wp-config.php
 *     (the same secret the JWT-Auth plugin reads — Session 36
 *     wp_install.md step 2 set this up; the value also lives on
 *     Render as the JWT_SECRET env var)
 *
 * --- Failure modes (all log + bail, none break login) ---
 *
 *   - JWT_AUTH_SECRET_KEY undefined → log, skip cookie set (user can
 *     still log in to WP, just won't see paid-tier content on bible.)
 *   - setcookie() returns false → log, continue (browser sometimes
 *     rejects cookies in odd edge cases — login still completes)
 *   - rop_partner_tier user-meta unset → partner_tier defaults to
 *     'free' (same as anonymous; safer-than-overclaim)
 *
 * --- S176: native-auth-callback endpoint ---
 *
 * The cookie path above works for the PWA (bible.remnantofpromise.org
 * served from the same .remnantofpromise.org cookie scope). It does
 * NOT work for the native Android Capacitor shell — that webview loads
 * from https://localhost (Capacitor's internal scheme), so the
 * .remnantofpromise.org cookie is invisible to it.
 *
 * The S176 fix: a small GET endpoint that takes a logged-in WP session
 * and 302-redirects to bible.remnantofpromise.org/auth-callback with
 * the JWT in the query string. The native side opens
 * remnantofpromise.org's login page in the system browser (via
 * @capacitor/browser), the partner logs in, WP redirects to this
 * endpoint, this endpoint mints the JWT and bounces to /auth-callback.
 * Android's App Link autoVerify intercepts /auth-callback (intent-
 * filter set in AndroidManifest), launches the native app with the
 * URL, the deep-link router extracts the token, and stores it via
 * Capacitor Preferences. Subsequent API calls attach the token as an
 * Authorization: Bearer header (api/auth.py already supports both the
 * cookie path and the Bearer-header path — no API change needed).
 *
 *   Endpoint:    GET /wp-json/rop/v1/native-auth-callback
 *   Permission:  public route (registered with __return_true) — the
 *                handler checks is_user_logged_in() and bounces to
 *                wp-login.php when the partner isn't authenticated.
 *   Destination: hard-coded to https://bible.remnantofpromise.org/auth-
 *                callback. No destination is read from query params; the
 *                endpoint cannot be weaponized as an open-redirect.
 *
 *   Response paths (all are 302 redirects, no JSON body):
 *     - not logged in     → wp-login.php?redirect_to=<this endpoint URL>
 *     - JWT mint failed   → /auth-callback?error=mint_failed
 *     - success           → /auth-callback?token=<urlencoded JWT>
 */

if (!defined('ABSPATH')) {
    exit;
}

if (!defined('ROP_SSO_COOKIE_NAME')) {
    define('ROP_SSO_COOKIE_NAME', 'rop_jwt');
}
if (!defined('ROP_SSO_COOKIE_DOMAIN')) {
    define('ROP_SSO_COOKIE_DOMAIN', '.remnantofpromise.org');
}
if (!defined('ROP_SSO_COOKIE_LIFETIME')) {
    // Seven days. Matches "remember me" + a small buffer. The
    // partner re-authenticates against WP once a week to refresh
    // tier state. Adjustable by re-defining the constant in
    // wp-config.php BEFORE this plugin loads.
    define('ROP_SSO_COOKIE_LIFETIME', 7 * 24 * 60 * 60);
}
if (!defined('ROP_SSO_NATIVE_CALLBACK_NAMESPACE')) {
    // REST namespace for the native-auth-callback endpoint. Matches
    // the bible-companion sibling plugin's namespace so all Remnant
    // of Promise WP routes share the rop/v1 prefix.
    define('ROP_SSO_NATIVE_CALLBACK_NAMESPACE', 'rop/v1');
}
if (!defined('ROP_SSO_NATIVE_CALLBACK_ROUTE')) {
    define('ROP_SSO_NATIVE_CALLBACK_ROUTE', '/native-auth-callback');
}
if (!defined('ROP_SSO_NATIVE_CALLBACK_DESTINATION')) {
    // Hard-coded destination — the native shell intercepts this URL
    // via the AndroidManifest App Link intent-filter for /auth-callback.
    // NEVER read this from a query param; doing so opens an open-
    // redirect surface. Adjustable in wp-config.php only.
    define(
        'ROP_SSO_NATIVE_CALLBACK_DESTINATION',
        'https://bible.remnantofpromise.org/auth-callback'
    );
}

/**
 * Base64url-encode a binary string (RFC 7515 §2 / §C). Standard
 * base64 → strip padding `=` → swap `+`/`/` for `-`/`_`. No
 * dependencies; works on every PHP 7+ build.
 */
function rop_sso_base64url_encode($data) {
    return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
}

/**
 * Build an HS256 JWT for the given WP_User.
 *
 * Returns the encoded token string on success, or null if the
 * shared secret isn't configured. Anything else that goes wrong
 * (json_encode failure, hash_hmac failure) returns null too —
 * caller is expected to log + bail on null.
 */
function rop_sso_generate_jwt($user) {
    if (!($user instanceof WP_User)) {
        return null;
    }

    if (!defined('JWT_AUTH_SECRET_KEY') || empty(JWT_AUTH_SECRET_KEY)) {
        error_log('[rop-sso-bridge] JWT_AUTH_SECRET_KEY not defined; cannot mint cookie.');
        return null;
    }

    $secret = JWT_AUTH_SECRET_KEY;
    $now    = time();
    $exp    = $now + ROP_SSO_COOKIE_LIFETIME;

    $partner_tier = get_user_meta($user->ID, 'rop_partner_tier', true);
    if (!is_string($partner_tier) || $partner_tier === '') {
        $partner_tier = 'free';
    }

    $payload = [
        'iss'  => home_url(),
        'iat'  => $now,
        'nbf'  => $now,
        'exp'  => $exp,
        'data' => [
            'user' => [
                'id'           => (string) $user->ID,
                'login'        => (string) $user->user_login,
                'display_name' => (string) $user->display_name,
                'partner_tier' => $partner_tier,
            ],
        ],
    ];

    $header = ['typ' => 'JWT', 'alg' => 'HS256'];

    $b64_header  = rop_sso_base64url_encode(wp_json_encode($header));
    $b64_payload = rop_sso_base64url_encode(wp_json_encode($payload));
    if (!$b64_header || !$b64_payload) {
        error_log('[rop-sso-bridge] JSON encode failed; cannot mint cookie.');
        return null;
    }

    $signing_input = $b64_header . '.' . $b64_payload;
    $signature     = hash_hmac('sha256', $signing_input, $secret, true);
    $b64_signature = rop_sso_base64url_encode($signature);

    return $signing_input . '.' . $b64_signature;
}

/**
 * Set the rop_jwt cookie cross-subdomain on a successful WP login.
 *
 * Hooked to wp_login. WP fires this hook AFTER the user's WP auth
 * cookies are set + before any redirect, so output hasn't started
 * yet and setcookie() can still send Set-Cookie headers cleanly.
 *
 * @param string  $user_login The logged-in username (unused; we
 *                            read identity off the WP_User object).
 * @param WP_User $user       The WP_User object for the just-logged-
 *                            in user.
 */
function rop_sso_set_cookie_on_login($user_login, $user) {
    $token = rop_sso_generate_jwt($user);
    if ($token === null) {
        return;
    }

    $set = setcookie(ROP_SSO_COOKIE_NAME, $token, [
        'expires'  => time() + ROP_SSO_COOKIE_LIFETIME,
        'path'     => '/',
        'domain'   => ROP_SSO_COOKIE_DOMAIN,
        'secure'   => true,
        'httponly' => false,
        'samesite' => 'Lax',
    ]);

    if (!$set) {
        error_log(sprintf(
            '[rop-sso-bridge] setcookie() returned false for user_id=%d; cookie may not have been set.',
            (int) $user->ID
        ));
    }
}
add_action('wp_login', 'rop_sso_set_cookie_on_login', 10, 2);

/**
 * Clear the rop_jwt cookie cross-subdomain on logout.
 *
 * Hooked to wp_logout. Sends a Set-Cookie with empty value + a
 * past-dated expires so the browser drops the cookie immediately.
 * Must specify the same domain + path as the original set call,
 * otherwise the browser treats it as a different cookie and the
 * stale one survives.
 */
function rop_sso_clear_cookie_on_logout() {
    setcookie(ROP_SSO_COOKIE_NAME, '', [
        'expires'  => time() - 3600,
        'path'     => '/',
        'domain'   => ROP_SSO_COOKIE_DOMAIN,
        'secure'   => true,
        'httponly' => false,
        'samesite' => 'Lax',
    ]);
}
add_action('wp_logout', 'rop_sso_clear_cookie_on_logout');

/**
 * Optional: also refresh the cookie when an already-logged-in user
 * hits any admin page. This catches the case where the cookie
 * expired (7 days) but the WP auth cookie didn't (14 days with
 * Remember Me) — without this, the partner stays signed in to WP
 * but loses bible-app access until the next explicit login. Light
 * touch: only fires on admin_init, which runs once per admin page
 * load, not on every front-end request.
 *
 * Only re-issues if the cookie is missing entirely. Does NOT
 * refresh-while-still-valid (that would burn entropy on every page
 * load for no benefit).
 */
function rop_sso_refresh_cookie_in_admin() {
    if (!is_user_logged_in()) {
        return;
    }
    if (isset($_COOKIE[ROP_SSO_COOKIE_NAME]) && !empty($_COOKIE[ROP_SSO_COOKIE_NAME])) {
        return;
    }
    if (headers_sent()) {
        return; // can't set a cookie if the page has already started streaming
    }
    $user = wp_get_current_user();
    if (!($user instanceof WP_User) || empty($user->ID)) {
        return;
    }
    $token = rop_sso_generate_jwt($user);
    if ($token === null) {
        return;
    }
    setcookie(ROP_SSO_COOKIE_NAME, $token, [
        'expires'  => time() + ROP_SSO_COOKIE_LIFETIME,
        'path'     => '/',
        'domain'   => ROP_SSO_COOKIE_DOMAIN,
        'secure'   => true,
        'httponly' => false,
        'samesite' => 'Lax',
    ]);
}
add_action('admin_init', 'rop_sso_refresh_cookie_in_admin');

// ---------------------------------------------------------------------------
// S176 — Native auth callback endpoint
// ---------------------------------------------------------------------------
//
// GET /wp-json/rop/v1/native-auth-callback
//
// The cookie path above can't bridge into the Capacitor native shell
// (cross-origin: cookie is .remnantofpromise.org; webview is
// https://localhost). This endpoint closes that gap by minting the
// same JWT and delivering it through an Android App Link redirect to
// bible.remnantofpromise.org/auth-callback?token=<JWT>. The native
// app's AndroidManifest intent-filter for /auth-callback catches the
// URL and hands the token to the deep-link router.
//
// See the file-header comment block for the full flow description.

/**
 * Register the native-auth-callback REST route. Idempotent —
 * registered once per request via the rest_api_init hook below.
 */
function rop_sso_register_native_callback_route() {
    register_rest_route(
        ROP_SSO_NATIVE_CALLBACK_NAMESPACE,
        ROP_SSO_NATIVE_CALLBACK_ROUTE,
        [
            'methods'             => 'GET',
            'callback'            => 'rop_sso_handle_native_callback',
            // Public route — auth is checked inside the handler via
            // is_user_logged_in(). A not-logged-in caller is bounced
            // to wp-login.php and returns here after authentication.
            'permission_callback' => '__return_true',
        ]
    );
}
add_action('rest_api_init', 'rop_sso_register_native_callback_route');

/**
 * Build the callback destination URL with a status query param.
 *
 * Always emits the ROP_SSO_NATIVE_CALLBACK_DESTINATION base — the
 * destination is hard-coded so this endpoint cannot be weaponized as
 * an open-redirect. The status param is one of:
 *
 *   token=<urlencoded JWT>  on successful mint
 *   error=mint_failed       when rop_sso_generate_jwt() returns null
 *
 * The native side reads the URL via @capacitor/app's appUrlOpen
 * listener, parses the query, and either stores the token via
 * Capacitor Preferences (success) or surfaces a sign-in-failed
 * message (error).
 */
function rop_sso_build_native_callback_url($query_args) {
    $base = ROP_SSO_NATIVE_CALLBACK_DESTINATION;
    if (!is_array($query_args) || empty($query_args)) {
        return $base;
    }
    return $base . '?' . http_build_query($query_args);
}

/**
 * Handle GET /wp-json/rop/v1/native-auth-callback.
 *
 * Flow:
 *   1. If the caller isn't logged in, redirect to wp-login.php with
 *      redirect_to= pointing back here. The partner authenticates,
 *      WP redirects them back, and this handler re-enters with a
 *      logged-in session.
 *   2. Mint the JWT using the same rop_sso_generate_jwt() helper the
 *      cookie path uses. Same shape, same signing, same partner_tier
 *      resolution — so the API treats the resulting Bearer header
 *      identically to the rop_jwt cookie.
 *   3. If the mint fails (JWT_AUTH_SECRET_KEY unset, JSON encode
 *      error), redirect to /auth-callback?error=mint_failed so the
 *      native side surfaces a graceful failure rather than hanging.
 *   4. On success, redirect to /auth-callback?token=<urlencoded JWT>.
 *      The Android App Link intent-filter intercepts that URL and
 *      hands the token to the native deep-link router.
 *
 * Calls exit() after each redirect to halt PHP execution — the WP
 * REST stack would otherwise try to JSON-encode the (intentionally
 * absent) return value and emit a confused response body.
 */
function rop_sso_handle_native_callback(WP_REST_Request $request) {
    // The URL the partner returns to after wp-login.php finishes.
    $self_url = rest_url(
        ROP_SSO_NATIVE_CALLBACK_NAMESPACE . ROP_SSO_NATIVE_CALLBACK_ROUTE
    );

    // REST context cookie-auth fix (v1.1.1). WordPress's REST stack
    // rejects cookie-only auth unless a nonce is presented, so
    // is_user_logged_in() returns false here even when the partner
    // holds a valid WP auth cookie. This endpoint is a browser-
    // initiated redirect flow with no JS layer to mint a nonce, so we
    // validate the logged-in cookie directly and bootstrap the user
    // into REST context if it's valid. If no valid cookie, fall
    // through to the wp-login redirect path.
    if (!is_user_logged_in()) {
        $cookie_user_id = wp_validate_auth_cookie('', 'logged_in');
        if ($cookie_user_id) {
            wp_set_current_user($cookie_user_id);
        }
    }

    if (!is_user_logged_in()) {
        wp_safe_redirect(wp_login_url($self_url));
        exit;
    }

    $user = wp_get_current_user();
    if (!($user instanceof WP_User) || empty($user->ID)) {
        // Defensive: is_user_logged_in() returned true but the user
        // object came back empty. Surface as mint_failed rather than
        // crashing.
        wp_redirect(rop_sso_build_native_callback_url([
            'error' => 'mint_failed',
        ]));
        exit;
    }

    $token = rop_sso_generate_jwt($user);
    if ($token === null) {
        error_log(sprintf(
            '[rop-sso-bridge] native-auth-callback mint failed for user_id=%d',
            (int) $user->ID
        ));
        wp_redirect(rop_sso_build_native_callback_url([
            'error' => 'mint_failed',
        ]));
        exit;
    }

    wp_redirect(rop_sso_build_native_callback_url([
        'token' => $token,
    ]));
    exit;
}
