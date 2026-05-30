// S173 (display-prefs cross-device sync) sanity test for the pure
// helpers in:
//
//   app/src/lib/display-prefs-sync.ts
//   api/main.py                            (GET/PUT /v1/me/display-prefs
//                                           payload shape contract)
//
// Inlines JS ports of the pure helpers — the TS module pulls in
// `lib/api.ts` (which reads `import.meta.env` for VITE_API_BASE and
// won't parse under bare Node) so the port mirrors the localStorage
// read / write / reconcile logic 1:1 against a mock storage + cookie +
// window. Any divergence is a bug.
//
// Boundary cases (per S173 spec / S172_SACRED_NAME_MASK_SPEC
// reconciliation rule):
//
//   readLocalSnapshot
//     - all keys absent → all-null snapshot
//     - sacred_name_mask "yahuah" / "yhwh" parsed cleanly
//     - sacred_name_mask garbage value → null (defensive)
//     - hide_parentheticals "true" → true; "false" → false; other → null
//
//   writeLocalSnapshot — server-wins reconciliation
//     - server null + local set    → no write, no event (server has
//                                     no opinion; localStorage stays)
//     - server set + local absent  → write to localStorage + event
//     - server set + local same    → no write, no event (idempotent)
//     - server set + local differs → server wins; write + event
//     - both-null snapshot         → no write, no event
//     - changed=false return on no-op
//     - changed=true  return on any write
//
//   hasJwtCookie
//     - no cookie at all                       → false
//     - rop_jwt=token                          → true
//     - rop_jwt=  (cleared / empty)            → false
//     - other_cookie=val; rop_jwt=token        → true (multi-cookie)
//     - other_cookie=val                       → false
//
//   PUT payload shape (api/main.py whole-object replace)
//     - exclude_none semantics: null keys are dropped from the JSON
//       written to the JSONB column (sparse storage)
//     - body with one key sent → server stores {key: value} only
//     - body with all-null     → server stores {} (empty JSONB)
//     - subsequent PUT with different key replaces (not merges) the
//       prior state — the partner's client always holds the canonical
//       full state and re-sends it on every change
//
// Run with: node _s173_display_prefs_sanity.mjs

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic — must mirror display-prefs-sync.ts 1:1
// ─────────────────────────────────────────────────────────────────────

const KEY_SACRED_NAME_MASK = "rop_sacred_name_mask_v1";
const KEY_HIDE_PARENTHETICALS = "rop_hide_parentheticals_v1";
const SSO_COOKIE_NAME = "rop_jwt";
const DISPLAY_PREFS_CHANGED_EVENT = "rop:display-prefs-changed";

// Mock window + localStorage + document.cookie
function makeMockEnv() {
  const store = new Map();
  const events = [];
  return {
    store,
    events,
    cookie: "",
    localStorage: {
      getItem: (k) => (store.has(k) ? store.get(k) : null),
      setItem: (k, v) => { store.set(k, String(v)); },
      removeItem: (k) => { store.delete(k); },
    },
    dispatchEvent(e) { events.push(e); return true; },
  };
}

function hasJwtCookie(env) {
  const prefix = `${SSO_COOKIE_NAME}=`;
  const parts = env.cookie ? env.cookie.split("; ") : [];
  for (const part of parts) {
    if (part.startsWith(prefix)) {
      return part.slice(prefix.length).length > 0;
    }
  }
  return false;
}

function readLocalSnapshot(env) {
  const maskRaw = env.localStorage.getItem(KEY_SACRED_NAME_MASK);
  const sacred_name_mask =
    maskRaw === "yahuah" || maskRaw === "yhwh" ? maskRaw : null;

  const parensRaw = env.localStorage.getItem(KEY_HIDE_PARENTHETICALS);
  const hide_parentheticals =
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

function writeLocalSnapshot(env, prefs) {
  let changed = false;

  if (prefs.sacred_name_mask !== null) {
    const current = env.localStorage.getItem(KEY_SACRED_NAME_MASK);
    if (current !== prefs.sacred_name_mask) {
      env.localStorage.setItem(KEY_SACRED_NAME_MASK, prefs.sacred_name_mask);
      changed = true;
    }
  }

  if (prefs.hide_parentheticals !== null) {
    const next = String(prefs.hide_parentheticals);
    const current = env.localStorage.getItem(KEY_HIDE_PARENTHETICALS);
    if (current !== next) {
      env.localStorage.setItem(KEY_HIDE_PARENTHETICALS, next);
      changed = true;
    }
  }

  if (changed) {
    env.dispatchEvent({ type: DISPLAY_PREFS_CHANGED_EVENT });
  }

  return changed;
}

// Server-side PUT semantics (api/main.py upsert_display_prefs):
// model_dump(exclude_none=True) → server stores only set keys.
function buildPutPayload(snapshot) {
  const out = {};
  for (const [k, v] of Object.entries(snapshot)) {
    if (v !== null && v !== undefined) out[k] = v;
  }
  return out;
}

// ─────────────────────────────────────────────────────────────────────
// Sanity-test rig
// ─────────────────────────────────────────────────────────────────────

let passed = 0;
let failed = 0;
const failures = [];

function ok(name, cond) {
  if (cond) passed += 1;
  else { failed += 1; failures.push(name); }
}

function eq(name, a, b) {
  ok(name, JSON.stringify(a) === JSON.stringify(b));
}

// ── readLocalSnapshot ─────────────────────────────────────────────

{
  const env = makeMockEnv();
  eq("absent localStorage → all-null snapshot",
    readLocalSnapshot(env),
    { sacred_name_mask: null, hide_parentheticals: null, theme: null,
      font_size: null, interlinear_default: null, tts_voice: null });
}

{
  const env = makeMockEnv();
  env.localStorage.setItem(KEY_SACRED_NAME_MASK, "yahuah");
  ok("local 'yahuah' parsed",
    readLocalSnapshot(env).sacred_name_mask === "yahuah");
}

{
  const env = makeMockEnv();
  env.localStorage.setItem(KEY_SACRED_NAME_MASK, "yhwh");
  ok("local 'yhwh' parsed",
    readLocalSnapshot(env).sacred_name_mask === "yhwh");
}

{
  const env = makeMockEnv();
  env.localStorage.setItem(KEY_SACRED_NAME_MASK, "garbage");
  ok("local garbage mask → null (defensive)",
    readLocalSnapshot(env).sacred_name_mask === null);
}

{
  const env = makeMockEnv();
  env.localStorage.setItem(KEY_HIDE_PARENTHETICALS, "true");
  ok("local parens 'true' parsed",
    readLocalSnapshot(env).hide_parentheticals === true);
}

{
  const env = makeMockEnv();
  env.localStorage.setItem(KEY_HIDE_PARENTHETICALS, "false");
  ok("local parens 'false' parsed",
    readLocalSnapshot(env).hide_parentheticals === false);
}

{
  const env = makeMockEnv();
  env.localStorage.setItem(KEY_HIDE_PARENTHETICALS, "TRUE");
  ok("local parens 'TRUE' (wrong case) → null",
    readLocalSnapshot(env).hide_parentheticals === null);
}

// ── writeLocalSnapshot — reconciliation matrix ────────────────────

// Case: server null + local set → no write, no event (server has no opinion)
{
  const env = makeMockEnv();
  env.localStorage.setItem(KEY_SACRED_NAME_MASK, "yhwh");
  const changed = writeLocalSnapshot(env, {
    sacred_name_mask: null, hide_parentheticals: null, theme: null,
    font_size: null, interlinear_default: null, tts_voice: null,
  });
  ok("server null + local set: no write",
    env.localStorage.getItem(KEY_SACRED_NAME_MASK) === "yhwh");
  ok("server null + local set: changed=false", changed === false);
  ok("server null + local set: no event", env.events.length === 0);
}

// Case: server set + local absent → write + event
{
  const env = makeMockEnv();
  const changed = writeLocalSnapshot(env, {
    sacred_name_mask: "yhwh", hide_parentheticals: null, theme: null,
    font_size: null, interlinear_default: null, tts_voice: null,
  });
  ok("server set + local absent: write applied",
    env.localStorage.getItem(KEY_SACRED_NAME_MASK) === "yhwh");
  ok("server set + local absent: changed=true", changed === true);
  ok("server set + local absent: event dispatched",
    env.events.length === 1 && env.events[0].type === DISPLAY_PREFS_CHANGED_EVENT);
}

// Case: server set + local same → no-op
{
  const env = makeMockEnv();
  env.localStorage.setItem(KEY_SACRED_NAME_MASK, "yhwh");
  const changed = writeLocalSnapshot(env, {
    sacred_name_mask: "yhwh", hide_parentheticals: null, theme: null,
    font_size: null, interlinear_default: null, tts_voice: null,
  });
  ok("server set + local same: no event (idempotent)", env.events.length === 0);
  ok("server set + local same: changed=false", changed === false);
}

// Case: server set + local differs → server wins
{
  const env = makeMockEnv();
  env.localStorage.setItem(KEY_SACRED_NAME_MASK, "yahuah");
  const changed = writeLocalSnapshot(env, {
    sacred_name_mask: "yhwh", hide_parentheticals: null, theme: null,
    font_size: null, interlinear_default: null, tts_voice: null,
  });
  ok("server set + local differs: server wins",
    env.localStorage.getItem(KEY_SACRED_NAME_MASK) === "yhwh");
  ok("server set + local differs: changed=true", changed === true);
  ok("server set + local differs: event dispatched", env.events.length === 1);
}

// Case: both-null snapshot → no-op no event
{
  const env = makeMockEnv();
  env.localStorage.setItem(KEY_SACRED_NAME_MASK, "yhwh");
  env.localStorage.setItem(KEY_HIDE_PARENTHETICALS, "true");
  const changed = writeLocalSnapshot(env, {
    sacred_name_mask: null, hide_parentheticals: null, theme: null,
    font_size: null, interlinear_default: null, tts_voice: null,
  });
  ok("both-null: no event", env.events.length === 0);
  ok("both-null: changed=false", changed === false);
  ok("both-null: existing local values untouched (mask)",
    env.localStorage.getItem(KEY_SACRED_NAME_MASK) === "yhwh");
  ok("both-null: existing local values untouched (parens)",
    env.localStorage.getItem(KEY_HIDE_PARENTHETICALS) === "true");
}

// Case: both keys set on server, both differ locally → both swap, one event
{
  const env = makeMockEnv();
  env.localStorage.setItem(KEY_SACRED_NAME_MASK, "yahuah");
  env.localStorage.setItem(KEY_HIDE_PARENTHETICALS, "false");
  const changed = writeLocalSnapshot(env, {
    sacred_name_mask: "yhwh", hide_parentheticals: true, theme: null,
    font_size: null, interlinear_default: null, tts_voice: null,
  });
  ok("both keys diverge: mask flipped",
    env.localStorage.getItem(KEY_SACRED_NAME_MASK) === "yhwh");
  ok("both keys diverge: parens flipped",
    env.localStorage.getItem(KEY_HIDE_PARENTHETICALS) === "true");
  ok("both keys diverge: changed=true", changed === true);
  ok("both keys diverge: ONE event for the batch", env.events.length === 1);
}

// Case: hide_parentheticals=false on server, local "true" → server wins (false)
{
  const env = makeMockEnv();
  env.localStorage.setItem(KEY_HIDE_PARENTHETICALS, "true");
  const changed = writeLocalSnapshot(env, {
    sacred_name_mask: null, hide_parentheticals: false, theme: null,
    font_size: null, interlinear_default: null, tts_voice: null,
  });
  ok("server parens=false + local true: server wins",
    env.localStorage.getItem(KEY_HIDE_PARENTHETICALS) === "false");
  ok("server parens=false + local true: changed=true", changed === true);
}

// ── hasJwtCookie ─────────────────────────────────────────────────

{
  const env = makeMockEnv();
  ok("no cookie → false", hasJwtCookie(env) === false);
}

{
  const env = makeMockEnv();
  env.cookie = "rop_jwt=abc.def.ghi";
  ok("rop_jwt with token → true", hasJwtCookie(env) === true);
}

{
  const env = makeMockEnv();
  env.cookie = "rop_jwt=";
  ok("rop_jwt empty → false", hasJwtCookie(env) === false);
}

{
  const env = makeMockEnv();
  env.cookie = "other=val; rop_jwt=token; another=val2";
  ok("multi-cookie containing rop_jwt → true", hasJwtCookie(env) === true);
}

{
  const env = makeMockEnv();
  env.cookie = "other=val; another=val2";
  ok("multi-cookie without rop_jwt → false", hasJwtCookie(env) === false);
}

{
  const env = makeMockEnv();
  env.cookie = "rop_jwt_other=token";
  ok("cookie with rop_jwt prefix but different name → false",
    hasJwtCookie(env) === false);
}

// ── PUT payload shape (api/main.py exclude_none semantics) ────────

eq("all-null snapshot → empty payload",
  buildPutPayload({
    sacred_name_mask: null, hide_parentheticals: null, theme: null,
    font_size: null, interlinear_default: null, tts_voice: null,
  }),
  {});

eq("mask only set → {sacred_name_mask}",
  buildPutPayload({
    sacred_name_mask: "yhwh", hide_parentheticals: null, theme: null,
    font_size: null, interlinear_default: null, tts_voice: null,
  }),
  { sacred_name_mask: "yhwh" });

eq("both set → {sacred_name_mask, hide_parentheticals}",
  buildPutPayload({
    sacred_name_mask: "yahuah", hide_parentheticals: true, theme: null,
    font_size: null, interlinear_default: null, tts_voice: null,
  }),
  { sacred_name_mask: "yahuah", hide_parentheticals: true });

ok("hide_parentheticals=false is preserved (not stripped as falsy)",
  buildPutPayload({
    sacred_name_mask: null, hide_parentheticals: false, theme: null,
    font_size: null, interlinear_default: null, tts_voice: null,
  }).hide_parentheticals === false);

// ── End-to-end multi-device scenario ──────────────────────────────
//
// Phone A: signed in, flips mask to yhwh. PUT carries the snapshot.
// Server stores {sacred_name_mask:"yhwh"}.
// Phone B: signed in fresh install. localStorage empty. pullAndReconcile
// fires GET → server returns {sacred_name_mask:"yhwh"}. writeLocalSnapshot
// writes "yhwh" into Phone B's localStorage and dispatches event so the
// React hook re-reads.

{
  // Simulate Phone A flipping mask
  const phoneA = makeMockEnv();
  phoneA.cookie = "rop_jwt=jwt-a";
  phoneA.localStorage.setItem(KEY_SACRED_NAME_MASK, "yhwh");
  const phoneA_payload = buildPutPayload(readLocalSnapshot(phoneA));
  eq("Phone A PUT payload after toggle",
    phoneA_payload, { sacred_name_mask: "yhwh" });

  // Server stores phoneA_payload as the canonical row
  const serverRow = { ...phoneA_payload, hide_parentheticals: null,
    theme: null, font_size: null, interlinear_default: null, tts_voice: null };

  // Phone B: empty localStorage, fetches server prefs
  const phoneB = makeMockEnv();
  phoneB.cookie = "rop_jwt=jwt-b"; // same partner, different device
  const changed = writeLocalSnapshot(phoneB, serverRow);
  ok("Phone B reconcile applies server mask",
    phoneB.localStorage.getItem(KEY_SACRED_NAME_MASK) === "yhwh");
  ok("Phone B reconcile: changed=true", changed === true);
  ok("Phone B reconcile: event dispatched", phoneB.events.length === 1);
}

// ── Report ────────────────────────────────────────────────────────

console.log(`\nS173 display-prefs sanity: ${passed} passed, ${failed} failed`);
if (failed > 0) {
  console.log("\nFailures:");
  for (const f of failures) console.log(`  - ${f}`);
  process.exit(1);
}
