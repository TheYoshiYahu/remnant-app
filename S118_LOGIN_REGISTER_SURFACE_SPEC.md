# S118 — Combined Log In / Create Account Surface — WP Spec + Diagnostic

The spec for the single WP page (`/account`) that handles both signing in existing partners AND creating new accounts. Replaces the broken `/login` 404 and closes the no-create-account-path gap. One destination for both the new landing page's account-note CTA AND the Pricing.tsx anonymous-checkout redirect.

---

## Part 1 — Diagnose what's serving the `/login` 404

Before building anything new, find out what state the existing WP login is in. Run through this checklist in WP admin:

### Step 1.1 — Check active plugins for login-URL movers

WP admin → Plugins → Installed Plugins. Look specifically for any of:

- **WPS Hide Login** — most common culprit; moves the login slug to a configurable URL (might be `/secret-login`, `/portal`, anything)
- **iThemes Security** / **Solid Security** — has a "Hide Backend" feature that moves `/wp-admin` and `/wp-login.php` to custom slugs
- **Theme My Login** — provides custom login/register pages at user-defined slugs
- **WP Members** / **Ultimate Member** / **MemberPress** — membership plugins that often override the default login
- **WordFence** / **Sucuri** — security plugins that sometimes lock down the default login URL

If any of these are active, that plugin owns the login URL. Check its settings page for the actual configured login slug.

### Step 1.2 — Try the WP default

Open in browser: `https://remnantofpromise.org/wp-login.php`

- **If it works** — WP's default login still serves. The `/login` 404 is just because no page or redirect was ever set up at the `/login` slug. Simple fix: create a `/login` page (or a redirect from `/login` → wherever the actual login is).
- **If it 404s or redirects somewhere unexpected** — a security plugin has hidden the default. Check Step 1.1 plugins more carefully.

### Step 1.3 — Check for existing custom login pages

WP admin → Pages → All Pages. Search for `login`, `account`, `sign-in`, `register`. If any exist:

- Note their slugs and what content they carry.
- Decide whether to reuse one of them (rename / restructure) or build fresh at `/account`.

### Step 1.4 — Confirm JWT plugin is intact

WP admin → Plugins → Installed Plugins. Verify **JWT Authentication for WP REST API** is active. This is the plugin that sets the `rop_jwt` cookie at `Domain=.remnantofpromise.org` per S114's auth.py contract. If it's deactivated, the SSO bridge to the Bible app breaks regardless of what login surface ships.

Settings check: WP admin → Settings → JWT Authentication. Confirm `JWT_AUTH_CORS_ENABLE = true` and the secret key is set. The cookie domain config must be `.remnantofpromise.org` (with leading dot) so the cookie is readable from both `remnantofpromise.org` AND `bible.remnantofpromise.org`.

### Diagnostic report-back

After running 1.1 → 1.4, name back to me:

- Which (if any) of the listed plugins are active.
- What URL `/wp-login.php` resolves to.
- Whether a custom login page already exists.
- Whether JWT plugin is intact + correctly configured.

That tells us whether to **fix forward** (rebuild the existing surface) or **build fresh** at `/account`. The spec below assumes build-fresh-at-`/account` because that's the cleaner path; if you'd rather fix forward, the same content/UX requirements apply, just at whatever URL is decided.

---

## Part 2 — Spec the combined `/account` surface

### URL + page metadata

| Field | Value |
|---|---|
| URL slug | `/account` |
| Page title | `Log In / Create Account` |
| Menu placement | NOT in primary nav (this is a destination, not a navigation target) |
| Featured image | None |
| Accessible from | (a) Read the R.O.P. Official Study Bible landing page → account-note CTA; (b) Pricing.tsx anonymous-checkout redirect; (c) any other "Sign in" or "Create account" link added later |

### Page structure

**Hero / title:**

H1: `Log In / Create Account`

Subtitle (small paragraph): `One account for everything — your bookmarks, notes, highlights, and subscription all travel with you across devices.`

**Two-column form layout (collapses to stacked on mobile):**

**Left column — Log In:**

```
H2: Log In

[Email field]
[Password field]
[Forgot password?] (small link)

[Button: Log In] (primary fill)
```

**Right column — Create Account:**

```
H2: Create Account

[Email field]
[Password field]
[Confirm password field]

[Button: Create Account] (primary fill, same style as Log In)

(Small note below) By creating an account you agree to the Terms of Service and Privacy Policy.
```

On mobile, the columns stack — Log In on top, Create Account below. Both with the same width.

### Redirect-back contract

Both the Log In button and the Create Account button must honor a `?redirect=` query parameter:

1. Partner arrives at `https://remnantofpromise.org/account?redirect=https://bible.remnantofpromise.org/john/1` (or any other URL).
2. Partner completes Log In or Create Account.
3. Server-side: set the `rop_jwt` cookie at `Domain=.remnantofpromise.org`, `Path=/`, `Secure`, `HttpOnly` (per the JWT plugin's existing behavior).
4. After successful auth, `302` redirect to the URL in the `?redirect=` param.
5. If no `?redirect=` param is present, default redirect → `/read-the-scriptures` (the landing page — so a partner who creates an account via direct navigation lands on the natural next page).
6. **Validation:** only allow `?redirect=` URLs whose host is `remnantofpromise.org` or `bible.remnantofpromise.org`. Reject (or strip) any other host to prevent open-redirect attacks.

### Error states

**Log In errors:**

- Wrong email/password → display `Email or password doesn't match.` below the form (don't disclose which one is wrong — standard security practice).
- Account not found → same `Email or password doesn't match.` (same reason).
- Generic server error → `Something went wrong. Please try again.`

**Create Account errors:**

- Email already in use → `An account already exists for this email. Try logging in instead.` (with the "logging in" word linked to the left column or a scroll-to-top action).
- Passwords don't match → `Passwords don't match.` below the Confirm Password field.
- Email format invalid → `Please enter a valid email address.`
- Password too short / weak → `Password must be at least 8 characters.` (or whatever the WP password policy is — match it exactly).
- Generic server error → `Something went wrong. Please try again.`

### Success states

- **Log In success:** redirect immediately per the redirect-back contract above; no interstitial.
- **Create Account success — email verification required (Yoshi's S118 lock):** show interstitial `Check your email — we sent a verification link to {email}. Click the link to activate your account.` Partner clicks the link, lands back on `/account` with a `?verified=1` param + a success banner `Account verified! Please log in.` and uses the Log In form. The verified-account is now subject to the redirect-back contract on its first successful login.

**Critical dependency: email deliverability MUST be fixed first.** The existing WP email-verification setup delivers ~1 hour after signup (confirmed by Yoshi at S118). A partner who creates an account, waits an hour, and never comes back is functionally identical to the `/login` 404 we're closing — same business-blocker. **Do not ship the `/account` create-account flow with the current email-delivery setup.** Part 4 of this spec is the deliverability fix; it must land before the create-account surface goes live. Once email delivery is sub-60-second, the verification flow becomes acceptable UX (partner creates account, switches to inbox tab, verification email arrives during the tab-switch, click-link-and-return is one continuous motion rather than a session-killing wait).

### Implementation paths (Yoshi's WP-admin call)

Three workable paths to build this:

**Path A — Theme My Login plugin (recommended).** Installs cleanly, configures combined login + register pages at any slug, handles redirect-back, integrates with the existing WP user system, plays nicely with the JWT plugin. Minimal custom code. Install → configure the slugs → style with custom CSS to match the rest of the site → done.

**Path B — Custom WP page with form blocks.** Build the `/account` page using WP's Gutenberg block editor. Add custom HTML blocks for the Log In and Create Account forms with form `action` pointing to `wp-login.php` (login) and `wp-login.php?action=register` (registration). Most control over styling; more work to wire up.

**Path C — Membership plugin (MemberPress / WP Members).** Heavier-weight but handles login + registration + subscription tier management + a partner profile page all in one. Probably overkill if the only goal is closing this gap, but worth considering if other partner-profile features are coming soon.

**My recommendation: Path A.** Theme My Login is the lowest-friction match for what's specifically being asked here (combined surface, redirect-back, integration with existing WP user system + JWT). Path B is the fallback if Theme My Login conflicts with anything currently installed.

### Visual + style notes

- **Inherit the WP theme.** Same buttons, same typography, same color tokens as the rest of the site. Don't introduce a separate visual register for this surface.
- **Match the landing page's Log In / Create Account button color.** The CTA on the landing page's account-note card should visually match the form buttons on this page — same fill color, same hover state. Cross-surface affordance unity.
- **Dark register inherits automatically.** Same as the landing page — the website is dark-by-default with no off-ramp.

---

## Part 3 — Pricing.tsx redirect dependency (Task #4)

Once `/account` lands and serves the combined surface, the Pricing.tsx anonymous-checkout flow needs its redirect target updated from `/login` to `/account`. The update is small (one or two lines in `app/src/routes/Pricing.tsx` ~line 136) but it MUST land in the same release window — partners who click a tier today get bounced to `/login`, hit the 404, and bail. The instant `/account` is live, the Pricing.tsx update goes out.

The redirect URL format Pricing.tsx already constructs:

```
https://remnantofpromise.org/account?redirect={current PWA URL}
```

This is what the `/account` page's redirect-back contract needs to honor.

---

## Part 4 — Email deliverability fix (Task #6)

The existing WP email-verification setup delivers verification emails ~1 hour after signup. That's session-killing — partner never comes back. **Fix this before the `/account` create-account flow goes live.**

### Why the current setup is slow

WordPress's default email path is the PHP `mail()` function, which routes through the host's MTA (mail transfer agent). On most shared and managed-WP hosts (SiteGround, Bluehost, GoDaddy, WP Engine, etc.), the host MTA queues `mail()`-sent messages for batched outbound delivery to avoid spam-flag reputation damage from their IP ranges. Common patterns:

- Hourly batched flush — emails go out at the top of each hour regardless of when WP sent them.
- Recipient-side spam holding — Gmail, Outlook, and Yahoo often quarantine `mail()`-sent messages from shared hosting IPs for 15-60 minutes before delivering to the inbox (or routing to spam).
- Rate-limited paths — hosts cap how many `mail()` calls per hour can flow through their MTA before queueing the rest.

Any of these (often all of them stacked) easily produce the ~1 hour delivery Yoshi is seeing.

### Fix — route WP email through a transactional email provider

The standard fix for any WordPress site that sends transactional email (verification, password reset, order confirmation, subscription notification) is to bypass the host MTA entirely and send through a proper transactional email service via SMTP or API.

### Step 4.1 — Install WP Mail SMTP plugin

WP admin → Plugins → Add New → search `WP Mail SMTP` → install + activate. This is the most-installed transactional-email plugin for WordPress (millions of active installs); battle-tested, no surprises.

### Step 4.2 — Pick a transport provider

Three viable paths, ordered by friction:

**Path A — Google Workspace SMTP (lowest friction if Yoshi already has a Google Workspace account).** If `info@remnantofpromise.org` is hosted on Google Workspace (the domain's email goes through Gmail), WP Mail SMTP can authenticate via Google's SMTP server. No new accounts to create; no separate billing. Daily send limit is 2,000 emails/day per workspace account — plenty for transactional volume. Setup: WP Mail SMTP → Settings → Mailer → Google → connect via Google OAuth → done. Delivery is near-instant.

**Path B — SendGrid free tier (recommended if no Google Workspace).** Free tier covers 100 emails/day permanently. Plenty for a starting partner base; upgradable when volume grows. Setup: sign up at sendgrid.com → verify the sending domain (DNS records for SPF + DKIM, takes ~30min for DNS propagation) → generate an API key → paste into WP Mail SMTP. Delivery is near-instant, deliverability is excellent.

**Path C — Brevo (formerly Sendinblue) free tier.** 300 emails/day free. Setup similar to SendGrid. Use if SendGrid free tier ever hits its 100/day cap before the partner base supports paid Postmark/SendGrid.

**My recommendation: Path A if Yoshi has Google Workspace, otherwise Path B (SendGrid).**

### Step 4.3 — Configure From: address

WP Mail SMTP → Settings → General. Set the From: name and email:

- From Email: `info@remnantofpromise.org` (or `noreply@remnantofpromise.org` if Yoshi prefers a no-reply identity — both work)
- From Name: `Remnant of Promise` or `R.O.P. Study Bible`
- Force From Email: ON (overrides any plugin trying to send from a different address)
- Force From Name: ON (same reason)

### Step 4.4 — Test delivery

WP Mail SMTP → Tools → Email Test → enter a test recipient (Yoshi's personal address, NOT info@remnantofpromise.org since some setups quarantine same-domain test sends) → send → confirm arrival within 60 seconds.

If the test arrives within 60 seconds: ship it.
If the test takes longer than 60 seconds or doesn't arrive: check spam folder, verify DNS records (SPF/DKIM) for the sending domain, check WP Mail SMTP → Logs for delivery status.

### Step 4.5 — Add SPF + DKIM DNS records (Path B/C only — Path A inherits Google's)

If using SendGrid or Brevo: their setup wizards generate the exact DNS records to add to `remnantofpromise.org`'s DNS provider (Cloudflare in our case). The records authenticate the sending service to send on the domain's behalf, dramatically improving deliverability (and eliminating spam-folder routing at Gmail/Outlook/Yahoo). Add them via Cloudflare DNS dashboard → wait ~30min for propagation → re-run the email test.

### Verification metric

After the fix lands: create a test account on `/account`, switch to inbox tab, verify the verification email arrives within 60 seconds. That's the bar. If hit, ship the create-account flow.

---

## Part 5 — Verification (Task #5)

End-to-end SSO journey to walk after the WP work lands:

1. **Anonymous-partner from the landing page:**
   - Open `https://remnantofpromise.org/read-the-scriptures` in an incognito window.
   - Click `Log In / Create Account` in the account-note card.
   - Land on `/account`.
   - Create a new test account (use a throwaway email).
   - Verify redirect lands on `/read-the-scriptures` (no `?redirect=` was set, so default applies).
   - Verify the WP admin → Users page shows the new partner.

2. **Anonymous-partner from Pricing.tsx:**
   - Open the PWA at `https://bible.remnantofpromise.org/pricing` in an incognito window.
   - Click any tier's Subscribe button.
   - Verify the redirect lands on `https://remnantofpromise.org/account?redirect=https://bible.remnantofpromise.org/pricing` (or whatever the current URL is).
   - Log in with the test account from step 1.
   - Verify the redirect bounces back to `https://bible.remnantofpromise.org/pricing`.
   - Verify the PWA chrome shows the partner as signed in (Subscription CTA changes from "Become a partner" to either "Manage" or "Resubscribe" depending on subscription state).

3. **JWT cookie correctness:**
   - In Chrome DevTools → Application → Cookies → `.remnantofpromise.org`.
   - Confirm a `rop_jwt` cookie exists, scoped to the parent domain, with `Secure` + `HttpOnly` flags set.
   - Open a fresh tab to `https://bible.remnantofpromise.org` (no redirect) — partner should already be signed in (cookie is read directly).

4. **API tier resolution:**
   - In the PWA while signed in, open DevTools → Network → look at any authenticated API call (e.g., `GET /v1/highlights`).
   - Verify the `Authorization: Bearer ...` header is present.
   - Verify the API returns the expected partner tier (free for a new test account; whatever's in the DB for an existing account).
   - Confirms S114's DB-wins-over-JWT path is still operating correctly.

---

## Coordination summary

**This wheel ships in three coordinated artifacts:**

1. **Yoshi (WP admin):** diagnose login-URL state (Part 1), build `/account` combined surface (Part 2), build `/read-the-scriptures` landing page per separate spec.
2. **Yoshi (WP admin):** add the menu item for `Read the R.O.P. Official Study Bible` pointing to `/read-the-scriptures`.
3. **Me (PWA code):** update Pricing.tsx redirect target from `/login` to `/account` (Task #4); push + Render deploy.

**Verification** (Task #5) runs after all three land.

The auth.py DB-wins-over-JWT path from S114 means tier resolution is correct regardless of WP user-meta drift — no additional API work needed for this wheel.
