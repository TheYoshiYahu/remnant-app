/**
 * Offline download engine (Phase 2 of the offline / speed work).
 *
 * Phase 1 shipped the read-through content cache (lib/contentCache.ts): every
 * reading layer the Reader renders — chapter text, the chapters list, witness
 * + kingdom marks, the interlinear words, cross-references, commentary — is
 * served stale-while-revalidate from IndexedDB, keyed by the partner's tier.
 *
 * This module is the "Download for offline" button that the cache's own
 * docstring promised: it WALKS the same read path the Reader walks
 * (listBooks → listChapters → getChapter + the owned layers) and `put`s every
 * payload into that same cache. Because the cache key a download writes is
 * byte-for-byte the key the Reader reads (same scope, version, book, chapter,
 * layer), pre-seeded content is served INSTANTLY and works fully offline — no
 * new read code, no second cache.
 *
 * IMPORTANT — this is CONTENT only (reading / cross-references). It does NOT
 * touch The Appointed Times calendar, which is CPU work (already memoized);
 * downloading nothing makes the calendar faster.
 *
 * Tier safety. The server computes entitlement from the JWT, so every payload
 * we fetch is already gated to what the partner owns — a free reader's
 * `getChapterWords` comes back without the §28 interlinear fields, a locked
 * book 404s. We never request books above the partner's tier (the book list is
 * server-filtered AND we re-filter by `tier_required` as belt-and-suspenders),
 * and the cache is tier-scoped, so a download can never store — let alone
 * serve — content the partner doesn't own.
 *
 * Progress / pause / resume. `runDownload` reports progress as it goes
 * (books + chapters done, approx bytes) and honors an AbortSignal: aborting
 * throws `DownloadPausedError` after the current chapter, leaving everything
 * fetched so far in the cache. Re-running skips any layer already cached
 * (`has`), so resume picks up where it left off without re-fetching. A small
 * manifest in localStorage records each area's state for the settings UI.
 */

import {
  getChapter,
  getChapterCommentary,
  getChapterCrossReferences,
  getChapterKingdom,
  getChapterWitness,
  getChapterWords,
  listBooks,
  listChapters,
  type BookSummary,
  type ContentTier,
  type PartnerTier,
} from "./api";
import {
  clearByLayers,
  has,
  put,
  type ContentLayer,
  type ContentSpec,
} from "./contentCache";

// ----- Tier ladder (mirror of search-helpers / api content_tier) ---------

const TIER_LADDER: ContentTier[] = [
  "free",
  "study_notes",
  "extras",
  "complete_study",
  "everything",
];

function tierRank(tier: ContentTier | PartnerTier | null): number {
  if (!tier) return 0; // anonymous = free
  const idx = TIER_LADDER.indexOf(tier as ContentTier);
  return idx === -1 ? 0 : idx;
}

/** True when `partner` is entitled to content requiring `required`. */
export function tierOwns(
  partner: PartnerTier | null,
  required: ContentTier,
): boolean {
  return tierRank(partner) >= tierRank(required);
}

// ----- Download areas (the tiered options the settings screen renders) ----

export type DownloadAreaId = "core" | "study" | "compare" | "maps";

/**
 * `reading` areas walk the book/chapter read path and pre-seed contentCache
 * layers — these work offline TODAY with no changes to any reader code.
 *
 * `soon` areas (compare versions, maps + reference tools) read through their
 * OWN paths — the comparison lens, the maps / Nave's / Vincent's sheets —
 * which aren't cache-backed yet. Pre-seeding them would fill storage without
 * making anything work offline, so they're surfaced as real, sized, tier-
 * gated rows marked "Available soon" rather than shipped as a no-op button.
 */
export type DownloadAreaKind = "reading" | "soon";

export interface DownloadArea {
  id: DownloadAreaId;
  label: string;
  blurb: string;
  /** Honest planning estimate (bytes). Actual stored bytes are measured live. */
  estBytes: number;
  /** Minimum tier whose content this area actually fills. */
  minTier: ContentTier;
  kind: DownloadAreaKind;
  /**
   * Reading layers this area seeds. `chapters` is the book-level list; the
   * rest are per-chapter. Overlapping layers between areas are deduped at
   * download time via `has`, so a layer is only ever fetched once.
   */
  layers: ContentLayer[];
}

const MB = 1024 * 1024;

export const DOWNLOAD_AREAS: DownloadArea[] = [
  {
    id: "core",
    label: "Core Bible",
    blurb:
      "Every book you can read, offline — chapter text, the Witness and Kingdom marks, and the cross-reference threads. Recommended.",
    estBytes: 25 * MB,
    minTier: "free",
    kind: "reading",
    layers: ["chapters", "chapter", "witness", "kingdom", "xrefs"],
  },
  {
    id: "study",
    label: "Study tools & interlinear",
    blurb:
      "The Hebrew/Greek interlinear (tap-a-word) and the tiered commentary stack, cached for every chapter you own.",
    estBytes: 75 * MB,
    minTier: "complete_study",
    kind: "reading",
    // chapters/chapter are seeded by Core too; deduped via `has` so the
    // interlinear still has its text even if downloaded on its own.
    layers: ["chapters", "chapter", "words", "commentary"],
  },
  {
    id: "compare",
    label: "Compare versions",
    blurb:
      "The nine public-domain comparison translations (KJV, ASV, YLT, Brenton's LXX, and more) for side-by-side study.",
    estBytes: 30 * MB,
    minTier: "complete_study",
    kind: "soon",
    layers: [],
  },
  {
    id: "maps",
    label: "Maps & reference tools",
    blurb:
      "The atlas of biblical places plus Nave's Topical and Vincent's Word Studies.",
    estBytes: 35 * MB,
    minTier: "complete_study",
    kind: "soon",
    layers: [],
  },
];

export function getArea(id: DownloadAreaId): DownloadArea {
  const area = DOWNLOAD_AREAS.find((a) => a.id === id);
  if (!area) throw new Error(`unknown download area: ${id}`);
  return area;
}

/** Does the partner's tier own enough to fill this area with real content? */
export function isAreaUnlocked(
  area: DownloadArea,
  partnerTier: PartnerTier | null,
): boolean {
  return tierOwns(partnerTier, area.minTier);
}

// ----- Per-chapter layer fetchers -----------------------------------------

type ChapterFetcher = (book: string, chapter: number) => Promise<unknown>;

/** Per-chapter reading layers and how to fetch each. `chapters` is handled
 *  separately (book-level), so it's intentionally absent here. */
const CHAPTER_FETCHERS: Partial<Record<ContentLayer, ChapterFetcher>> = {
  chapter: getChapter,
  witness: getChapterWitness,
  kingdom: getChapterKingdom,
  xrefs: getChapterCrossReferences,
  words: getChapterWords,
  commentary: getChapterCommentary,
};

// ----- Progress + manifest -------------------------------------------------

export type DownloadState = "idle" | "running" | "paused" | "done" | "error";

export interface DownloadProgress {
  areaId: DownloadAreaId;
  state: DownloadState;
  booksTotal: number;
  booksDone: number;
  chaptersTotal: number;
  chaptersDone: number;
  /** Approx bytes this run has written (skipped/already-cached not counted). */
  bytes: number;
  /** Present when state === "error". */
  error?: string;
}

/** Thrown by runDownload when its AbortSignal fires — i.e. the partner paused. */
export class DownloadPausedError extends Error {
  constructor() {
    super("download paused");
    this.name = "DownloadPausedError";
  }
}

const MANIFEST_KEY = "rop_offline_manifest_v1";

interface ManifestEntry {
  state: DownloadState;
  booksTotal: number;
  booksDone: number;
  chaptersTotal: number;
  chaptersDone: number;
  bytes: number;
  /** Partner tier the entry was built under — a tier change invalidates it. */
  tier: PartnerTier | null;
  updatedAt: number;
}

export type DownloadManifest = Partial<Record<DownloadAreaId, ManifestEntry>>;

export function readManifest(): DownloadManifest {
  try {
    const raw = localStorage.getItem(MANIFEST_KEY);
    if (!raw) return {};
    return JSON.parse(raw) as DownloadManifest;
  } catch {
    return {};
  }
}

function writeManifestEntry(id: DownloadAreaId, entry: ManifestEntry): void {
  try {
    const m = readManifest();
    m[id] = entry;
    localStorage.setItem(MANIFEST_KEY, JSON.stringify(m));
  } catch {
    // localStorage full / disabled — the download still works, the UI just
    // won't persist the "downloaded" badge across reloads.
  }
}

export function clearManifestEntry(id: DownloadAreaId): void {
  try {
    const m = readManifest();
    delete m[id];
    localStorage.setItem(MANIFEST_KEY, JSON.stringify(m));
  } catch {
    /* ignore */
  }
}

/** Drop the whole manifest (paired with contentCache.clearAll on "Clear all"). */
export function clearManifest(): void {
  try {
    localStorage.removeItem(MANIFEST_KEY);
  } catch {
    /* ignore */
  }
}

// ----- The walk ------------------------------------------------------------

function approxBytes(data: unknown): number {
  try {
    const json = JSON.stringify(data) ?? "";
    if (typeof TextEncoder !== "undefined")
      return new TextEncoder().encode(json).length;
    return json.length;
  } catch {
    return 0;
  }
}

/** Books the partner is entitled to, server-filtered AND re-checked client
 *  side against the area's minimum tier. */
async function ownedBooks(partnerTier: PartnerTier | null): Promise<BookSummary[]> {
  const books = await listBooks();
  return books.filter((b) => tierOwns(partnerTier, b.tier_required));
}

export interface RunDownloadOptions {
  onProgress?: (p: DownloadProgress) => void;
  signal?: AbortSignal;
}

/**
 * Download (pre-seed the content cache for) one area, gated to the partner's
 * tier. Resumable: any layer already cached is skipped, so re-running after a
 * pause continues from where it stopped.
 *
 * Throws DownloadPausedError if the signal aborts; rethrows other errors after
 * recording an "error" manifest state.
 */
export async function runDownload(
  areaId: DownloadAreaId,
  partnerTier: PartnerTier | null,
  opts: RunDownloadOptions = {},
): Promise<DownloadProgress> {
  const area = getArea(areaId);
  const { onProgress, signal } = opts;

  if (area.kind !== "reading") {
    throw new Error(`area "${areaId}" is not downloadable yet`);
  }
  if (!isAreaUnlocked(area, partnerTier)) {
    throw new Error(`area "${areaId}" requires a higher tier`);
  }

  const books = await ownedBooks(partnerTier);

  const progress: DownloadProgress = {
    areaId,
    state: "running",
    booksTotal: books.length,
    booksDone: 0,
    chaptersTotal: 0,
    chaptersDone: 0,
    bytes: 0,
  };

  const perChapterLayers = area.layers.filter((l) => l !== "chapters");
  const seedChaptersList = area.layers.includes("chapters");

  const report = (state: DownloadState, error?: string) => {
    progress.state = state;
    if (error) progress.error = error;
    onProgress?.({ ...progress });
    writeManifestEntry(areaId, {
      state,
      booksTotal: progress.booksTotal,
      booksDone: progress.booksDone,
      chaptersTotal: progress.chaptersTotal,
      chaptersDone: progress.chaptersDone,
      bytes: progress.bytes,
      tier: partnerTier,
      updatedAt: Date.now(),
    });
  };

  const checkPaused = () => {
    if (signal?.aborted) throw new DownloadPausedError();
  };

  report("running");

  try {
    for (const book of books) {
      checkPaused();

      // Book-level chapters list — seed it (for the offline picker) and use it
      // to enumerate the chapters regardless of which layers we seed.
      const chaptersResp = await listChapters(book.slug);
      if (seedChaptersList) {
        const spec: ContentSpec = { layer: "chapters", book: book.slug, chapter: 0 };
        if (!(await has(spec))) {
          await put(spec, chaptersResp);
          progress.bytes += approxBytes(chaptersResp);
        }
      }

      const chapters = chaptersResp.chapters;
      progress.chaptersTotal += chapters.length;

      for (const ch of chapters) {
        checkPaused();
        for (const layer of perChapterLayers) {
          const fetcher = CHAPTER_FETCHERS[layer];
          if (!fetcher) continue;
          const spec: ContentSpec = {
            layer,
            book: book.slug,
            chapter: ch.chapter_number,
          };
          if (await has(spec)) continue; // resume / dedupe across areas
          try {
            const data = await fetcher(book.slug, ch.chapter_number);
            await put(spec, data);
            progress.bytes += approxBytes(data);
          } catch {
            // A single layer 404/transient (e.g. a chapter with no commentary)
            // must not abort the whole download — skip it and keep going.
          }
        }
        progress.chaptersDone += 1;
        onProgress?.({ ...progress });
      }

      progress.booksDone += 1;
      report("running");
    }

    report("done");
    return { ...progress };
  } catch (err) {
    if (err instanceof DownloadPausedError) {
      report("paused");
      throw err;
    }
    report("error", err instanceof Error ? err.message : String(err));
    throw err;
  }
}

/**
 * Remove an area's downloaded content from the cache and the manifest. Core
 * shares its `chapters`/`chapter` text with Study, so clearing Core also
 * removes the shared text (Study would need a re-download to read offline) —
 * that's intended: there's no Bible to interline once the text is gone.
 */
export async function clearArea(areaId: DownloadAreaId): Promise<void> {
  const area = getArea(areaId);
  if (area.layers.length > 0) await clearByLayers(area.layers);
  clearManifestEntry(areaId);
}
