/**
 * journal-dictation.ts — OPTIONAL in-app speech-to-text for the Voice Journal.
 *
 * IMPORTANT (Block 1 / no native dependency): the journal's PRIMARY "speak"
 * path is the DEVICE KEYBOARD's built-in dictation — the user taps the mic on
 * their keyboard and the OS types into the normal textarea. That needs NO app
 * microphone permission and NO native plugin, so the journal ships web-served
 * with zero Capacitor change.
 *
 * This module is a PROGRESSIVE ENHANCEMENT only: where the browser Web Speech
 * API (window.SpeechRecognition / webkitSpeechRecognition) is available, it
 * offers an extra in-app "Dictate (beta)" button. It is never required — if the
 * API is absent, the UI simply hides the button and the keyboard-mic path
 * covers speaking. No audio leaves the device.
 *
 * BLOCK 2 (future, optional): a dedicated in-app record button backed by the
 * native @capacitor-community/speech-recognition plugin. THAT would require a
 * Capacitor change + mic/speech permission strings (iOS
 * NSMicrophoneUsageDescription / NSSpeechRecognitionUsageDescription; Android
 * RECORD_AUDIO). It is explicitly NOT part of this release and NOT needed —
 * keyboard dictation already provides the speak experience.
 */

export interface Dictation {
  start: () => void;
  stop: () => void;
  readonly supported: boolean;
}

interface DictationCallbacks {
  /** Fires with the best-so-far transcript (interim + final concatenated). */
  onResult: (text: string) => void;
  onError?: (message: string) => void;
  onEnd?: () => void;
}

type SpeechRecognitionLike = {
  lang: string;
  interimResults: boolean;
  continuous: boolean;
  start: () => void;
  stop: () => void;
  onresult: ((e: unknown) => void) | null;
  onerror: ((e: unknown) => void) | null;
  onend: (() => void) | null;
};

function getRecognitionCtor():
  | (new () => SpeechRecognitionLike)
  | null {
  if (typeof window === "undefined") return null;
  const w = window as unknown as {
    SpeechRecognition?: new () => SpeechRecognitionLike;
    webkitSpeechRecognition?: new () => SpeechRecognitionLike;
  };
  return w.SpeechRecognition ?? w.webkitSpeechRecognition ?? null;
}

/** True when the Web Speech API is available in this runtime. */
export function dictationSupported(): boolean {
  return getRecognitionCtor() !== null;
}

/**
 * Create a dictation controller. `supported` is false when no engine is
 * available (the UI should then show type-only). The transcript is delivered
 * incrementally to onResult; the caller appends/replaces into the textarea.
 */
export function createDictation(cb: DictationCallbacks): Dictation {
  const Ctor = getRecognitionCtor();
  if (!Ctor) {
    return { start: () => {}, stop: () => {}, supported: false };
  }
  const rec = new Ctor();
  rec.lang = "en-US";
  rec.interimResults = true;
  rec.continuous = true;

  rec.onresult = (e: unknown) => {
    // SpeechRecognitionEvent shape: results: SpeechRecognitionResultList.
    const ev = e as {
      results: ArrayLike<ArrayLike<{ transcript: string }>>;
    };
    let text = "";
    for (let i = 0; i < ev.results.length; i++) {
      text += ev.results[i][0]?.transcript ?? "";
    }
    cb.onResult(text);
  };
  rec.onerror = (e: unknown) => {
    const msg =
      (e as { error?: string })?.error || "Dictation error. Try again.";
    cb.onError?.(msg);
  };
  rec.onend = () => cb.onEnd?.();

  return {
    start: () => {
      try {
        rec.start();
      } catch {
        /* start() throws if already started — ignore */
      }
    },
    stop: () => {
      try {
        rec.stop();
      } catch {
        /* ignore */
      }
    },
    supported: true,
  };
}
