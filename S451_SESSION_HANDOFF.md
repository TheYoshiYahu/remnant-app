# S451 handoff — 2026-10-16

Shipped (deploy: bash ~/Desktop/App/_session451_voice_taste_deploy.sh — run it if not yet pushed; `git log -1` shows "S451:" when it has):
- Free / signed-out readers: natural voices in the picker, Michael default,
  verses 1–5 of any chapter in the natural voice, then the invite notice and
  the button shows Play. "Play from here" past verse 5 shows the invite.
  Code: app/src/lib/recordedAudio.ts (access "full" | "sample",
  SAMPLE_VERSES, SAMPLE_NOTICE), App.tsx sets access from hwEntitled,
  TTSError.stopped → setTtsPaused(true).
- Dark-mode read-along highlight fixed (index.css .verse-interactive.tts-spoken).
- Sleep timer: app/src/lib/sleep-timer.ts, picker row in AudioPlayer's ⚙
  modal, countdown + end-of-chapter handling in App.tsx (sleepRef).
- Lock-screen controls: Media Session effect in App.tsx. NOT YET VERIFIED in
  the iOS/Android shells — check on a phone.

Untouched, still uncommitted from Yoshi's earlier audit work (leave alone):
S446_SESSION_HANDOFF.md, _s448_add_extras_text.mjs, restoration-pipeline/,
source-texts/ Enoch + Jasher files, tts/chapters_all.json.

Known: app/src/App.tsx has ~27 pre-existing eslint react-hooks/refs errors
around lines 4750–4820 (not from S451). tsc is clean. The Linux build box
can't run `vite build` (Mac-only rolldown binary) — Render builds on push.

Feature roadmap: S451_APP_FEATURE_ROADMAP.md. Next: S452_SESSION_OPEN_PROMPT.md.
