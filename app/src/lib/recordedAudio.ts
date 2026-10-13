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
  { id: "am_onyx", name: "Onyx · Natural voice (deep)", lang: "en-US", localService: false },
  { id: "af_heart", name: "Heart · Natural voice (female)", lang: "en-US", localService: false },
];

// S444 — natural voices are a partner feature (paid tiers + the 7-day free
// trial). App.tsx sets this from the reader's subscription status; free
// readers keep the device voice. (Soft gate: the files themselves are on a
// public CDN. A Cloudflare Worker checking the rop_jwt cookie can harden it.)
let entitled = false;
export function setRecordedVoicesEntitled(v: boolean): void {
  entitled = v;
}
export function recordedVoicesEntitled(): boolean {
  return entitled;
}

export function recordedVoiceByName(name: string | null | undefined): RecordedVoice | null {
  if (!name) return null;
  return RECORDED_VOICES.find((v) => v.name === name) ?? null;
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
  let runIdx = 0;
  let detach: (() => void) | null = null;

  const emitEnd = (verseId?: number) => {
    for (const h of endHandlers) {
      try { h({ verseId }); } catch { /* swallow */ }
    }
  };
  const emitError = (message: string, verseId?: number) => {
    for (const h of errorHandlers) {
      try { h({ message, verseId }); } catch { /* swallow */ }
    }
  };

  // Rebroadcast the device engine's events while it is the one speaking.
  fallback.onEnd((e) => { if (mode === "fallback") emitEnd(e.verseId); });
  fallback.onError((e) => { if (mode === "fallback") emitError(e.message, e.verseId); });

  async function loadTiming(voiceId: string, book: string, chapter: number): Promise<Timing | null> {
    const key = `${voiceId}/${book}/${chapter}`;
    if (timingCache.has(key)) return timingCache.get(key)!;
    try {
      const r = await fetch(`${AUDIO_BASE}/${key}.json`, { cache: "force-cache" });
      const t = r.ok ? ((await r.json()) as Timing) : null;
      timingCache.set(key, t);
      return t;
    } catch {
      return null; // offline / blocked: don't cache the miss
    }
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
    const picked = entitled ? recordedVoiceByName(first?.opts?.voiceName) : null;
    const ref = first?.opts?.ref;
    if (!audio || !picked || !ref) { runFallback(items); return; }

    // Unlock / start the element inside the tap (iOS), muted, while the
    // timing file loads; it is unmuted after the seek below.
    const candidates = [picked, ...RECORDED_VOICES.filter((v) => v.id !== picked.id)];
    let chosen: RecordedVoice | null = null;
    let timing: Timing | null = null;
    audio.muted = true;
    audio.src = `${AUDIO_BASE}/${picked.id}/${ref.book}/${ref.chapter}.mp3`;
    void audio.play().catch(() => { /* resolved below */ });
    for (const v of candidates) {
      timing = await loadTiming(v.id, ref.book, ref.chapter);
      if (mySession !== session) return;
      if (timing) { chosen = v; break; }
    }
    if (!chosen || !timing) {
      audio.pause();
      audio.muted = false;
      if (fallback.isAvailable()) { runFallback(items); return; }
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

    const src = `${AUDIO_BASE}/${chosen.id}/${ref.book}/${ref.chapter}.mp3`;
    if (audio.src !== src) audio.src = src;
    audio.playbackRate = first.opts?.rate ?? 1.0;
    mode = "recorded";
    paused = false;

    const onTime = () => {
      if (mySession !== session) return;
      while (runIdx + 1 < runItems.length && audio.currentTime >= runItems[runIdx + 1].start - 0.05) {
        emitEnd(runItems[runIdx].verseId);
        runIdx++;
      }
    };
    const onEnded = () => {
      if (mySession !== session) return;
      onTime();
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
      void audio.play().catch(() => emitError("Tap play to start audio."));
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
    isAvailable: () => (entitled && !!audio) || fallback.isAvailable(),

    getVoices(): TTSVoice[] {
      return entitled ? [...RECORDED_VOICES, ...fallback.getVoices()] : fallback.getVoices();
    },

    onVoicesChanged: (h) => fallback.onVoicesChanged(h),

    speak(text, opts) {
      // Preview call from the voice picker (no verse, no chapter ref).
      if (!opts?.ref && opts?.verseId === undefined) {
        const rv = entitled ? recordedVoiceByName(opts?.voiceName) : null;
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
      if (mode === "recorded" && audio && paused) {
        paused = false;
        void audio.play().catch(() => {});
        return;
      }
      fallback.resume();
    },

    stop() {
      session++;
      batch = [];
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
