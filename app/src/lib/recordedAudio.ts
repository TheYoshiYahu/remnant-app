/**
 * S444 — recorded natural-voice narration.
 *
 * The device voices (browser speechSynthesis / Android TTS) sound robotic,
 * and inside the Android app they are silent. Every canon chapter is now
 * pre-recorded in four natural voices (Kokoro, Apache-2.0) and served as
 * plain MP3 files from AUDIO_BASE:
 *
 *   <AUDIO_BASE>/<voiceId>/<book_slug>/<chapter>.mp3
 *   <AUDIO_BASE>/<voiceId>/<book_slug>/<chapter>.json   { duration, verses: [[verse_number, start_seconds], ...] }
 *   <AUDIO_BASE>/<voiceId>/preview.mp3
 *
 * This engine wraps the device engine. When the reader's voice is one of
 * the recorded voices AND the chapter's recording exists, it plays the MP3
 * and fires the same per-verse onEnd events the device engine fires, so
 * App.tsx's cursor, scroll-sync and chapter auto-advance keep working
 * unchanged. Anything not recorded (extra-canonical books, a chapter not
 * uploaded yet, a device voice picked on purpose) falls through to the
 * device engine. A recorded voice that is missing a chapter first tries
 * the other recorded voices before giving up on recordings.
 *
 * One persistent <audio> element is reused for the whole session: iOS only
 * lets a page start sound from a tap, and an element that has played once
 * from a tap may keep playing new sources (chapter auto-advance) after.
 */

import type { TTSEngine, TTSEndEvent, TTSError, TTSOptions, TTSVoice } from "./tts";

export const AUDIO_BASE: string =
  (import.meta.env.VITE_AUDIO_BASE as string | undefined) ??
  "https://pub-ea998a76536a4b99b520a192edaa8dc2.r2.dev";

export interface RecordedVoice extends TTSVoice {
  id: string;
}

/** Display name → recorded voice. Order = picker order; first is the default. */
export const RECORDED_VOICES: RecordedVoice[] = [
  { id: "am_michael", name: "Michael · Natural voice", lang: "en-US", default: true, localService: false },
  { id: "bm_george", name: "George · Natural voice (British)", lang: "en-GB", localService: false },
  { id: "am_onyx", name: "Ivan · Natural voice (deep)", lang: "en-US", localService: false },
  { id: "af_heart", name: "Olivia · Natural voice (female)", lang: "en-US", localService: false },
];

// S444 — natural voices are a partner feature (paid tiers + the 7-day free
// trial). S451 — free and signed-out readers now get a taste instead of the
// phone's robot voice: the natural voices sit in their picker (Michael is the
// default), preview works, and a chapter plays verses 1–5 in the natural
// voice and then stops with an invite. App.tsx sets the level from the
// reader's subscription status. (Soft gate: the files themselves are on a
// public CDN. A Cloudflare Worker checking the rop_jwt cookie can harden it.)
export type RecordedAccess = "full" | "sample";
export const SAMPLE_VERSES = 5;
export const SAMPLE_NOTICE =
  `That was the free sample of the natural voice: the first ${SAMPLE_VERSES} verses of any chapter. ` +
  "It stopped on purpose, not because of an error. Partners and the 7-day free trial hear every chapter in full.";
export const SAMPLE_PLAYING_NOTICE =
  `Free sample: you'll hear verses 1–${SAMPLE_VERSES} of this chapter in the natural voice, then it stops. ` +
  "This isn't an error — partners and the 7-day free trial hear every chapter in full.";
export const SAMPLE_START_NOTICE =
  `Free readers hear verses 1–${SAMPLE_VERSES} of any chapter in the natural voice — start from verse 1. ` +
  "Partners and the 7-day free trial hear every chapter.";
let access: RecordedAccess = "sample";
export function setRecordedVoicesAccess(v: RecordedAccess): void {
  access = v;
}
export function recordedVoicesAccess(): RecordedAccess {
  return access;
}
/** Kept for callers that only need yes/no: full access to every chapter. */
export function recordedVoicesEntitled(): boolean {
  return access === "full";
}

/** Canon books sit at <voice>/<book>/; every other edition at <voice>/<edition>/<book>/
 *  (several editions share book slugs, e.g. 1-esdras). */
export function audioBookKey(editionSlug: string | null | undefined, bookSlug: string): string {
  return !editionSlug || editionSlug === "canon" ? bookSlug : `${editionSlug}/${bookSlug}`;
}

// S448 — display names changed (Heart → Olivia, Onyx → Ivan); ids and the
// R2 paths did not. A saved preference still carries the old name.
const RENAMED_VOICES: Record<string, string> = {
  "Heart · Natural voice (female)": "af_heart",
  "Onyx · Natural voice (deep)": "am_onyx",
};

export function recordedVoiceByName(name: string | null | undefined): RecordedVoice | null {
  if (!name) return null;
  const byName = RECORDED_VOICES.find((v) => v.name === name);
  if (byName) return byName;
  const id = RENAMED_VOICES[name];
  return id ? RECORDED_VOICES.find((v) => v.id === id) ?? null : null;
}

export function isRecordedVoiceName(name: string | null | undefined): boolean {
  return recordedVoiceByName(name) !== null;
}

interface Timing {
  duration: number;
  verses: [number, number][];
}

interface Pending {
  text: string;
  opts?: TTSOptions;
}

export function createRecordedEngine(fallback: TTSEngine): TTSEngine {
  const endHandlers = new Set<(e: TTSEndEvent) => void>();
  const errorHandlers = new Set<(e: TTSError) => void>();
  const timingCache = new Map<string, Timing | null>();

  const audio: HTMLAudioElement | null =
    typeof Audio !== "undefined" ? new Audio() : null;
  if (audio) {
    audio.preload = "auto";
    audio.setAttribute("playsinline", "");
  }

  let batch: Pending[] = [];
  let batchScheduled = false;
  let session = 0; // bumps on every stop / new run
  let mode: "idle" | "recorded" | "fallback" = "idle";
  let paused = false;
  // recorded run state
  let runItems: { verseId?: number; verse: number; start: number }[] = [];
  let retryItems: Pending[] | null = null; // S447 — chapter queue held back by a dropped connection
  let stalled = false; // S447 — a recorded run whose play() was refused (screen locked)

  /** S447 — start whatever is armed: a refused play(), or a chapter held back offline. */
  function kick(): boolean {
    if (mode === "recorded" && audio && stalled && !paused) {
      stalled = false;
      void audio.play().then(() => emitError("")).catch(() => { stalled = true; });
      return true;
    }
    if (mode === "idle" && retryItems) {
      const items = retryItems;
      retryItems = null;
      void startBatch(items, ++session);
      return true;
    }
    return false;
  }
  if (typeof document !== "undefined") {
    document.addEventListener("visibilitychange", () => {
      if (document.visibilityState === "visible") kick();
    });
  }
  let runIdx = 0;
  let detach: (() => void) | null = null;

  const emitEnd = (verseId?: number) => {
    for (const h of endHandlers) {
      try { h({ verseId }); } catch { /* swallow */ }
    }
  };
  const emitError = (message: string, verseId?: number, stopped?: boolean) => {
    for (const h of errorHandlers) {
      try { h({ message, verseId, stopped }); } catch { /* swallow */ }
    }
  };
  let sampleDone = false; // S451 — the free taste has played out; play just re-shows the invite

  // Rebroadcast the device engine's events while it is the one speaking.
  fallback.onEnd((e) => { if (mode === "fallback") emitEnd(e.verseId); });
  fallback.onError((e) => { if (mode === "fallback") emitError(e.message, e.verseId); });

  // S447 — "missing" (a 404: no recording in this voice) is different from
  // "couldn't reach the CDN" (phone locked, radio asleep, no signal). Only a
  // real miss may hand the chapter to the phone's voice.
  type TimingResult = { timing: Timing | null; offline: boolean };
  async function loadTiming(voiceId: string, book: string, chapter: number): Promise<TimingResult> {
    const key = `${voiceId}/${book}/${chapter}`;
    if (timingCache.has(key)) return { timing: timingCache.get(key)!, offline: false };
    // A fetch can fail transiently while the phone is locked; retry with
    // backoff (about 12 s in all) before reporting it as unreachable.
    for (let attempt = 0; attempt < 6; attempt++) {
      try {
        const r = await fetch(`${AUDIO_BASE}/${key}.json`, { cache: "force-cache" });
        if (r.ok) {
          const t = (await r.json()) as Timing;
          timingCache.set(key, t);
          return { timing: t, offline: false };
        }
        if (r.status === 404 || r.status === 403) {
          timingCache.set(key, null);
          return { timing: null, offline: false };
        }
      } catch {
        /* network — retry below */
      }
      await new Promise((res) => setTimeout(res, 500 * (attempt + 1)));
    }
    return { timing: null, offline: true }; // don't cache the miss
  }

  // S447 — the next chapter's MP3 is held in memory as a blob so the chapter
  // break needs no network at all (the HTTP cache is not reliable for media
  // range requests while the app is in the background). Two at most.
  const blobCache = new Map<string, string>();
  const blobPending = new Set<string>();
  function rememberBlob(key: string, url: string) {
    if (blobCache.size >= 2) {
      const oldest = blobCache.keys().next().value as string | undefined;
      if (oldest !== undefined) {
        try { URL.revokeObjectURL(blobCache.get(oldest)!); } catch { /* ignore */ }
        blobCache.delete(oldest);
      }
    }
    blobCache.set(key, url);
  }

  /** S446/S447 — warm the next chapter: timing file in memory, MP3 as a blob. */
  function prefetchChapter(voiceName: string | null, ref: { book: string; chapter: number }): void {
    const v = access === "full" ? recordedVoiceByName(voiceName) : null;
    if (!v) return;
    void loadTiming(v.id, ref.book, ref.chapter).then(({ timing }) => {
      if (!timing) return;
      const key = `${v.id}/${ref.book}/${ref.chapter}`;
      if (blobCache.has(key) || blobPending.has(key)) return;
      blobPending.add(key);
      void fetch(`${AUDIO_BASE}/${key}.mp3`, { cache: "force-cache" })
        .then((r) => (r.ok ? r.blob() : null))
        .then((b) => { if (b) rememberBlob(key, URL.createObjectURL(b)); })
        .catch(() => undefined)
        .finally(() => blobPending.delete(key));
    });
  }

  function clearAudio() {
    if (detach) { detach(); detach = null; }
    if (audio) {
      try { audio.pause(); } catch { /* ignore */ }
    }
  }

  function runFallback(items: Pending[]) {
    mode = "fallback";
    for (const it of items) {
      const voiceName = isRecordedVoiceName(it.opts?.voiceName) ? null : it.opts?.voiceName;
      fallback.speak(it.text, { ...it.opts, voiceName });
    }
  }

  async function startBatch(items: Pending[], mySession: number) {
    const first = items[0];
    const picked = recordedVoiceByName(first?.opts?.voiceName);
    const ref = first?.opts?.ref;
    if (!audio || !picked || !ref) { runFallback(items); return; }
    // S451 — the free taste: verses 1–5 of the chapter in the natural voice.
    const sample = access !== "full";
    if (sample) {
      items = items.filter((it) => (it.opts?.ref?.verse ?? 0) <= SAMPLE_VERSES);
      if (items.length === 0) {
        mode = "idle";
        sampleDone = true;
        emitError(SAMPLE_START_NOTICE, first?.opts?.verseId, true);
        return;
      }
    }

    // Unlock / start the element inside the tap (iOS), muted, while the
    // timing file loads; it is unmuted after the seek below.
    const candidates = [picked, ...RECORDED_VOICES.filter((v) => v.id !== picked.id)];
    let chosen: RecordedVoice | null = null;
    let timing: Timing | null = null;
    const srcFor = (v: RecordedVoice) => {
      const key = `${v.id}/${ref.book}/${ref.chapter}`;
      return blobCache.get(key) ?? `${AUDIO_BASE}/${key}.mp3`;
    };
    audio.muted = true;
    audio.src = srcFor(picked);
    void audio.play().catch(() => { /* resolved below */ });
    let offline = false;
    for (const v of candidates) {
      const r = await loadTiming(v.id, ref.book, ref.chapter);
      if (mySession !== session) return;
      if (r.timing) { chosen = v; timing = r.timing; break; }
      if (r.offline) { offline = true; break; } // no point trying other voices
    }
    if (!chosen || !timing) {
      audio.pause();
      audio.muted = false;
      if (offline) {
        // S447 — never swap narrators over a dropped connection; wait for
        // the reader instead.
        mode = "idle";
        retryItems = items;
        emitError("Couldn't reach the recording. Tap play to try again.", first?.opts?.verseId);
        return;
      }
      // S446 — say so in the player instead of switching voices silently.
      if (fallback.isAvailable()) {
        emitError("No natural-voice recording for this chapter yet. Using the phone's voice.", first?.opts?.verseId);
        runFallback(items);
        return;
      }
      mode = "idle";
      emitError("This chapter has no recording yet, and this device has no built-in voice.", first?.opts?.verseId);
      return;
    }

    const starts = new Map(timing.verses.map(([n, s]) => [n, s]));
    runItems = items
      .filter((it) => it.opts?.ref && starts.has(it.opts.ref.verse))
      .map((it) => ({ verseId: it.opts?.verseId, verse: it.opts!.ref!.verse, start: starts.get(it.opts!.ref!.verse)! }));
    runIdx = 0;
    if (runItems.length === 0) { runFallback(items); return; }
    // S451 — where the taste ends: the start of the verse after the last
    // sampled one (or the end of the file when the chapter is that short).
    const lastVerse = runItems[runItems.length - 1].verse;
    const afterLast = timing.verses.find(([n]) => n > lastVerse);
    const sampleEndAt = sample ? (afterLast ? afterLast[1] : timing.duration) : Infinity;

    const src = srcFor(chosen);
    if (audio.src !== src) audio.src = src;
    audio.playbackRate = first.opts?.rate ?? 1.0;
    mode = "recorded";
    paused = false;
    retryItems = null;
    stalled = false;
    sampleDone = false;
    // S464 — say up front that this is a sample, so the stop at verse 5
    // never reads as the player breaking.
    if (sample) emitError(SAMPLE_PLAYING_NOTICE, first?.opts?.verseId, false);

    const finishSample = () => {
      mode = "idle";
      clearAudio();
      sampleDone = true;
      emitError(SAMPLE_NOTICE, runItems[runIdx]?.verseId, true);
    };
    const onTime = () => {
      if (mySession !== session) return;
      while (runIdx + 1 < runItems.length && audio.currentTime >= runItems[runIdx + 1].start - 0.05) {
        emitEnd(runItems[runIdx].verseId);
        runIdx++;
      }
      if (sample && audio.currentTime >= sampleEndAt - 0.05) finishSample();
    };
    const onEnded = () => {
      if (mySession !== session) return;
      onTime();
      if (mode !== "recorded") return; // the taste already closed the run
      if (sample) { finishSample(); return; }
      mode = "idle";
      clearAudio();
      emitEnd(runItems[runIdx]?.verseId);
    };
    const onErr = () => {
      if (mySession !== session) return;
      mode = "idle";
      clearAudio();
      emitError("Audio could not be played.", runItems[runIdx]?.verseId);
    };
    audio.addEventListener("timeupdate", onTime);
    audio.addEventListener("ended", onEnded);
    audio.addEventListener("error", onErr);
    detach = () => {
      audio.removeEventListener("timeupdate", onTime);
      audio.removeEventListener("ended", onEnded);
      audio.removeEventListener("error", onErr);
    };

    const seekAndPlay = () => {
      if (mySession !== session) return;
      try { audio.currentTime = runItems[0].start; } catch { /* ignore */ }
      audio.muted = false;
      void audio.play().catch(() => {
        // S447 — Android refuses to start a new sound while the screen is
        // locked. Leave the run armed: the visibility handler and resume()
        // both pick it up.
        stalled = true;
        emitError("Waiting for the screen to unlock to start the next chapter.");
      });
    };
    if (audio.readyState >= 1) seekAndPlay();
    else audio.addEventListener("loadedmetadata", seekAndPlay, { once: true });
  }

  function previewRecorded(v: RecordedVoice) {
    if (!audio) return;
    session++;
    clearAudio();
    mode = "idle";
    audio.muted = false;
    audio.src = `${AUDIO_BASE}/${v.id}/preview.mp3`;
    audio.playbackRate = 1.0;
    void audio.play().catch(() => { /* preview is best-effort */ });
  }

  return {
    isAvailable: () => !!audio || fallback.isAvailable(),

    getVoices(): TTSVoice[] {
      return audio ? [...RECORDED_VOICES, ...fallback.getVoices()] : fallback.getVoices();
    },

    onVoicesChanged: (h) => fallback.onVoicesChanged(h),

    prefetch: prefetchChapter,

    speak(text, opts) {
      // Preview call from the voice picker (no verse, no chapter ref).
      if (!opts?.ref && opts?.verseId === undefined) {
        const rv = recordedVoiceByName(opts?.voiceName);
        if (rv) { previewRecorded(rv); return; }
        session++;
        clearAudio();
        mode = "fallback";
        fallback.speak(text, opts);
        return;
      }
      batch.push({ text, opts });
      if (!batchScheduled) {
        batchScheduled = true;
        const mySession = ++session;
        // Collect the whole chapter queue App.tsx enqueues in one go,
        // then decide recorded vs device once. The microtask keeps us
        // inside the tap's user-activation window for audio.play().
        queueMicrotask(() => {
          batchScheduled = false;
          const items = batch;
          batch = [];
          void startBatch(items, mySession);
        });
      }
    },

    pause() {
      if (mode === "recorded" && audio) { audio.pause(); paused = true; return; }
      fallback.pause();
    },

    resume() {
      if (sampleDone && mode === "idle") {
        // S451 — nothing left to play in the taste; remind, don't pretend.
        emitError(SAMPLE_NOTICE, undefined, true);
        return;
      }
      if (mode === "recorded" && audio && paused) {
        paused = false;
        void audio.play().catch(() => {});
        return;
      }
      if (kick()) return;
      if (mode === "recorded" && audio && audio.paused) {
        // S447 — the element sits paused for a reason we didn't track
        // (e.g. the OS paused it); play beats doing nothing.
        void audio.play().catch(() => {});
        return;
      }
      fallback.resume();
    },

    stop() {
      session++;
      batch = [];
      retryItems = null;
      stalled = false;
      sampleDone = false;
      batchScheduled = false;
      clearAudio();
      runItems = [];
      paused = false;
      mode = "idle";
      fallback.stop();
    },

    isSpeaking() {
      if (mode === "recorded" && audio) return !audio.paused;
      return fallback.isSpeaking();
    },

    onEnd(handler) {
      endHandlers.add(handler);
      return () => endHandlers.delete(handler);
    },

    onError(handler) {
      errorHandlers.add(handler);
      return () => errorHandlers.delete(handler);
    },
  };
}
