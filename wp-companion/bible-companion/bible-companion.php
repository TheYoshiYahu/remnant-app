<?php
/**
 * Plugin Name: Remnant of Promise — Bible Companion
 * Plugin URI:  https://remnantofpromise.org/
 * Description: Exposes POST /wp-json/rop/v1/partner-tier with HMAC
 *              X-ROP-Signature auth. The bible-app API (Render) calls
 *              this endpoint when a Stripe webhook lands so the
 *              partner's rop_partner_tier user-meta on WordPress stays
 *              in sync without an admin Application Password sitting
 *              in Render env vars. Companion to rop-sso-bridge — that
 *              plugin reads the user-meta when minting JWTs; this
 *              plugin writes it. The shared HMAC secret is set on the
 *              Settings → Bible Companion admin page.
 * Version:     1.1.0
 * Author:      Yoshi
 * License:     GPL-2.0-or-later
 * Text Domain: bible-companion
 */

/*
 * --- Why this plugin exists ---
 *
 * Session 37 wired Stripe → WP partner_tier sync via the WordPress
 * REST API's stock /wp/v2/users/{id} endpoint, authenticated with an
 * admin Application Password sitting in Render env vars
 * (WP_API_USER + WP_API_APP_PASSWORD). That worked, but it carries
 * three problems:
 *
 *   (1) Application Passwords grant broad admin scope. The Render
 *       service only needs to write one user-meta key; admin-scope is
 *       overprivileged for the job.
 *
 *   (2) If Render's env-var storage is ever compromised, the
 *       Application Password gives blast-radius access to every
 *       endpoint /wp/v2/* exposes — way beyond partner_tier.
 *
 *   (3) Application Passwords are user-scoped — they belong to a
 *       specific admin user. If that user is deleted or their
 *       credentials rotate, the sync breaks until a fresh password
 *       is regenerated and re-pasted on Render.
 *
 * This plugin closes the gap. The API and the plugin share one
 * HMAC secret. The API signs each sync request; the plugin verifies.
 * The secret writes only one user-meta key — no other surface area
 * exposed.
 *
 * --- Where the secret lives ---
 *
 * Two equivalent sources, checked in this order:
 *
 *   (1) The ROP_COMPANION_SECRET constant, if defined in
 *       wp-config.php. Advanced operators who prefer a file-based
 *       secret can define it there and it always wins.
 *
 *   (2) Otherwise, the rop_companion_secret WordPress option, set
 *       on the Settings → Bible Companion admin page. This is the
 *       default path — no server-file editing, paste-and-save in
 *       the dashboard.
 *
 * Whichever is in effect, the SAME string must be pasted into
 * Render's WP_COMPANION_SECRET env var so the API signs with the
 * key the plugin verifies against.
 *
 * --- Wire shape (must match api/subscriptions.py::_sync_partner_tier_to_wp) ---
 *
 *   POST /wp-json/rop/v1/partner-tier
 *
 *   Headers (required):
 *     Content-Type: application/json
 *     X-ROP-Timestamp: <unix seconds>           (replay-window guard)
 *     X-ROP-Signature: <hex-encoded HMAC-SHA256>
 *
 *   Body (JSON):
 *     {
 *       "wp_user_id":   <int, > 0>,
 *       "partner_tier": "<free|study_notes|extras|complete_study|everything>"
 *     }
 *
 *   Signature input (signed with the shared secret as key):
 *     "<timestamp>.<raw_body_bytes>"
 *
 *   Tolerance window: ±300 seconds (5 minutes) drift between API and WP
 *   clocks. Stripe uses the same tolerance for their webhook signatures;
 *   matches the operator-side mental model.
 *
 *   Response shapes:
 *     200 OK     {"ok": true,  "wp_user_id": <int>, "partner_tier": "<tier>"}
 *     400        {"ok": false, "error": "<reason>"}    missing fields / bad shape
 *     401        {"ok": false, "error": "<reason>"}    bad signature / stale timestamp
 *     404        {"ok": false, "error": "user not found"}
 *     422        {"ok": false, "error": "<reason>"}    unknown partner_tier value
 *     500        {"ok": false, "error": "<reason>"}    secret unset / update failed
 *
 *   Error strings are neutral REST-API language only. No theology
 *   adjacent. Voice-gated at write-time against the 12 Red Lines.
 *
 * --- Install ---
 *
 *   (1) Zip the parent folder, upload via WP admin →
 *       Plugins → Add New → Upload Plugin → Activate.
 *   (2) Go to Settings → Bible Companion. Paste the shared HMAC
 *       secret into the field and Save.
 *   (3) Paste the SAME string into Render's WP_COMPANION_SECRET
 *       env var (remnant-app-api → Environment).
 *
 * No wp-config.php editing required.
 *
 * --- Dependencies ---
 *
 *   - WordPress 5.0+ (REST API, register_rest_route, Settings API)
 *   - PHP 7.3+       (hash_equals, hash_hmac)
 *
 * --- Failure modes (all log + return JSON error, none break WP) ---
 *
 *   - Secret unset (no constant, no option) → log, return 500 with a
 *     neutral message
 *   - Signature mismatch → 401, log the timestamp for forensics but
 *     never log either signature value
 *   - Body too large (> 8KB) → 400, refuse before parsing JSON
 */

if (!defined('ABSPATH')) {
    exit;
}

if (!defined('ROP_COMPANION_NAMESPACE')) {
    define('ROP_COMPANION_NAMESPACE', 'rop/v1');
}
if (!defined('ROP_COMPANION_ROUTE')) {
    define('ROP_COMPANION_ROUTE', '/partner-tier');
}
if (!defined('ROP_COMPANION_OPTION_KEY')) {
    define('ROP_COMPANION_OPTION_KEY', 'rop_companion_secret');
}
if (!defined('ROP_COMPANION_TIMESTAMP_TOLERANCE')) {
    // Seconds of clock drift allowed between API and WP. Matches
    // Stripe's default webhook tolerance. Adjustable by re-defining
    // the constant in wp-config.php BEFORE this plugin loads.
    define('ROP_COMPANION_TIMESTAMP_TOLERANCE', 300);
}
if (!defined('ROP_COMPANION_MAX_BODY_BYTES')) {
    // Soft cap on request body size. The actual body is two small
    // JSON fields (an int + a short string) — well under 100 bytes
    // typically. 8 KB is a paranoid ceiling.
    define('ROP_COMPANION_MAX_BODY_BYTES', 8192);
}

/**
 * Resolve the shared HMAC secret.
 *
 * Precedence: the ROP_COMPANION_SECRET constant (wp-config.php) wins
 * if defined and non-empty; otherwise the rop_companion_secret option
 * set on the Settings → Bible Companion page. Returns '' when neither
 * is configured — callers treat '' as "not configured" and bail.
 */
function rop_companion_get_secret() {
    if (defined('ROP_COMPANION_SECRET') && !empty(ROP_COMPANION_SECRET)) {
        return (string) ROP_COMPANION_SECRET;
    }
    $stored = get_option(ROP_COMPANION_OPTION_KEY, '');
    return is_string($stored) ? $stored : '';
}

/**
 * Whitelist of partner_tier values accepted by the endpoint. Must
 * match api/auth.py::PartnerTier and api/subscriptions.py's tier
 * resolution. Any value outside this set is rejected with 422.
 */
function rop_companion_valid_tiers() {
    return ['free', 'study_notes', 'extras', 'complete_study', 'everything'];
}

// ---------------------------------------------------------------------------
// Admin settings page — Settings → Bible Companion
// ---------------------------------------------------------------------------

/**
 * Register the options-page entry under the Settings menu.
 */
function rop_companion_add_settings_page() {
    add_options_page(
        'Bible Companion',          // page <title>
        'Bible Companion',          // Settings submenu label
        'manage_options',           // capability
        'bible-companion',          // menu slug
        'rop_companion_render_settings_page'
    );
}
add_action('admin_menu', 'rop_companion_add_settings_page');

/**
 * Register the secret as a WordPress setting so the Settings API
 * handles the nonce + capability check on save.
 */
function rop_companion_register_setting() {
    register_setting(
        'rop_companion_settings_group',
        ROP_COMPANION_OPTION_KEY,
        [
            'type'              => 'string',
            'sanitize_callback' => 'rop_companion_sanitize_secret',
            'default'           => '',
        ]
    );
}
add_action('admin_init', 'rop_companion_register_setting');

/**
 * Sanitize the submitted secret.
 *
 * Trims whitespace. If the submitted value is blank, keep whatever is
 * already stored — the settings form always renders the field empty
 * (a saved secret is never echoed back into the page HTML), so a
 * blank submission means "no change", not "clear it". To actually
 * clear the secret, an operator deletes the rop_companion_secret
 * option directly — a deliberate, not-accidental action.
 */
function rop_companion_sanitize_secret($value) {
    $value = is_string($value) ? trim($value) : '';
    if ($value === '') {
        $existing = get_option(ROP_COMPANION_OPTION_KEY, '');
        return is_string($existing) ? $existing : '';
    }
    return $value;
}

/**
 * Render the Settings → Bible Companion page.
 *
 * The saved secret is NEVER printed back into the page — the field
 * renders empty, with a status line telling the operator whether a
 * secret is currently in effect and which source it came from.
 */
function rop_companion_render_settings_page() {
    if (!current_user_can('manage_options')) {
        return;
    }

    $constant_in_use = defined('ROP_COMPANION_SECRET') && !empty(ROP_COMPANION_SECRET);
    $option_value    = get_option(ROP_COMPANION_OPTION_KEY, '');
    $option_set      = is_string($option_value) && $option_value !== '';
    $secret_active   = rop_companion_get_secret() !== '';

    echo '<div class="wrap">';
    echo '<h1>Bible Companion</h1>';
    echo '<p>Shared HMAC secret for the partner-tier sync endpoint '
       . '(<code>POST /wp-json/rop/v1/partner-tier</code>). Paste the '
       . 'same string that is set in the bible-app API\'s '
       . '<code>WP_COMPANION_SECRET</code> environment variable.</p>';

    // Status line.
    echo '<p><strong>Status:</strong> ';
    if ($constant_in_use) {
        echo 'A secret is active, supplied by the '
           . '<code>ROP_COMPANION_SECRET</code> constant in '
           . 'wp-config.php. The field below is ignored while the '
           . 'constant is defined.';
    } elseif ($option_set) {
        echo 'A secret is saved and active. The field below renders '
           . 'empty for safety — leave it blank to keep the current '
           . 'secret, or paste a new value to replace it.';
    } else {
        echo 'No secret is configured yet. The sync endpoint will '
           . 'reject every request until one is saved.';
    }
    echo '</p>';

    echo '<form method="post" action="options.php">';
    settings_fields('rop_companion_settings_group');

    echo '<table class="form-table" role="presentation"><tbody><tr>';
    echo '<th scope="row"><label for="rop_companion_secret_field">'
       . 'Shared secret</label></th>';
    echo '<td>';
    printf(
        '<input type="password" id="rop_companion_secret_field" '
        . 'name="%s" value="" class="regular-text" autocomplete="off" '
        . '%s />',
        esc_attr(ROP_COMPANION_OPTION_KEY),
        $constant_in_use ? 'disabled' : ''
    );
    echo '<p class="description">A long random string — a 64-character '
       . 'hex value is ideal. Stored in the WordPress options table, '
       . 'scoped to this plugin only.</p>';
    echo '</td></tr></tbody></table>';

    if (!$constant_in_use) {
        submit_button('Save secret');
    }

    echo '</form>';
    echo '</div>';
}

// ---------------------------------------------------------------------------
// REST endpoint — POST /wp-json/rop/v1/partner-tier
// ---------------------------------------------------------------------------

/**
 * Register the REST route on rest_api_init. WP's REST stack calls
 * this once per request lifecycle; the registration is idempotent.
 */
function rop_companion_register_routes() {
    register_rest_route(ROP_COMPANION_NAMESPACE, ROP_COMPANION_ROUTE, [
        'methods'             => 'POST',
        'callback'            => 'rop_companion_handle_partner_tier',
        'permission_callback' => '__return_true', // auth done inside the callback via HMAC
    ]);
}
add_action('rest_api_init', 'rop_companion_register_routes');

/**
 * Build a normalized JSON error response. Keeps the shape consistent
 * across every failure path so the caller can parse one schema.
 */
function rop_companion_error($status, $reason) {
    return new WP_REST_Response(['ok' => false, 'error' => $reason], $status);
}

/**
 * Constant-time HMAC verification. Wraps hash_equals so callers don't
 * accidentally use === (which short-circuits and leaks timing info).
 */
function rop_companion_verify_signature($expected_hex, $provided_hex) {
    if (!is_string($expected_hex) || !is_string($provided_hex)) {
        return false;
    }
    if (strlen($expected_hex) !== strlen($provided_hex)) {
        return false;
    }
    return hash_equals($expected_hex, $provided_hex);
}

/**
 * Handle POST /wp-json/rop/v1/partner-tier.
 *
 * Verification order (fail fast on each):
 *   1. shared secret configured → else 500
 *   2. X-ROP-Timestamp header present and parseable → else 400
 *   3. X-ROP-Signature header present → else 400
 *   4. Body within size cap → else 400
 *   5. Timestamp within tolerance window → else 401
 *   6. Signature matches HMAC-SHA256("<ts>.<body>", secret) → else 401
 *   7. Body parses as JSON object with wp_user_id (int > 0) and
 *      partner_tier (string in whitelist) → else 400 / 422
 *   8. User exists → else 404
 *   9. update_user_meta succeeds → else 500
 *
 * On full success: 200 with the canonical row shape.
 */
function rop_companion_handle_partner_tier(WP_REST_Request $request) {
    $secret = rop_companion_get_secret();
    if ($secret === '') {
        error_log('[bible-companion] shared secret not configured; cannot verify request.');
        return rop_companion_error(500, 'server not configured');
    }

    $timestamp_raw = $request->get_header('x_rop_timestamp');
    if ($timestamp_raw === null || $timestamp_raw === '') {
        return rop_companion_error(400, 'missing X-ROP-Timestamp header');
    }
    if (!ctype_digit($timestamp_raw)) {
        return rop_companion_error(400, 'X-ROP-Timestamp must be unix seconds');
    }
    $timestamp = (int) $timestamp_raw;

    $signature_provided = $request->get_header('x_rop_signature');
    if ($signature_provided === null || $signature_provided === '') {
        return rop_companion_error(400, 'missing X-ROP-Signature header');
    }

    $body = $request->get_body();
    if (!is_string($body)) {
        $body = '';
    }
    if (strlen($body) > ROP_COMPANION_MAX_BODY_BYTES) {
        return rop_companion_error(400, 'request body too large');
    }

    $now = time();
    if (abs($now - $timestamp) > ROP_COMPANION_TIMESTAMP_TOLERANCE) {
        return rop_companion_error(401, 'timestamp outside tolerance window');
    }

    $signing_input = $timestamp_raw . '.' . $body;
    $expected = hash_hmac('sha256', $signing_input, $secret);
    if (!rop_companion_verify_signature($expected, $signature_provided)) {
        // Forensic note: log timestamp (already verified fresh) but
        // never log either signature value.
        error_log(sprintf(
            '[bible-companion] signature mismatch at ts=%d body_len=%d',
            $timestamp, strlen($body)
        ));
        return rop_companion_error(401, 'invalid signature');
    }

    $payload = json_decode($body, true);
    if (!is_array($payload)) {
        return rop_companion_error(400, 'body must be a JSON object');
    }

    if (!array_key_exists('wp_user_id', $payload)) {
        return rop_companion_error(400, 'missing wp_user_id');
    }
    if (!array_key_exists('partner_tier', $payload)) {
        return rop_companion_error(400, 'missing partner_tier');
    }

    $wp_user_id_raw = $payload['wp_user_id'];
    if (!is_int($wp_user_id_raw) || $wp_user_id_raw <= 0) {
        return rop_companion_error(400, 'wp_user_id must be a positive integer');
    }
    $wp_user_id = (int) $wp_user_id_raw;

    $partner_tier = $payload['partner_tier'];
    if (!is_string($partner_tier) || !in_array($partner_tier, rop_companion_valid_tiers(), true)) {
        return rop_companion_error(422, 'unknown partner_tier value');
    }

    $user = get_userdata($wp_user_id);
    if (!($user instanceof WP_User)) {
        return rop_companion_error(404, 'user not found');
    }

    $updated = update_user_meta($wp_user_id, 'rop_partner_tier', $partner_tier);
    // update_user_meta returns:
    //   - meta_id (int) on first insert
    //   - true on update of an existing value
    //   - false when the value is unchanged OR on actual failure
    // We treat "unchanged" as success — the row already carries the
    // requested tier, so the caller's intent is satisfied. To
    // distinguish unchanged-vs-failed cleanly, re-read and compare.
    if ($updated === false) {
        $current = get_user_meta($wp_user_id, 'rop_partner_tier', true);
        if ($current !== $partner_tier) {
            error_log(sprintf(
                '[bible-companion] update_user_meta failed wp_user_id=%d tier=%s current=%s',
                $wp_user_id, $partner_tier, var_export($current, true)
            ));
            return rop_companion_error(500, 'update_user_meta failed');
        }
    }

    return new WP_REST_Response([
        'ok'           => true,
        'wp_user_id'   => $wp_user_id,
        'partner_tier' => $partner_tier,
    ], 200);
}
