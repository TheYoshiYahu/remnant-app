<?php
/**
 * Plugin Name: Remnant of Promise — SSO Cookie Bridge
 * Plugin URI:  https://remnantofpromise.org/
 * Description: Sets the rop_jwt cross-subdomain cookie on WordPress login,
 *              clears it on logout. Bridges WordPress sessions into the
 *              bible-app (bible.remnantofpromise.org) JWT auth path.
 *              Self-contained — uses native PHP hash_hmac, reads
 *              JWT_AUTH_SECRET_KEY from wp-config.php, reads
 *              rop_partner_tier from user-meta (written by the
 *              Session 37 Stripe webhook → WP-sync push).
 * Version:     1.0.0
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
