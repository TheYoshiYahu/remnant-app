import json, os, sys, time, subprocess, numpy as np
from kokoro_onnx import Kokoro
from names_ipa import to_phonemes, use_voice, voice_style, voice_lang
try:
    import imageio_ffmpeg; FFMPEG=imageio_ffmpeg.get_ffmpeg_exe()
except Exception:
    FFMPEG="ffmpeg"
HERE=os.path.dirname(os.path.abspath(__file__))
VOICE=sys.argv[1]; ORDER=sys.argv[2] if len(sys.argv)>2 else "priority"
use_voice(VOICE)
OUT=os.path.join(os.path.dirname(os.path.abspath(__file__)),"..","audio",VOICE)
k=Kokoro(os.path.join(HERE,"kokoro-v1.0.onnx"),os.path.join(HERE,"voices-v1.0.bin"))
lang=voice_lang(VOICE); STYLE=voice_style(k,VOICE)
SR=24000; SPEED=0.95
chs=json.load(open(sys.argv[3] if len(sys.argv)>3 else os.path.join(HERE,"chapters_all.json")))
pri=["psalms","enoch/1-enoch","jubilees/jubilees","jasher/jasher","john","matthew","mark","luke","genesis","proverbs","acts","romans","isaiah"]
if ORDER=="priority":
    chs=sorted(chs,key=lambda c:(pri.index(c["book"]) if c["book"] in pri else len(pri)))
def tts(t):
    ph=to_phonemes(k,t,lang)
    s,_=k.create(ph,voice=STYLE,speed=SPEED,lang=lang,is_phonemes=True); return s.astype(np.float32)
def pause(sec): return np.zeros(int(SR*sec),dtype=np.float32)
done=0;t0=time.time();aud=0
for c in chs:
    d=f"{OUT}/{c['book']}"; os.makedirs(d,exist_ok=True)
    mp3=f"{d}/{c['chapter']}.mp3"
    if os.path.exists(mp3) and os.path.exists(mp3[:-4]+".json"): continue
    title=c['title'].replace("Book of ","")
    head = f"Psalm {c['chapter']}." if c["book"]=="psalms" else f"{title}, chapter {c['chapter']}."
    parts=[tts(head),pause(0.6)]; pos=sum(len(p) for p in parts)/SR; marks=[]
    for v in c["verses"]:
        txt=v["text"].strip()
        if not txt: continue
        a=tts(txt); marks.append([v["n"],round(pos,2)]); parts+=[a,pause(0.35)]; pos+= (len(a)+int(SR*0.35))/SR
    audio=np.concatenate(parts); audio=np.clip(audio,-1,1)
    pcm=(audio*32767).astype("<i2").tobytes()
    tmp=mp3+".part"
    subprocess.run([FFMPEG,"-loglevel","error","-y","-f","s16le","-ar",str(SR),"-ac","1","-i","-","-c:a","libmp3lame","-b:a","48k","-f","mp3",tmp],input=pcm,check=True)
    json.dump({"voice":VOICE,"book":c["book"],"chapter":c["chapter"],"duration":round(len(audio)/SR,2),"verses":marks},open(mp3[:-4]+".json","w"))
    os.replace(tmp,mp3)
    done+=1; aud+=len(audio)/SR
    el=time.time()-t0
    print(f"{c['book']} {c['chapter']} | {done} done | audio {aud/3600:.2f}h in {el/3600:.2f}h | x{aud/el:.2f}",flush=True)
