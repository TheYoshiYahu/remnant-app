/**
 * Teachings.tsx — the Teachings tab. Lives at `/teachings` (list) and
 * `/teachings/<slug>` (detail). Top-level route in App.tsx's pathname switch,
 * alongside /calendar, /settings, /attributions.
 *
 * S353. A free-for-all hook: the LIST shows every teaching's TITLE to everyone,
 * and each DETAIL page shows the title + synopsis to everyone. The full body is
 * revealed behind a "Dive deeper" control ONLY when the reader's effective tier
 * owns the teaching's `tier_required` (canReadBody). When it doesn't, the reader
 * sees the reusable LockedPartnerPrompt — which, per the consumption-only
 * compliance posture, carries NO checkout or pricing link (informational only).
 *
 * S354. A teaching may end with an emphatic `closing` flourish (metallic accent)
 * and a `promo` book cover that links out to the PRINT edition. A printed book
 * is physical goods, which Apple/Google permit outbound purchase links for at
 * no commission — so the cover is a REAL clickable external link (openExternal),
 * distinct from the non-clickable digital-subscription lines.
 *
 * The first teaching ("The Seed of Promise and a Remnant") is tier_required =
 * "free", so every reader gets its full body, closing, and cover. The gate is
 * exercised all the same, ready for a future partner-gated teaching.
 *
 * Navigation matches the rest of the app: plain <a href> doorways (no client
 * router), so each move is a fresh App render that re-reads window.location.
 */

import { useEffect, useMemo, useState } from "react";
import {
  canReadBody,
  listTeachings,
  prettyTier,
  teachingBySlug,
  type Teaching,
  type TeachingClosing,
  type TeachingPromo,
} from "../lib/teachings/content";
import { renderTeachingBody } from "../lib/teachings/render";
import { renderItalicSpans } from "../lib/markdown";
import { openExternal } from "../lib/external-link";
import { loadStoredNativeToken } from "../lib/native-auth";
import LockedPartnerPrompt from "../components/LockedPartnerPrompt";
import {
  getSubscriptionMe,
  getTeachingBody,
  type PartnerTier,
  type SubscriptionStatus,
  type TeachingBodyResponse,
} from "../lib/api";

function currentSlug(): string {
  const path =
    typeof window !== "undefined" ? window.location.pathname : "/teachings";
  const m = /^\/teachings\/?(.*)$/.exec(path);
  return m ? m[1].replace(/\/+$/, "") : "";
}

export default function Teachings() {
  const slug = currentSlug();
  const teaching = slug ? teachingBySlug(slug) : undefined;
  if (slug && teaching) return <TeachingDetail teaching={teaching} />;
  if (slug) return <NotFound slug={slug} />;
  return <TeachingList />;
}

// ───────────────────────────────────────────────────────────────────────
// Page shell
// ───────────────────────────────────────────────────────────────────────

function Shell({ children }: { children: React.ReactNode }) {
  return (
    <div className="min-h-screen bg-[var(--reader-bg)] px-4 py-8 text-[var(--reader-text)]">
      <div className="mx-auto max-w-2xl">{children}</div>
    </div>
  );
}

// ───────────────────────────────────────────────────────────────────────
// List — every teaching TITLE, shown to everyone
// ───────────────────────────────────────────────────────────────────────

function TeachingList() {
  const teachings = useMemo(() => listTeachings(), []);
  return (
    <Shell>
      <a
        href="/today"
        className="text-sm text-[var(--reader-accent)] hover:underline"
      >
        ← Back to Today
      </a>
      <h1 className="mt-4 font-serif text-2xl font-semibold">Teachings</h1>
      <p className="mt-2 text-sm leading-relaxed text-[var(--reader-muted)]">
        The Word in arranged order. Every teaching is open to read here — the
        title and synopsis for everyone, with the full teaching a tap away.
      </p>

      <div className="mt-6 space-y-4">
        {teachings.map((t) => (
          <a
            key={t.slug}
            href={`/teachings/${t.slug}`}
            className="block rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 transition-colors hover:border-[var(--reader-accent)]"
          >
            <div className="flex items-baseline justify-between gap-3">
              <h2 className="font-serif text-base font-semibold text-[var(--reader-text)]">
                {t.title}
              </h2>
              <span className="shrink-0 rounded border border-[var(--reader-rule)] px-2 py-0.5 text-[11px] tracking-wide text-[var(--reader-muted)]">
                {t.tier_required === "free"
                  ? "Free"
                  : prettyTier(t.tier_required)}
              </span>
            </div>
            <p className="mt-1.5 text-sm leading-relaxed text-[var(--reader-muted)]">
              {firstLine(t.synopsis)}
            </p>
            <span className="mt-2 inline-block text-xs text-[var(--reader-accent)]">
              Read →
            </span>
          </a>
        ))}
      </div>
    </Shell>
  );
}

/** A short teaser: the first non-heading, non-empty line of the synopsis. */
function firstLine(md: string): string {
  const line = md
    .split("\n")
    .map((l) => l.trim())
    .find((l) => l && !l.startsWith("#") && !l.startsWith("*"));
  return line ?? "";
}

// ───────────────────────────────────────────────────────────────────────
// Detail — title + synopsis for everyone; body gated behind "Dive deeper"
// ───────────────────────────────────────────────────────────────────────

function TeachingDetail({ teaching }: { teaching: Teaching }) {
  // Resolve the reader's subscription so the gate can decide reveal vs locked.
  // Anonymous / no JWT / error → free entitlement (the safe default).
  const [tier, setTier] = useState<PartnerTier | null>(null);
  const [status, setStatus] = useState<SubscriptionStatus>("none");
  // current_period_end lets the gate honor a canceled-but-paid-through-period
  // partner (annual cancel of auto-renew keeps the tier until the year ends),
  // mirroring the server's _resolve_tier_from_db.
  const [periodEnd, setPeriodEnd] = useState<string | null>(null);
  const [meChecked, setMeChecked] = useState(false);
  const [revealed, setRevealed] = useState(false);

  // S421 — a teaching either ships its body INLINE (free teachings, e.g. Seed
  // of Promise) or serves it from the SERVER-GATED endpoint (paid teachings,
  // whose body is never in the client bundle — `teaching.body` is empty). When
  // the body isn't inline we fetch it on reveal, and only after entitlement is
  // confirmed both client-side (/me) and server-side (the endpoint re-checks
  // and withholds the body from any non-entitled caller). Inline teachings
  // never touch the network — Seed of Promise behaves exactly as before.
  const hasInlineBody = teaching.body.trim().length > 0;
  const [gatedBody, setGatedBody] = useState<TeachingBodyResponse | null>(null);
  const [gatedState, setGatedState] = useState<"idle" | "loading" | "error">(
    "idle",
  );

  useEffect(() => {
    let cancelled = false;
    // S178 pattern (the bug that locked entitled partners on native): on the
    // native shell the JWT lives in Capacitor Preferences and is loaded
    // ASYNCHRONOUSLY into the in-memory cache at app init. If the /me
    // entitlement check fires before that load completes, it goes out
    // ANONYMOUS → the API returns free → canReadBody is false → the teaching
    // shows the paywall lock even for an "everything" partner. Awaiting
    // loadStoredNativeToken() first hydrates the Bearer token, exactly as the
    // reader chrome (App.tsx S178) and the book list (S200) already do. On web
    // it resolves immediately with null (the cookie path is synchronous and
    // unaffected). loadStoredNativeToken is idempotent — this awaits the same
    // Preferences read App mount already kicked off, not a second one.
    void loadStoredNativeToken().then(() => {
      if (cancelled) return;
      getSubscriptionMe()
        .then((me) => {
          if (cancelled) return;
          setTier(me.tier ?? "free");
          setStatus(me.status);
          setPeriodEnd(me.current_period_end ?? null);
          setMeChecked(true);
        })
        .catch(() => {
          if (cancelled) return;
          setTier("free");
          setStatus("none");
          setPeriodEnd(null);
          setMeChecked(true);
        });
    });
    return () => {
      cancelled = true;
    };
  }, []);

  const entitled = canReadBody(teaching, tier, status, periodEnd);

  // Fetch the gated body once, when an entitled reader reveals a teaching whose
  // body isn't inline. Guarded so it fires exactly once per detail view.
  useEffect(() => {
    if (!revealed || !entitled || hasInlineBody) return;
    if (gatedBody || gatedState === "loading") return;
    let cancelled = false;
    setGatedState("loading");
    getTeachingBody(teaching.slug)
      .then((data) => {
        if (cancelled) return;
        setGatedBody(data);
        setGatedState("idle");
      })
      .catch(() => {
        if (cancelled) return;
        setGatedState("error");
      });
    return () => {
      cancelled = true;
    };
  }, [revealed, entitled, hasInlineBody, gatedBody, gatedState, teaching.slug]);

  // The resolved body + flourishes come from the inline source (free) or the
  // fetched gated payload (paid). Normalize a gated promo's caption null →
  // undefined so it matches the TeachingPromo shape CoverPromo expects.
  const resolvedBody = hasInlineBody ? teaching.body : gatedBody?.body ?? "";
  const resolvedClosing: TeachingClosing | undefined = hasInlineBody
    ? teaching.closing
    : gatedBody?.closing ?? undefined;
  const resolvedPromos: TeachingPromo[] = hasInlineBody
    ? teaching.promo
      ? [teaching.promo]
      : []
    : (gatedBody?.promos ?? []).map((p) => ({
        image: p.image,
        alt: p.alt,
        href: p.href,
        caption: p.caption ?? undefined,
      }));

  // Inline bodies are always ready; gated bodies are ready once fetched.
  const bodyReady = hasInlineBody || gatedBody !== null;

  return (
    <Shell>
      <a
        href="/teachings"
        className="text-sm text-[var(--reader-accent)] hover:underline"
      >
        ← All teachings
      </a>

      {/* Title + synopsis — shown to everyone. */}
      <article className="mt-4">
        {renderTeachingBody(teaching.synopsis)}
      </article>

      {/* Dive-deeper control → reveals the full body when entitled. */}
      <section className="mt-8">
        {revealed && entitled ? (
          bodyReady ? (
            <>
              <article className="border-t border-[var(--reader-rule)] pt-6">
                {renderTeachingBody(resolvedBody)}
              </article>
              {resolvedClosing && <ClosingFlourish closing={resolvedClosing} />}
              {resolvedPromos.map((promo, i) => (
                <CoverPromo key={i} promo={promo} />
              ))}
            </>
          ) : gatedState === "error" ? (
            <p className="text-center text-sm text-[var(--reader-muted)]">
              The full teaching couldn’t be loaded just now. Please check your
              connection and try again.
            </p>
          ) : (
            <p className="text-center text-sm text-[var(--reader-muted)]">
              Opening the full teaching…
            </p>
          )
        ) : entitled ? (
          <button
            type="button"
            onClick={() => setRevealed(true)}
            className="w-full rounded-md border border-[var(--reader-accent)] bg-[var(--reader-surface)] px-4 py-3 text-center font-serif text-sm font-semibold text-[var(--reader-text)] transition-colors hover:bg-[var(--reader-accent)] hover:text-[var(--reader-bg)]"
          >
            Dive deeper — the full teaching with every scripture ↓
          </button>
        ) : (
          // Not entitled: visible-but-locked. No checkout / pricing link.
          <LockedPartnerPrompt
            title={`Available on ${prettyTier(teaching.tier_required)} — become a partner`}
            message={`The full teaching — every scripture, arranged in order — opens on the ${prettyTier(
              teaching.tier_required,
            )} partnership. The title and synopsis above stay free for everyone. Partnership is chosen and managed from your account on the web at remnantofpromise.org.`}
          />
        )}
        {!meChecked && !entitled && (
          <p className="mt-2 text-center text-xs text-[var(--reader-muted)]">
            Checking your access…
          </p>
        )}
      </section>
    </Shell>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Closing flourish — a distinct metallic block after the body
// ───────────────────────────────────────────────────────────────────────

function ClosingFlourish({ closing }: { closing: TeachingClosing }) {
  return (
    <section
      className="mt-10 rounded-lg border px-5 py-6 text-center"
      style={{
        borderColor: "#FCECAF",
        backgroundColor:
          "color-mix(in srgb, #B4A078 12%, var(--reader-surface))",
      }}
      aria-label="Closing"
    >
      <p className="font-serif text-[15px] italic leading-relaxed text-[var(--reader-text)]">
        {renderItalicSpans(closing.lead)}
      </p>
      <p className="mt-4">
        <span className="book-pill book-pill-argaman text-lg font-semibold">
          {renderItalicSpans(closing.finish)}
        </span>
      </p>
    </section>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Cover promo — clickable book cover → external PRINT product page
// ───────────────────────────────────────────────────────────────────────

function CoverPromo({ promo }: { promo: TeachingPromo }) {
  return (
    <div className="mt-8 flex flex-col items-center">
      <a
        href={promo.href}
        target="_blank"
        rel="noopener noreferrer"
        onClick={(e) => {
          e.preventDefault();
          void openExternal(promo.href);
        }}
        className="group inline-block rounded-md focus:outline-none focus-visible:ring-2 focus-visible:ring-[var(--reader-accent)]"
        aria-label={`${promo.alt} — opens the print edition on Amazon`}
      >
        <img
          src={promo.image}
          alt={promo.alt}
          loading="lazy"
          className="mx-auto w-48 max-w-[70%] rounded-md border border-[var(--reader-rule)] shadow-lg transition-transform duration-200 group-hover:scale-[1.02] sm:w-56"
        />
      </a>
      {promo.caption && (
        <a
          href={promo.href}
          target="_blank"
          rel="noopener noreferrer"
          onClick={(e) => {
            e.preventDefault();
            void openExternal(promo.href);
          }}
          className="mt-3 text-sm font-medium text-[var(--reader-accent)] hover:underline"
        >
          {promo.caption} →
        </a>
      )}
    </div>
  );
}

function NotFound({ slug }: { slug: string }) {
  return (
    <Shell>
      <a
        href="/teachings"
        className="text-sm text-[var(--reader-accent)] hover:underline"
      >
        ← All teachings
      </a>
      <h1 className="mt-4 font-serif text-2xl font-semibold">
        Teaching not found
      </h1>
      <p className="mt-2 text-sm leading-relaxed text-[var(--reader-muted)]">
        There is no teaching at <span className="font-mono">{slug}</span>.
      </p>
    </Shell>
  );
}
