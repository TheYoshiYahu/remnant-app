/**
 * AudioPlayer — Session 157, Phase 9.4 launch-blocker.
 *
 * Bottom-pinned slide-up bar for the Free-tier native-OS TTS audio
 * narration. Locked per DESIGN_LANGUAGE.md §25.
 *
 * Composition top-to-bottom:
 *   - Single-row controls bar pinned to bottom of viewport.
 *     [Prev] [Play/Pause] [Next] | "{Book} {ch}:{v}" | [Speed] [Voice ⚙] [✕]
 *   - Voice picker is a modal that opens over the player when the
 *     gear icon is tapped — shows the top 3–5 ranked English voices
 *     with per-row preview buttons, with the rest hidden behind a
 *     "More voices…" expander.
 *
 * Not a modal — the player is a persistent control surface that
 * doesn't block reading behind it. z-30 sits above the verse content
 * but below the modal stack (§22 NotesPanel, §23 SearchModal, §20
 * VerseActionMenu all open at z-40+).
 *
 * Visual register matches §1 + §22: black surface, bordered-chrome
 * controls in the same family as picker selects / theme toggle /
 * subscription CTA. Voice picker modal mirrors the §22 / §23 / §24
 * bordered-chrome modal family.
 *
 * V1 controls (per §25 defaultable surface):
 *   - 4-step speed picker (0.75× / 1.0× / 1.25× / 1.5×).
 *   - Voice picker with curated top-3 + "More voices…" expander.
 *   - Prev/Next verse skip (single-step; chapter-jump uses §19 nav).
 *   - Play/Pause toggle.
 *   - Close button — stops audio and hides player.
 */

import { useEffect, useState } from "react";
import {
  SPEED_VALUES,
  filterEnglishVoices,
  rankVoices,
  type TTSPrefs,
} from "../lib/tts-helpers";
import type { TTSVoice } from "../lib/tts";

interface AudioPlayerProps {
  /** Whether the audio engine is currently speaking. */
  playing: boolean;
  /** Reference label for the verse currently being narrated. */
  currentVerseRef: string | null;
  /** Full voice list from the TTS engine. */
  voices: TTSVoice[];
  /** Current preferences (voice + rate). */
  prefs: TTSPrefs;
  /** Toggle play / pause. */
  onPlayPause: () => void;
  /** Skip to previous verse. Null when there's no prev verse. */
  onPrev: (() => void) | null;
  /** Skip to next verse. Null when there's no next verse (chapter edge). */
  onNext: (() => void) | null;
  /** Save preferences (called on voice change or rate change). */
  onPrefsChange: (prefs: TTSPrefs) => void;
  /** Preview a candidate voice on tap (used in the voice picker). */
  onPreviewVoice: (voiceName: string) => void;
  /** Close the player. Caller stops audio + hides the bar. */
  onClose: () => void;
}

const PREVIEW_PHRASE =
  "In the beginning Elohim created the heavens and the earth";

export default function AudioPlayer({
  playing,
  currentVerseRef,
  voices,
  prefs,
  onPlayPause,
  onPrev,
  onNext,
  onPrefsChange,
  onPreviewVoice,
  onClose,
}: AudioPlayerProps) {
  const [voicePickerOpen, setVoicePickerOpen] = useState(false);

  // Spacebar play/pause when player has focus and no other input is
  // focused (per §25 keyboard accessibility).
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      const target = e.target as HTMLElement | null;
      const tag = target?.tagName.toLowerCase();
      if (
        tag === "input" ||
        tag === "textarea" ||
        tag === "select" ||
        target?.isContentEditable
      ) {
        return;
      }
      if (e.key === " " || e.key === "Spacebar") {
        e.preventDefault();
        onPlayPause();
      }
      if (e.key === "Escape" && !voicePickerOpen) {
        e.preventDefault();
        onClose();
      }
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onPlayPause, onClose, voicePickerOpen]);

  function handleSpeedChange(newRate: number) {
    onPrefsChange({ ...prefs, rate: newRate });
  }

  function handleVoiceChange(voiceName: string) {
    onPrefsChange({ ...prefs, voiceName });
    setVoicePickerOpen(false);
  }

  return (
    <>
      <div
        className="fixed bottom-0 left-0 right-0 z-30 border-t border-[var(--reader-rule)] bg-[var(--reader-surface)] shadow-2xl"
        role="region"
        aria-label="Audio narration player"
      >
        <div className="mx-auto flex max-w-3xl items-center gap-2 px-3 py-2 sm:gap-3 sm:px-4">
          {/* Skip prev verse. */}
          <button
            type="button"
            onClick={onPrev ?? undefined}
            disabled={!onPrev}
            aria-label="Skip back one verse"
            className="flex h-11 w-11 items-center justify-center rounded border border-[var(--reader-rule)] text-[var(--reader-text)] disabled:opacity-40"
          >
            ⏮
          </button>

          {/* Play / pause. */}
          <button
            type="button"
            onClick={onPlayPause}
            aria-pressed={playing}
            aria-label={playing ? "Pause narration" : "Play narration"}
            className="flex h-11 w-11 items-center justify-center rounded border border-[var(--reader-rule)] bg-[var(--reader-accent)] text-[var(--reader-bg)]"
          >
            {playing ? "⏸" : "▶"}
          </button>

          {/* Skip next verse. */}
          <button
            type="button"
            onClick={onNext ?? undefined}
            disabled={!onNext}
            aria-label="Skip forward one verse"
            className="flex h-11 w-11 items-center justify-center rounded border border-[var(--reader-rule)] text-[var(--reader-text)] disabled:opacity-40"
          >
            ⏭
          </button>

          {/* Current verse reference (flex-grow center region). */}
          <div className="min-w-0 flex-1 truncate text-center text-base text-[var(--reader-text)] sm:text-left">
            {currentVerseRef ?? "—"}
          </div>

          {/* Speed picker. */}
          <select
            value={prefs.rate}
            onChange={(e) => handleSpeedChange(Number(e.target.value))}
            aria-label="Playback speed"
            className="h-11 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 text-base text-[var(--reader-text)]"
          >
            {SPEED_VALUES.map((s) => (
              <option key={s} value={s}>
                {s}×
              </option>
            ))}
          </select>

          {/* Voice picker (opens modal). */}
          <button
            type="button"
            onClick={() => setVoicePickerOpen(true)}
            aria-label="Choose voice"
            className="flex h-11 w-11 items-center justify-center rounded border border-[var(--reader-rule)] text-[var(--reader-text)]"
          >
            ⚙
          </button>

          {/* Close. */}
          <button
            type="button"
            onClick={onClose}
            aria-label="Close audio player"
            className="flex h-11 w-11 items-center justify-center text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
          >
            ✕
          </button>
        </div>
      </div>

      {/* Voice picker modal. */}
      {voicePickerOpen && (
        <VoicePickerModal
          voices={voices}
          currentVoiceName={prefs.voiceName}
          onPick={handleVoiceChange}
          onPreview={onPreviewVoice}
          onClose={() => setVoicePickerOpen(false)}
        />
      )}
    </>
  );
}

// ─────────────────────────────────────────────────────────────────────
// VoicePickerModal — curated picker per §25 voice-selection lock
// ─────────────────────────────────────────────────────────────────────

interface VoicePickerModalProps {
  voices: TTSVoice[];
  currentVoiceName: string | null;
  onPick: (voiceName: string) => void;
  onPreview: (voiceName: string) => void;
  onClose: () => void;
}

function VoicePickerModal({
  voices,
  currentVoiceName,
  onPick,
  onPreview,
  onClose,
}: VoicePickerModalProps) {
  const [showAll, setShowAll] = useState(false);

  const ranked = rankVoices(filterEnglishVoices(voices));
  const top = ranked.slice(0, 5);
  const rest = ranked.slice(5);

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") {
        e.preventDefault();
        onClose();
      }
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  return (
    <div
      className="fixed inset-0 z-40 flex items-end justify-center bg-black/40 p-0 sm:items-center sm:p-4"
      onClick={onClose}
      role="dialog"
      aria-label="Choose narration voice"
    >
      <div
        className="flex max-h-[80vh] w-full max-w-2xl flex-col overflow-hidden rounded-t-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] shadow-xl sm:rounded-lg"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-baseline justify-between border-b border-[var(--reader-rule)] px-4 py-3">
          <h2 className="text-lg font-semibold">Voice</h2>
          <button
            type="button"
            className="ml-2 text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
            onClick={onClose}
            aria-label="Close"
          >
            ✕
          </button>
        </div>

        <div className="flex-1 overflow-y-auto">
          {ranked.length === 0 && (
            <div className="px-4 py-6 text-center text-[var(--reader-muted)]">
              No voices available on this device.
            </div>
          )}

          {top.length > 0 && (
            <ul className="divide-y divide-[var(--reader-rule)]">
              {top.map((v) => (
                <VoiceRow
                  key={v.name}
                  voice={v}
                  selected={v.name === currentVoiceName}
                  onPick={onPick}
                  onPreview={onPreview}
                />
              ))}
            </ul>
          )}

          {rest.length > 0 && !showAll && (
            <button
              type="button"
              onClick={() => setShowAll(true)}
              className="block w-full border-t border-[var(--reader-rule)] px-4 py-3 text-left text-base text-[var(--reader-accent)]"
            >
              More voices… ({rest.length})
            </button>
          )}

          {rest.length > 0 && showAll && (
            <ul className="divide-y divide-[var(--reader-rule)] border-t border-[var(--reader-rule)]">
              {rest.map((v) => (
                <VoiceRow
                  key={v.name}
                  voice={v}
                  selected={v.name === currentVoiceName}
                  onPick={onPick}
                  onPreview={onPreview}
                />
              ))}
            </ul>
          )}
        </div>

        <div className="border-t border-[var(--reader-rule)] px-4 py-3 text-sm text-[var(--reader-muted)]">
          Preview reads: <span className="italic">{PREVIEW_PHRASE}</span>
        </div>
      </div>
    </div>
  );
}

interface VoiceRowProps {
  voice: TTSVoice;
  selected: boolean;
  onPick: (voiceName: string) => void;
  onPreview: (voiceName: string) => void;
}

function VoiceRow({ voice, selected, onPick, onPreview }: VoiceRowProps) {
  return (
    <li className="flex items-center gap-2 px-4 py-3">
      <button
        type="button"
        onClick={() => onPick(voice.name)}
        className={`flex-1 text-left text-base ${
          selected
            ? "font-semibold text-[var(--reader-accent)]"
            : "text-[var(--reader-text)]"
        }`}
        aria-pressed={selected}
      >
        {voice.name}
        <span className="ml-2 text-xs text-[var(--reader-muted)]">
          {voice.lang}
        </span>
      </button>
      <button
        type="button"
        onClick={() => onPreview(voice.name)}
        className="rounded border border-[var(--reader-rule)] px-3 py-1 text-sm text-[var(--reader-text)]"
        aria-label={`Preview ${voice.name}`}
      >
        Preview
      </button>
    </li>
  );
}
