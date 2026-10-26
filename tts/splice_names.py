"""S473 — re-record ONLY the verses that carry a name, and splice them into the
chapter recordings already made (Yoshi's idea). For Michael and Olivia, whose
chapters were recorded before the names were settled by ear (S469-S471).

Each chapter's .json already marks where every verse starts. gen_bible.py lays a
chapter out as: heading, 0.6 s pause, then every verse followed by a 0.35 s pause.
So a verse's audio is the stretch from its mark to the next verse's mark. This
script re-speaks the verses whose text carries a name (and the heading, if it
does), swaps each stretch for the new audio + the same pause, shifts the marks
after it, and writes the chapter back. Everything else in the chapter is the
original recording, untouched.

  bash record_splice.sh am_michael                   (all chapters, resumable)
  ... python splice_names.py af_heart --test psalms/1  (one chapter to audio/_splice_test, live file untouched)

Before a chapter is replaced, its original is kept in audio/_redo/<voice>/s473-splice/.
Chapters already done are listed in audio/<voice>/.spliced-s473.txt and skipped.
A chapter whose timing file does not match the current text is not touched; it is
listed in audio/<voice>/.splice-skipped-s473.txt (those need a whole-chapter record).
The upload script re-sends a file when its size changes, so no upload list edits.
"""
import json, os, re, shutil, subprocess, sys, time
import numpy as np
from kokoro_onnx import Kokoro
import names_ipa
from names_ipa import to_phonemes, use_voice, voice_style, voice_lang
try:
    import imageio_ffmpeg; FFMPEG = imageio_ffmpeg.get_ffmpeg_exe()
except Exception:
    FFMPEG = "ffmpeg"

HERE = os.path.dirname(os.path.abspath(__file__))
VOICE = sys.argv[1]
TEST = sys.argv[sys.argv.index("--test") + 1] if "--test" in sys.argv else None
ONLY = sys.argv[sys.argv.index("--only") + 1] if "--only" in sys.argv else TEST
use_voice(VOICE)
AUDIO = os.path.join(HERE, "..", "audio")
OUT = os.path.join(AUDIO, VOICE)
BACK = os.path.join(AUDIO, "_redo", VOICE, "s473-splice")
TESTDIR = os.path.join(AUDIO, "_splice_test", VOICE)
DONE = os.path.join(OUT, ".spliced-s473.txt")
SKIP = os.path.join(OUT, ".splice-skipped-s473.txt")
SR = 24000; SPEED = 0.95; GAP = 0.35
lang = voice_lang(VOICE)

# Every name with a settled pronunciation, plus the speech fixes (LORD'S, GOD, Psalm 23:1...).
keys = set(names_ipa._BASE_IPA) | set(names_ipa.IPA) | set(names_ipa.RESPELL)
keys -= {"live", "Live"}  # "live" (the verb) was already fixed before these recordings
NAME_RX = re.compile(r"(?<![\w'-])(" + "|".join(map(re.escape, sorted(keys, key=len, reverse=True))) + r")(?=(['’]s)?\b)")
FIX_RX = [re.compile(a) for a, _ in names_ipa.SPEECH_FIXES]
def carries_name(t):
    t = t.replace("’", "'").replace("‘", "'")
    return bool(NAME_RX.search(t)) or any(r.search(t) for r in FIX_RX)

k = Kokoro(os.path.join(HERE, "kokoro-v1.0.onnx"), os.path.join(HERE, "voices-v1.0.bin"))
STYLE = voice_style(k, VOICE)
def tts(t):
    s, _ = k.create(to_phonemes(k, t, lang), voice=STYLE, speed=SPEED, lang=lang, is_phonemes=True)
    return s.astype(np.float32)

def decode(mp3):
    raw = subprocess.run([FFMPEG, "-loglevel", "error", "-i", mp3, "-f", "s16le", "-ac", "1", "-ar", str(SR), "-"],
                         capture_output=True, check=True).stdout
    return np.frombuffer(raw, dtype="<i2").astype(np.float32) / 32767

def encode(audio, path):
    pcm = (np.clip(audio, -1, 1) * 32767).astype("<i2").tobytes()
    subprocess.run([FFMPEG, "-loglevel", "error", "-y", "-f", "s16le", "-ar", str(SR), "-ac", "1", "-i", "-",
                    "-c:a", "libmp3lame", "-b:a", "48k", "-f", "mp3", path], input=pcm, check=True)

done = set(open(DONE).read().split()) if os.path.exists(DONE) and not TEST else set()
chs = json.load(open(os.path.join(HERE, "chapters_all.json")))
t0 = time.time(); n_ch = n_v = 0; spoken = 0.0
for c in chs:
    tag = f"{c['book']}/{c['chapter']}"
    if ONLY and tag != ONLY:
        continue
    if tag in done:
        continue
    mp3 = os.path.join(OUT, c["book"], f"{c['chapter']}.mp3"); js = mp3[:-4] + ".json"
    if not (os.path.exists(mp3) and os.path.exists(js)):
        continue  # never recorded: record_bible.sh records it whole, with the new names
    meta = json.load(open(js))
    verses = [v for v in c["verses"] if v["text"].strip()]
    marks = meta["verses"]
    if [m[0] for m in marks] != [v["n"] for v in verses]:
        with open(SKIP, "a") as f: f.write(tag + "  verse numbers differ from the timing file\n")
        continue
    title = c["title"].replace("Book of ", "")
    head = f"Psalm {c['chapter']}." if c["book"] == "psalms" else f"{title}, chapter {c['chapter']}."
    todo = [i for i, v in enumerate(verses) if carries_name(v["text"])]
    redo_head = carries_name(head)
    if not todo and not redo_head:
        if not TEST:
            with open(DONE, "a") as f: f.write(tag + "\n")
        continue
    old = decode(mp3)
    bounds = [int(round(m[1] * SR)) for m in marks] + [len(old)]
    pieces = []
    # heading + its pause: [0, first mark)
    pieces.append(np.concatenate([tts(head), np.zeros(int(SR * 0.6), np.float32)]) if redo_head else old[:bounds[0]])
    new_marks = []
    pos = len(pieces[0])
    for i, v in enumerate(verses):
        if i in todo:
            seg = np.concatenate([tts(v["text"].strip()), np.zeros(int(SR * GAP), np.float32)])
            spoken += len(seg) / SR
        else:
            seg = old[bounds[i]:bounds[i + 1]]
        new_marks.append([v["n"], round(pos / SR, 2)])
        pieces.append(seg); pos += len(seg)
    audio = np.concatenate(pieces)
    meta["verses"] = new_marks; meta["duration"] = round(len(audio) / SR, 2)
    if TEST:
        os.makedirs(TESTDIR, exist_ok=True)
        base = os.path.join(TESTDIR, f"{c['book'].replace('/', '-')}-{c['chapter']}")
        shutil.copy2(mp3, base + "-before.mp3")
        encode(audio, base + "-after.mp3")
        json.dump(meta, open(base + "-after.json", "w"))
        print(f"TEST {tag}: {len(todo)} of {len(verses)} verses re-spoken{' + heading' if redo_head else ''}")
        print("  listen:", base + "-before.mp3", "and", base + "-after.mp3")
        continue
    bdir = os.path.join(BACK, c["book"]); os.makedirs(bdir, exist_ok=True)
    if not os.path.exists(os.path.join(bdir, f"{c['chapter']}.mp3")):
        shutil.copy2(mp3, bdir); shutil.copy2(js, bdir)
    encode(audio, mp3 + ".part")
    json.dump(meta, open(js + ".part", "w"))
    os.replace(mp3 + ".part", mp3); os.replace(js + ".part", js)
    with open(DONE, "a") as f: f.write(tag + "\n")
    n_ch += 1; n_v += len(todo)
    el = time.time() - t0
    print(f"{tag} | {len(todo)}/{len(verses)} verses | {n_ch} chapters, {n_v} verses done | "
          f"new audio {spoken/3600:.2f}h in {el/3600:.2f}h", flush=True)
print("Finished." if not TEST else "")
