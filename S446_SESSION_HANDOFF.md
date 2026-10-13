# S446 handoff (Oct 13, 2026) — continuous play stopping at chapter breaks

## Report
A partner said the audio does not go on to the next chapter in Enoch and Jasher; the first canon books did.

## Causes found
1. Enoch chapters 1 and 10 had no recording in any voice (moved to audio/_redo in S444, never re-recorded). A missing chapter silently switched to the phone's voice, which is silent on the Android build before 1.1.2. Yoshi restarted tts/record_bible.sh am_michael on Oct 13 to fill them; upload with node _s444_upload_audio.mjs after.
2. Only Michael is recorded (George 16 Psalms, Onyx 2, Heart 2); other voices fall back to Michael per chapter. Expected.
3. Real Jasher cause: no background audio on iOS and nothing keeping the screen on. When the phone locks mid-chapter the WebView is suspended, the chapter finishes, nothing starts the next one. Jasher chapters are 5–9 min so it locks almost every time.

## Changes (web — ships with the next Render push; the shells load the live site)
- app/src/lib/wakeLock.ts (new): Screen Wake Lock while the player is open; re-acquired on visibilitychange.
- app/src/App.tsx: keepScreenAwake() when a chapter run starts, allowScreenSleep() on player close; ttsNotice state fed from engine.onError and passed to AudioPlayer.
- app/src/components/AudioPlayer.tsx: `notice` prop shown in place of the verse reference.
- app/src/lib/recordedAudio.ts: when no recording exists in any voice, emit "No natural-voice recording for this chapter yet. Using the phone's voice." before falling back (was silent).

## Changes (iOS native — needs a new App Store build, 1.1.3 / build 14)
- ios/App/App/Info.plist: UIBackgroundModes = [audio].
- ios/App/App/AppDelegate.swift: AVAudioSession .playback / .spokenAudio, set active at launch.
- project.pbxproj: MARKETING_VERSION 1.1.3, CURRENT_PROJECT_VERSION 14.
Android needs no native change for this (Wake Lock API is in the WebView).

## To verify on a phone
Play a Jasher chapter, lock the phone, wait for the chapter to end: the next chapter should start (iOS needs the 1.1.3 build; Android only needs the web push). Play Enoch 9 before the re-upload lands: the bar should read the "No natural-voice recording" notice instead of going quiet.

## Phone tests (Oct 13, 3:30 PM, before the web push)
- iPhone: audio keeps playing after lock, but STOPS at the chapter break. Confirms the 1.1.3 build (background audio) is needed.
- Android: at the chapter break with the phone locked, it switches to the phone's robot voice until unlocked and replayed. Likely the timing-JSON fetch (or audio.play) fails while locked, so startBatch falls to the device engine.
- Both stores: 1.1.2 is published.

## S447 (Oct 13, 3:45 PM) — Android fix, written and deployed with _session447_deploy.sh
Cause: at the chapter break the chapter text came from the IndexedDB cache, but the timing JSON had to be fetched from R2; with the phone locked that fetch failed and startBatch fell through to the phone's voice.
- recordedAudio.ts: loadTiming tells a 404 (truly unrecorded → S446 notice + device voice) from a network failure (→ "Couldn't reach the recording. Tap play to try again.", no voice switch; play re-runs the same chapter). Retries ~12 s with backoff.
- recordedAudio.ts: prefetch now holds the next chapter's MP3 in memory as a blob (two at most) and plays from it, so the break needs no network.
- App.tsx: queueChapterFromVerse also warms the next chapter's text (and the next book's chapter list across a book boundary) through readThrough.
- Still to do: Xcode archive + submit 1.1.3 (iOS background audio); upload audio after the Jasher redo. Open question (c) above still unconfirmed.
