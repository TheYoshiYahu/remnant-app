/**
 * journal-dictation.ts — speech-to-text for the Voice Journal.
 *
 * Two paths:
 *   WEB (implemented here): the browser Web Speech API
 *   (window.SpeechRecognition / webkitSpeechRecognition). On-device in modern
 *   Chrome/Safari; returns interim + final transcripts via callbacks.
 *
 *   NATIVE (binary-dependent — scaffolded, not wired): on iOS/Android the
 *   on-device engine is @capacitor-community/speech-recognition. That plugin is
 *   the NATIVE piece that must be installed + synced into the Capacitor shells,
 *   and it needs platform permission strings:
 *     - iOS  Info.plist: NSMicrophoneUsageDescription,
 *                        NSSpeechRecognitionUsageDescription
 *     - Android AndroidManifest.xml: <uses-permission RECORD_AUDIO>
 *   See the deploy checklist. Until that's added + the app rebuilt, native
 *   falls back to the Web Speech path inside the webview where available, and
 *   to type-only where it isn't. All dictation is on-device; no audio leaves
 *   the device and nothing is sent to our servers.
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
