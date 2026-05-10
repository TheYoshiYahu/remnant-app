# Hosting Decision — The Remnant of Promise Official Study Bible

**Wheel:** Phase 4 wheel #3.
**Status:** Landed 2026-05-10 (Session 11).
**Decision:** **Render** for both the FastAPI service and managed Postgres.
**Domain target:** `bible.remnantofpromise.org` (DNS pointing is the next wheel — Phase 4 wheel #4).
**Reviewer-of-record:** Yoshi at session close.

---

## The decision in one paragraph

We host on **Render**. The FastAPI skeleton at `~/Desktop/App/api/` deploys as a Render Web Service from a Dockerfile at `~/Desktop/App/api/Dockerfile`. The Phase-4 schema runs on Render Postgres, with `pgcrypto` and `pg_trgm` enabled at bootstrap. Custom domain `bible.remnantofpromise.org` lands as a CNAME pointing at Render's edge, with TLS provisioned automatically by Let's Encrypt. The whole picture is described in `~/Desktop/App/hosting/render.yaml` so the infrastructure travels in version control alongside the code. Monthly cost at launch tier sits at **$13/month** ($7 web + $6 Postgres), with both tiers independently scalable when partner volume justifies it.

---

## The four candidates, scored against the criteria

The Section XI handoff prompt named four serious candidates and four hard requirements. Here's how they scored.

| | **Fly.io** | **Render** | **Railway** | **DO App Platform** |
|---|---|---|---|---|
| FastAPI / uvicorn | ✓ Dockerfile | ✓ Dockerfile or native Python | ✓ Dockerfile or nixpacks | ✓ Dockerfile or buildpacks |
| Managed Postgres + `pgcrypto` + `pg_trgm` | ✓ MPG Basic | ✓ Render Postgres | ✓ Railway Postgres | ✓ DO Managed Postgres |
| Custom-domain CNAME + auto-SSL | ✓ free Let's Encrypt | ✓ free Let's Encrypt | ✓ auto SSL | ✓ free auto-HTTPS |
| Web compute entry | ~$2/mo (`shared-cpu-1x`, 256MB) | **$7/mo** (Starter) | $5/mo Hobby base + usage | $5/mo (Basic XXS) |
| Postgres entry | **$38/mo** (MPG Basic, 1GB) | **$6/mo** (Basic-256mb) | ~$0.55–$15/mo (usage) | **$15/mo** (Basic) |
| **Entry total / month** | **~$40** | **$13** | **$5 + variable usage** | **$20** |
| Pricing model | Per-resource flat (compute) + flat tier (MPG) | Flat-rate, predictable | Hybrid: subscription + metered | Flat per resource |
| Deploy mechanism | Dockerfile via `flyctl deploy` | Dockerfile / native / `render.yaml` | Dockerfile / nixpacks | GitHub / Dockerfile / buildpacks |
| Backups | MPG includes daily + PITR | Daily auto + PITR on paid | Daily | Daily |
| Preview environments per PR | Manual (separate apps) | ✓ built-in (Pro workspace) | ✓ ephemeral envs | ✓ preview deploys |
| Infrastructure-as-code | `fly.toml` | `render.yaml` blueprint | service config UI / json | `app.yaml` |
| Single-region deploy → multi-region | First-class (Fly's actual selling point) | Available on higher tiers | Single-region | Multi-region available |

The matrix lines up cleanly. Three of the four hard requirements are met by every candidate. The fourth — partner-budget posture — is what splits them.

---

## Why Render wins

**Cheapest predictable entry.** $13/month total puts the API and Postgres on a partner-funded budget the assembly can absorb without ceremony. Fly.io's Managed Postgres at $38/month for the smallest tier is a non-starter — the MPG Basic alone costs more than Render's whole stack. DO App Platform at $20/month entry is fine but pays $9/month more for no gain over Render's Postgres tier at this scale.

**Predictable, not metered.** Yoshi's funding model is partner subscriptions at fixed monthly amounts. The host's pricing model should mirror that. Render's flat-rate pricing — $7 for the web service, $6 for the Postgres tier — gives the assembly a number it can budget against. Railway's hybrid metered model would force a "what did the bill look like this month" question every month, and a busy launch week could bump the bill without warning. Predictable beats slightly cheaper at scale on day one.

**Dockerfile is portable.** Render supports Dockerfile builds first-class, which means the same image we deploy to Render will deploy unchanged to Fly.io, DO App Platform, Railway, or any other Docker-aware host if we ever need to move. The `render.yaml` blueprint adds Render-specific orchestration (build / start commands, env wiring, Postgres reference) but it sits on top of a host-agnostic Dockerfile. We are not getting locked in.

**`render.yaml` blueprint is real infrastructure-as-code.** The whole stack — web service, Postgres database, environment variables, health-check endpoint, build and start commands — lives in one YAML file in version control. A future operator can reproduce the production environment from the file without click-tour through a dashboard. This matches the engineering posture of the rest of the project (deterministic restoration pipeline, schema in `schema.sql`, parsed JSONs as immutable artifacts).

**Preview environments per pull request.** Render Pro workspaces auto-spin a preview environment for every PR, complete with its own ephemeral Postgres clone. That gives us a free staging path: every PR is its own stage. Until partner volume justifies the Pro tier, we can stand up a second `bible-api-staging` Web Service plus a second `remnant-app-staging` Postgres on the Hobby tier — two separate render.yaml entries, total $13/month for staging on top of $13/month for production = $26/month for prod + staging. That's the budget posture Yoshi can carry.

**Postgres extensions are first-class.** `pg_trgm` and `pgcrypto` are both supported on Render Postgres for any database created or maintained after April 2024, enabled with a one-line `CREATE EXTENSION IF NOT EXISTS` per extension. The Phase-4 schema's GIN index on `verses.text` (using `pg_trgm`) and `pgcrypto`'s `gen_random_uuid()` calls (the schema uses UUID primary keys throughout) both work without ceremony.

**Daily backups + PITR.** All paid Render Postgres instances get automatic daily backups, and point-in-time recovery is available on every paid tier. We don't have to roll our own backup story.

**The honest trade-off.** Render's web service tiers cap at 0.5 CPU and 512MB on the $7 Starter — that's enough for the Genesis-reader-MVP API today, but the moment we light up the Statement-of-Faith doorway, the framework commentary, and a few hundred concurrent partners, we'll bump to Standard ($25/mo, 1 CPU, 2GB) or Pro ($85/mo, 2 CPU, 4GB). Fly.io's per-resource billing scales more elegantly at high CPU/memory, but the Postgres premium overwhelms the compute savings until the API is big enough that Postgres at $38/mo stops looking expensive. By the time we cross that line, we'll have partner revenue and we can revisit. **Today's wheel is the launch tier; it doesn't have to be the forever tier.**

---

## Monthly cost picture

**Launch (today):**
- Render Web Service, Starter — $7/mo (0.5 CPU, 512MB, always-on)
- Render Postgres, Basic-256mb — $6/mo (256MB RAM, 1GB storage included)
- Custom domain `bible.remnantofpromise.org` — $0 (free, included)
- TLS via Let's Encrypt — $0 (free, auto-provisioned + auto-renewed)
- Daily backups — $0 (included)
- **Total: $13/month for production.**

**Add staging (when SSO + Stripe wheels need a stage):**
- Second Web Service, Starter — $7/mo
- Second Postgres, Basic-256mb — $6/mo
- **Staging total: $13/month → combined $26/month for prod + staging.**

**Reasonable scale-up checkpoints:**
- Web service to Standard — $25/mo (1 CPU, 2GB) when CPU regularly above 80% on Starter.
- Postgres to Basic-1gb — $19/mo (1GB RAM) when query latency degrades or storage approaches the 1GB included on Basic-256mb.
- Bandwidth: 100GB/mo included; overage at $30/100GB. The verse text payloads are small (~12,000 verses × ~200 bytes typical = ~2.4MB total uncompressed), so even aggressive PWA polling won't approach 100GB until we have substantial partner volume.

The partner-budget posture: the launch tier sits well under what one $14.99/mo Everything-tier partner contributes per month. The first partner pays the entire infrastructure bill with money left over. That's the right ratio for a partner-funded model.

---

## Deploy mechanism

**Source of truth: Dockerfile + `render.yaml` blueprint, both in version control.**

The Dockerfile at `~/Desktop/App/api/Dockerfile` builds a slim Python 3.12 image, installs `requirements.txt`, copies the API code, and starts uvicorn on the port Render injects via `$PORT`. The image is host-agnostic — it runs identically on Fly.io / Railway / DO if we ever migrate.

The blueprint at `~/Desktop/App/hosting/render.yaml` describes:
- The Web Service: name, region, plan (Starter), Dockerfile path, health-check endpoint (`/v1/health`), env vars (CORS_ORIGINS, DATABASE_URL bound from the Postgres service via Render's `fromDatabase` reference).
- The Postgres database: name, region, plan (Basic-256mb), database name, user.

Initial deploy flow (one-time, from Yoshi's laptop):
1. `cd ~/Desktop/App && git init && git remote add origin <github-repo-url> && git push` (the repo doesn't exist yet — Yoshi creates it when ready; this is the next wheel's territory).
2. In Render dashboard: "New → Blueprint" → point at the GitHub repo → Render reads `hosting/render.yaml`, provisions both services, wires the `DATABASE_URL` reference automatically.
3. First deploy builds the image and brings up the web service. Health check at `/v1/health` will fail initially because the schema isn't loaded.
4. **Bootstrap the database** (one-time, from laptop): `cd ~/Desktop/App/api && DATABASE_URL=<render-postgres-external-url> python seed.py --bootstrap`. This drops `public`, applies `schema.sql`, and seeds the four parsed Restored Names JSONs (4 editions / 17 books / 436 chapters / 12,019 verses).
5. Health check turns green; verse routes start serving.

**Reseed flow** (when extras editions get republished or pipeline rules change):
- From laptop: `DATABASE_URL=<render-postgres-external-url> python seed.py --seed-only`. Cascade-deletes the four extras editions and reloads them. Never touches user data (study notes, reading positions, subscriptions, founder pricing counter).

**Subsequent deploys:** any push to the connected branch triggers a Docker build and rolling deploy on Render. Zero-downtime is included; failed health checks roll back automatically.

---

## Staging path

Phase 4 wheels #5 (SSO with WordPress as IdP) and #6 (Stripe test purchase tier) need an environment that is not production but exercises the full stack. The plan:

**Phase 4 wheels #4 (DNS) through #6 (Stripe):** stand up a second `render.yaml`-described environment using the same blueprint pattern but distinct service names and a distinct domain. Either:
- (a) Create `hosting/render.staging.yaml` cloning prod with `bible-api-staging` and `remnant-app-staging` services, and bind a staging subdomain like `staging.bible.remnantofpromise.org` to the staging web service; or
- (b) Upgrade to Render Pro and use the built-in PR preview environments — every pull request gets its own ephemeral stack with its own domain on `*.onrender.com`.

Either path works. (a) is the cheaper option at $26/mo total (prod + persistent staging). (b) is the cleaner option once partner volume justifies the Pro tier, because every PR becomes its own stage automatically — no manual stage maintenance.

**Today's wheel doesn't pick between (a) and (b).** The hosting decision is the wheel; the staging-specific decision lives at Phase 4 wheels #5–#6 when SSO and Stripe actually need a stage. For Phase 4 wheel #4 (DNS) the production environment is what gets pointed at `bible.remnantofpromise.org`.

---

## What this wheel doesn't do

This wheel is the **decision and the configuration files.** It is not the actual deploy. The actual first-deploy walks the steps above (push to GitHub, click "New → Blueprint" in the Render dashboard, run `seed.py --bootstrap` once against the production Postgres) and that work belongs to a subsequent wheel — most likely Phase 4 wheel #4 (DNS pointing) where the deployed URL becomes the target of the CNAME.

Phase 4 wheel #4 picks up at: deploy production from this blueprint, point `bible.remnantofpromise.org` at the Render web service, confirm the TLS cert provisions, confirm `/v1/health` returns green over HTTPS at the custom domain.

---

## Reviewing this decision later

The decision is **revisitable but not lightly.** Triggers that would justify revisiting:

- **Postgres compute exceeds the cost-equivalent line.** When monthly Postgres cost on Render passes Fly.io's $38/mo MPG Basic, Fly.io becomes cheaper Postgres-side; it's still more expensive on compute, but the gap closes. The check happens at the next infrastructure review, not in the middle of partner-volume work.
- **Region reach matters.** Render is single-region per service (multi-region available on higher tiers). When meaningful partner volume sits outside North America, Fly.io's first-class multi-region story becomes more valuable. We're not there yet.
- **Bandwidth overage routinely.** If we cross 100GB/mo regularly the metered overage at $30/100GB starts adding up. The PWA's verse-payload sizes are small enough that this is unlikely before serious partner scale.

Until any of these trip, Render is the decision and the configuration in `render.yaml` is the operational truth.

---

## Files this wheel landed

- `~/Desktop/App/hosting/HOSTING_DECISION.md` — this document.
- `~/Desktop/App/hosting/render.yaml` — Render blueprint describing the production web service + Postgres.
- `~/Desktop/App/api/Dockerfile` — host-agnostic Docker image for the FastAPI service.
- `~/Desktop/App/api/.dockerignore` — keeps build context small (excludes parsed JSONs, reference text, __pycache__).
