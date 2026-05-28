/**
 * S157 — Platform-abstracted TTS engine wrapper.
 *
 * Phase 9.4 launch-blocker per BIBLE_APP_ROADMAP.md §V + DESIGN_LANGUAGE.md
 * §25. Hides the platform-specific TTS implementation behind a single
 * interface so the V1 web ship and the Phase 10 Capacitor wrap consume
 * the same player code.
 *
 * V1 path (S157 ship):
 *   - Browser SpeechSynthesis API via webTTS().
 *   - Per-utterance queue (one SpeechSynthesisUtterance per verse;
 *     speechSynthesis.speak() queues automatically).
 *   - onEnd / onError fire from the per-utterance events; consumers
 *     drive per-verse advancement, scroll-sync, and visual cursor
 *     update from the onEnd callback.
 *
 * Phase 10 path (Capacitor wrap):
 *   - `@capacitor-community/text-to-speech` plugin via nativeTTS().
 *   - Plugin import is commented out at S157 with a TODO marker — the
 *     web build doesn't depend on the package and the bundler doesn't
 *     try to resolve it. Phase 10's wheel uncomments the import, fills
 *     in nativeTTS(), and adds the plugin to package.json + the
 *     capacitor.config.ts native sync.
 *
 * Platform detection: window.Capacitor.isNativePlatform() returns true
 * inside a Capacitor wrap and false-in-undefined in the web build.
 * getEngine() reads this once at module init and locks the engine for
 * the session — no per-call branching cost.
 *
 * Architecture per DESIGN_LANGUAGE.md §25:
 *   - Engine surface is play-pause-stop-getVoices + onEnd / onError
 *     subscriptions. No internal state visible to consumers beyond
 *     isSpeaking().
 *   - Consumers (AudioPlayer.tsx) own their own queue cursor +
 *     per-verse state — the engine is dumb beyond per-utterance
 *     dispatch.
 */

/**
 * Shape of a voice the engine exposes. Mirrors SpeechSynthesisVoice's
 * fields but stays platform-agnostic — the Capacitor plugin returns a
 * different native type, mapped to this shape at the platform layer.
 */
export interface TTSVoice {
  name: string;
  lang: string;
  default?: boolean;
  localService?: boolean;
}

/**
 * Per-utterance options passed to speak(). The verseId field is the
 * consumer's cursor — the engine passes it back to the onEnd handler
 * verbatim so the consumer knows which verse just finished without
 * maintaining its own queue.
 */
export interface TTSOptions {
  voiceName?: string | null;
  rate?: number;
  pitch?: number;
  verseId?: number; // consumer-side cursor, opaque to the engine
}

/**
 * End-event shape. The consumer's onEnd handler receives this so it can
 * advance to the next verse, update visual cursor, scroll-sync, etc.
 */
export interface TTSEndEvent {
  verseId?: number;
}

/**
 * Error shape. The engine surfaces errors but does not stop on them
 * unless explicitly told to via stop() — minor errors (a single
 * utterance failed) are logged and the queue continues to the next
 * utterance. Catastrophic errors (engine unavailable) raise via
 * onError + return false from isAvailable().
 */
export interface TTSError {
  message: string;
  verseId?: number;
}

export interface TTSEngine {
  /**
   * Returns true if the engine is available on this platform / runtime.
   * Web: SpeechSynthesis present on window.
   * Native: Capacitor plugin loaded.
   * False here means no audio is possible — the player surface
   * gracefully hides the chrome ▶ button and the "Play from here"
   * menu item.
   */
  isAvailable(): boolean;

  /**
   * Returns the list of voices the platform exposes. On the web,
   * voices populate asynchronously (Chrome fires speechSynthesis's
   * `voiceschanged` event after init); this method returns the
   * currently-populated list and the consumer polls / subscribes for
   * updates.
   */
  getVoices(): TTSVoice[];

  /**
   * Subscribe to voice-list changes (web only — voices populate
   * asynchronously). Returns an unsubscribe function. No-op on
   * native.
   */
  onVoicesChanged(handler: () => void): () => void;

  /**
   * Enqueue a single utterance. On the web, this calls
   * speechSynthesis.speak() which queues automatically — multiple
   * speak() calls in sequence play in order.
   */
  speak(text: string, opts?: TTSOptions): void;

  /**
   * Pause the currently-speaking utterance. The queue stays intact;
   * resume() continues from where pause was called. Web's
   * speechSynthesis.pause() has quirks on certain Chrome versions; the
   * web implementation guards against the known-bug states.
   */
  pause(): void;

  /**
   * Resume after pause(). No-op if nothing was paused.
   */
  resume(): void;

  /**
   * Stop the current utterance and clear the queue. No further onEnd
   * events fire for queued utterances after stop().
   */
  stop(): void;

  /**
   * Currently-speaking flag. True after speak() until the onEnd of the
   * last queued utterance fires, or until stop() is called.
   */
  isSpeaking(): boolean;

  /**
   * Subscribe to the end-of-utterance event. Returns an unsubscribe
   * function. The handler receives the TTSEndEvent with the verseId
   * the consumer passed into speak() so the consumer knows which
   * verse finished.
   */
  onEnd(handler: (e: TTSEndEvent) => void): () => void;

  /**
   * Subscribe to error events. Returns an unsubscribe function.
   */
  onError(handler: (e: TTSError) => void): () => void;
}

// ─────────────────────────────────────────────────────────────────────
// Web implementation — SpeechSynthesis API
// ─────────────────────────────────────────────────────────────────────

function createWebTTS(): TTSEngine {
  const endHandlers = new Set<(e: TTSEndEvent) => void>();
  const errorHandlers = new Set<(e: TTSError) => void>();
  const voicesChangedHandlers = new Set<() => void>();

  // Bind voiceschanged once at module init so all subscribers receive
  // the event. Some browsers fire this multiple times during init.
  if (
    typeof window !== "undefined" &&
    typeof window.speechSynthesis !== "undefined"
  ) {
    window.speechSynthesis.addEventListener("voiceschanged", () => {
      for (const h of voicesChangedHandlers) {
        try {
          h();
        } catch {
          // swallow handler exceptions — don't let one subscriber
          // break the broadcast
        }
      }
    });
  }

  return {
    isAvailable(): boolean {
      return (
        typeof window !== "undefined" &&
        typeof window.speechSynthesis !== "undefined" &&
        typeof window.SpeechSynthesisUtterance !== "undefined"
      );
    },

    getVoices(): TTSVoice[] {
      if (!this.isAvailable()) return [];
      const voices = window.speechSynthesis.getVoices();
      return voices.map((v) => ({
        name: v.name,
        lang: v.lang,
        default: v.default,
        localService: v.localService,
      }));
    },

    onVoicesChanged(handler: () => void): () => void {
      voicesChangedHandlers.add(handler);
      return () => voicesChangedHandlers.delete(handler);
    },

    speak(text: string, opts?: TTSOptions): void {
      if (!this.isAvailable()) return;
      const utt = new SpeechSynthesisUtterance(text);

      if (opts?.voiceName) {
        const voices = window.speechSynthesis.getVoices();
        const match = voices.find((v) => v.name === opts.voiceName);
        if (match) utt.voice = match;
      }
      if (opts?.rate !== undefined) utt.rate = opts.rate;
      if (opts?.pitch !== undefined) utt.pitch = opts.pitch;

      utt.addEventListener("end", () => {
        for (const h of endHandlers) {
          try {
            h({ verseId: opts?.verseId });
          } catch {
            // swallow
          }
        }
      });

      utt.addEventListener("error", (e: SpeechSynthesisErrorEvent) => {
        // SpeechSynthesisErrorEvent carries `error` (string code) and
        // implicitly an event-time message. Some browsers fire "canceled"
        // / "interrupted" as errors when the queue is stopped — those
        // are not real errors, just normal termination.
        if (e.error === "canceled" || e.error === "interrupted") return;
        for (const h of errorHandlers) {
          try {
            h({ message: e.error || "speechSynthesis error", verseId: opts?.verseId });
          } catch {
            // swallow
          }
        }
      });

      window.speechSynthesis.speak(utt);
    },

    pause(): void {
      if (!this.isAvailable()) return;
      try {
        window.speechSynthesis.pause();
      } catch {
        // Some Chrome versions throw on pause when nothing's speaking.
      }
    },

    resume(): void {
      if (!this.isAvailable()) return;
      try {
        window.speechSynthesis.resume();
      } catch {
        // No-op if nothing paused.
      }
    },

    stop(): void {
      if (!this.isAvailable()) return;
      window.speechSynthesis.cancel();
    },

    isSpeaking(): boolean {
      if (!this.isAvailable()) return false;
      return (
        window.speechSynthesis.speaking || window.speechSynthesis.pending
      );
    },

    onEnd(handler: (e: TTSEndEvent) => void): () => void {
      endHandlers.add(handler);
      return () => endHandlers.delete(handler);
    },

    onError(handler: (e: TTSError) => void): () => void {
      errorHandlers.add(handler);
      return () => errorHandlers.delete(handler);
    },
  };
}

// ─────────────────────────────────────────────────────────────────────
// Native (Capacitor) implementation — TODO for Phase 10
// ─────────────────────────────────────────────────────────────────────
//
// When Phase 10's Capacitor wrap installs:
//   1. `npm i @capacitor-community/text-to-speech`
//   2. Uncomment the import below.
//   3. Replace the createNativeTTS() stub with the plugin-backed
//      implementation:
//        - getVoices() → TextToSpeech.getSupportedVoices()
//        - speak(text, opts) → TextToSpeech.speak({ text, voice, rate, pitch })
//        - pause() → TextToSpeech.pause() (or stop() depending on plugin
//          version's support matrix; some plugin builds don't expose
//          pause natively).
//        - stop() → TextToSpeech.stop()
//        - onEnd → the plugin's `addListener("end", ...)` if exposed,
//          else fall back to a setTimeout based on duration estimation.
//   4. Test on a real Capacitor build (Android emulator + real iPhone).
//   5. Remove this TODO block once verified.
//
// At S157 the web build does NOT depend on the package; the import
// stays commented so Vite's tree-shaker doesn't fail to resolve it.

// import { TextToSpeech } from "@capacitor-community/text-to-speech";

function createNativeTTS(): TTSEngine {
  // S157 stub — never reached because isCapacitorNative() returns false
  // on the web build. Phase 10 replaces the body with the plugin
  // implementation.
  return {
    isAvailable: () => false,
    getVoices: () => [],
    onVoicesChanged: () => () => {},
    speak: () => {},
    pause: () => {},
    resume: () => {},
    stop: () => {},
    isSpeaking: () => false,
    onEnd: () => () => {},
    onError: () => () => {},
  };
}

// ─────────────────────────────────────────────────────────────────────
// Platform detection + module-level singleton
// ─────────────────────────────────────────────────────────────────────

function isCapacitorNative(): boolean {
  if (typeof window === "undefined") return false;
  // Capacitor injects `window.Capacitor.isNativePlatform()` inside the
  // wrap. The optional-chaining + truthy check is defensive against
  // partial Capacitor injection during development.
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const cap = (window as any).Capacitor;
  return typeof cap?.isNativePlatform === "function"
    ? cap.isNativePlatform()
    : false;
}

let _engine: TTSEngine | null = null;

/**
 * Get the platform-appropriate TTS engine. Singleton — first call
 * binds the engine for the rest of the session. SSR-safe (returns a
 * no-op engine when window is undefined).
 */
export function getTTSEngine(): TTSEngine {
  if (_engine) return _engine;
  if (typeof window === "undefined") {
    // SSR / test environment — return a no-op engine. isAvailable()
    // returns false so consumers gracefully hide the audio surface.
    _engine = {
      isAvailable: () => false,
      getVoices: () => [],
      onVoicesChanged: () => () => {},
      speak: () => {},
      pause: () => {},
      resume: () => {},
      stop: () => {},
      isSpeaking: () => false,
      onEnd: () => () => {},
      onError: () => () => {},
    };
    return _engine;
  }
  _engine = isCapacitorNative() ? createNativeTTS() : createWebTTS();
  return _engine;
}
