# Remnant of Promise Official Study Bible — API

Phase 4 wheel #2 (FastAPI skeleton). Read-only HTTP surface over the
Postgres data schema landed in wheel #1 (`../data-schema/schema.sql`).
Auth, billing, and write surfaces land in subsequent Phase 4 wheels —
this one stays focused on books, chapters, verses, and trigram search.

## Layout

```
api/
├── main.py            FastAPI app + routes
├── models.py          Pydantic v2 response models
├── db.py              asyncpg pool lifecycle
├── config.py          Settings (DATABASE_URL, parsed_json_dir, etc.)
├── seed.py            Loads the four parsed Restored Names JSONs
├── requirements.txt   Pinned dependency versions
├── .env.example       Template — copy to .env and edit
└── README.md          This file
```

## Prerequisites

- Python 3.11+
- A running Postgres 14+ instance (the schema uses `pgcrypto` and
  `pg_trgm` extensions; both ship with stock Postgres)
- The four parsed Restored Names JSONs at
  `../source-texts/parsed/{apocrypha,enoch,jasher,jubilees}.json`

## First-time bring-up

```bash
cd ~/Desktop/App/api

# 1. Install dependencies (consider a venv).
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# 2. Configure.
cp .env.example .env
# Edit .env so DATABASE_URL points at your local Postgres.

# 3. Create the database, apply the schema, seed the four extras editions.
createdb remnant_app
python seed.py --bootstrap

# 4. Run the API.
uvicorn main:app --reload
# OpenAPI / Swagger UI: http://localhost:8000/docs
# Health probe:        http://localhost:8000/v1/health
```

The `--bootstrap` flow drops and recreates `public`, runs
`../data-schema/schema.sql` end-to-end (20 tables, 7 enums, 25 indexes,
the `tier_satisfies` helper, the schema version stamp), then loads all
four parsed editions. Idempotent: re-running `--bootstrap` rebuilds
from scratch every time. Never run it against prod.

## Reseeding without rebuilding the schema

After editing one of the parsed JSONs (say, after a pipeline rerun):

```bash
python seed.py --seed-only
```

That cascade-deletes the affected edition's books / chapters / verses
and reloads them. Subscriptions, users, study notes, and other
user-data tables are never touched.

A `--dry-run` mode parses the JSONs and prints the counts without
touching the DB — useful for confirming a rebuild is going to land what
you expect:

```bash
python seed.py --dry-run
```

## Route surface

All routes mounted under `/v1`. OpenAPI is at `/docs` (Swagger) or
`/redoc` (ReDoc). The current surface:

| Method | Path                                            | Purpose                             |
| ------ | ----------------------------------------------- | ----------------------------------- |
| GET    | `/v1/health`                                    | Liveness + DB reachability          |
| GET    | `/v1/books`                                     | List books (filterable by witness)  |
| GET    | `/v1/books/{book_slug}`                         | One book + chapter count            |
| GET    | `/v1/books/{book_slug}/chapters`                | Chapter list (with verse counts)    |
| GET    | `/v1/books/{book_slug}/chapters/{n}`            | One chapter — full verse list       |
| GET    | `/v1/verses/search?q=...&limit=25`              | Trigram search across all verses    |

Every response model lives in `models.py` and mirrors the schema column
names so a Postgres row maps cleanly via `model_validate(dict)`.

### Tier filter — Phase 4 placeholder

`/v1/books` is documented in the roadmap as "list books filtered by
tier." SSO-with-WordPress is a later Phase 4 wheel, so for this wheel
the handler returns the **free-tier-and-extras superset** — i.e. every
book currently in the schema. When the SSO wheel lands, the same
handler will read the user's effective tier off the WordPress JWT and
apply `tier_satisfies(user_tier, b.tier_required)` as the access gate.
The response shape will not change; only the row count will.

### Search

`/v1/verses/search?q=` rides the `idx_verses_text_trgm` gin index from
the schema. Behavior:

- `q` must be at least 2 characters.
- Matches use both `%` (trigram similarity above the default threshold)
  and case-insensitive substring (so very short queries don't fall off
  the trigram threshold).
- Hits are ordered by `pg_trgm.similarity()` descending, then by
  canonical book order. Limit defaults to 25, max 200.

## Verifying without a Postgres instance

For a sanity check that this skeleton is wired correctly without
spinning up Postgres:

```bash
# Dry-run the seed flow (no DB touched):
python seed.py --dry-run

# Confirm the FastAPI module imports clean:
python -c "import main; print(main.app.title, main.app.version)"
```

Both should succeed in any environment with the requirements installed.
A real `uvicorn main:app --reload` requires `DATABASE_URL` to point at a
seeded Postgres.

## Sacred names — what the API does and doesn't do

The verse text returned by `/v1/books/.../chapters/{n}` and the search
endpoint is **already restored** by the Phase 3 deterministic pipeline
(`../restoration-pipeline/restore.py`). The API does **not** re-restore
on the way out — the contract is *what the schema holds is what the API
serves.* Voice-skill compliance is verified once, at ingest, not
repeatedly per request.

Any future commentary, study-notes, or concept text written through the
API will pass the voice gate at write time, not read time, for the same
reason.

## What's NOT here yet (subsequent Phase 4 wheels)

- Hosting + DNS pointing `bible.remnantofpromise.org` at the app
- PWA shell + basic Genesis reader (consumes this API)
- Single sign-on (WordPress as IdP — JWT verification middleware,
  `users` row creation on first auth)
- Stripe test purchase tier (subscription create / webhook handler /
  founder-pricing counter claim)

Each lands as its own wheel. Roadmap of record:
`../BIBLE_APP_ROADMAP.md` (Section V Phase 4, Section X session log).
