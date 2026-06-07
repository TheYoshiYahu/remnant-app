#!/usr/bin/env python3
"""S209 — Apple App Store screenshot builder.

Rebuilds the 8 S208 Play-listing assets (4 labeled collages + 4 framed
singles, same banners, same source screenshots) at Apple's required
dimensions:

    6.9" display: 1290 x 2796  ->  final/69/
    6.5" display: 1242 x 2688  ->  final/65/

Sources are the S207 phone captures in ../play-store-screenshots/
(904x2316 JPEG). Android status bar (top) and gesture-nav bar (bottom)
are cropped so no Android chrome appears in App Store assets.

Panel -> source mapping recovered at S209 by interior-band template
matching against the S208 finals (cv2 TM_CCOEFF_NORMED; see the S209
runbook session log). Every one of the 16 sources is used exactly
once. All 16 panel/source pairs verified by band match (centers score
0.70-0.99 at the canonical center position; sides 0.64-0.82 at their
side positions; wrong pairs score < 0.46).

Run:  python3 build_appstore_collages.py
"""
import os
from PIL import Image, ImageDraw, ImageFont, ImageFilter, ImageEnhance

HERE = os.path.dirname(os.path.abspath(__file__))
SRC = os.path.join(HERE, "..", "play-store-screenshots")
BG = (8, 8, 10)
GOLD = (212, 175, 90)
SERIF = "/usr/share/fonts/truetype/liberation/LiberationSerif-Bold.ttf"

# Android chrome crop (source pixels at 904x2316)
TOP_CROP, BOT_CROP = 72, 132

SHOT = lambda n: os.path.join(SRC, f"1000{n}.jpg")
LIGHT = os.path.join(SRC, "Screenshot_20260607_094016_Remnant of Promise.jpg")

ASSETS = [
    ("01_mark_verses_12_colors", "Outline, fill, or highlight —|12 colors you can name",
     ("collage", SHOT("015985"), SHOT("015996"), SHOT("015998"))),
    ("02_strongs_interlinear_lexicon", "Tap any word — Strong's,|interlinear & full lexicon",
     ("collage", SHOT("016000"), SHOT("016002"), SHOT("016006"))),
    ("03_crossrefs_witness_kingdom", "Cross-references, the Witness,|and the Kingdom companion",
     ("collage", SHOT("015976"), SHOT("015980"), SHOT("015978"))),
    ("04_my_study_notes", "Notes, bookmarks, highlights —|your study, organized",
     ("collage", SHOT("015982"), SHOT("016004"), SHOT("016008"))),
    ("05_restored_names_reading", "Restored names,|distraction-free reading",
     ("single", SHOT("016012"))),
    ("06_english_helpers", "English helpers,|one tap away",
     ("single", SHOT("016010"))),
    ("07_six_study_layers", "Six study layers — show|only what you need",
     ("single", SHOT("015974"))),
    ("08_home_light_mode", "The complete study Bible,|light or dark",
     ("single", LIGHT)),
]

def load_cropped(path):
    im = Image.open(path).convert("RGB")
    w, h = im.size
    return im.crop((0, TOP_CROP, w, h - BOT_CROP))

def rounded_phone(src, height, dim=1.0, radius_frac=0.055):
    """Scale a cropped capture to `height`, round corners, add a thin frame."""
    w = int(round(height * src.width / src.height))
    im = src.resize((w, height), Image.LANCZOS)
    if dim < 1.0:
        im = ImageEnhance.Brightness(im).enhance(dim)
    r = int(height * radius_frac)
    mask = Image.new("L", (w, height), 0)
    d = ImageDraw.Draw(mask)
    d.rounded_rectangle([0, 0, w - 1, height - 1], radius=r, fill=255)
    frame = Image.new("RGB", (w, height), (60, 58, 54))
    d2 = ImageDraw.Draw(frame)
    inset = max(3, height // 350)
    d2.rounded_rectangle([inset, inset, w - 1 - inset, height - 1 - inset],
                         radius=r - inset, fill=(0, 0, 0))
    frame.paste(im, (0, 0),
                mask.resize((w, height)).point(lambda p: 255 if p == 255 else 0))
    # re-composite: keep frame ring, content inside
    out = Image.new("RGB", (w, height), (60, 58, 54))
    inner = im.crop((inset, inset, w - inset, height - inset))
    out.paste(inner, (inset, inset))
    return out, mask

def paste_phone(canvas, phone, mask, x, y, shadow=True):
    if shadow:
        sh = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
        sd = ImageDraw.Draw(sh)
        sd.rounded_rectangle([x - 14, y - 8, x + phone.width + 14, y + phone.height + 22],
                             radius=int(phone.height * 0.055), fill=(0, 0, 0, 160))
        sh = sh.filter(ImageFilter.GaussianBlur(18))
        canvas.alpha_composite(sh)
    canvas.paste(phone, (x, y), mask)

def banner(canvas, text, W, scale):
    d = ImageDraw.Draw(canvas)
    size = int(74 * scale)
    font = ImageFont.truetype(SERIF, size)
    lines = text.split("|")
    y = int(140 * scale)
    for ln in lines:
        bb = d.textbbox((0, 0), ln, font=font)
        d.text(((W - (bb[2] - bb[0])) / 2 - bb[0], y), ln, font=font, fill=(245, 240, 230))
        y += int(size * 1.32)
    # gold rule + diamond ornament
    cy = y + int(34 * scale)
    half = int(150 * scale)
    for x0, x1 in [(W // 2 - half, W // 2 - int(22 * scale)),
                   (W // 2 + int(22 * scale), W // 2 + half)]:
        d.line([(x0, cy), (x1, cy)], fill=GOLD, width=max(2, int(3 * scale)))
    s = int(10 * scale)
    d.polygon([(W // 2, cy - s), (W // 2 + s, cy), (W // 2, cy + s), (W // 2 - s, cy)], fill=GOLD)
    return cy + int(50 * scale)

def glow(canvas, W, H):
    g = Image.new("L", (W // 8, H // 8), 0)
    gd = ImageDraw.Draw(g)
    gd.ellipse([W // 32, H // 24, W // 8 - W // 32, H // 8 - H // 48], fill=26)
    g = g.resize((W, H)).filter(ImageFilter.GaussianBlur(120))
    warm = Image.new("RGB", (W, H), (46, 38, 24))
    canvas.paste(Image.composite(warm, canvas.convert("RGB"), g).convert("RGBA"), (0, 0))

def build(name, title, spec, W, H, outdir):
    canvas = Image.new("RGBA", (W, H), BG + (255,))
    glow(canvas, W, H)
    scale = W / 1080
    top = banner(canvas, title, W, scale)
    avail = H - top - int(90 * scale)
    if spec[0] == "collage":
        l, c, r = (load_cropped(p) for p in spec[1:])
        ch = int(avail * 0.92)
        sh_ = int(ch * 0.84)
        cph, cmask = rounded_phone(c, ch)
        lph, lmask = rounded_phone(l, sh_, dim=0.55)
        rph, rmask = rounded_phone(r, sh_, dim=0.55)
        cy0 = top + (avail - ch) // 2
        sy0 = top + (avail - sh_) // 2
        cx0 = (W - cph.width) // 2
        margin = int(40 * scale)
        paste_phone(canvas, lph, lmask, margin, sy0)
        paste_phone(canvas, rph, rmask, W - margin - rph.width, sy0)
        paste_phone(canvas, cph, cmask, cx0, cy0)
    else:
        s = load_cropped(spec[1])
        ph = int(avail * 0.97)
        phone, mask = rounded_phone(s, ph)
        if phone.width > W - int(160 * scale):
            ph = int((W - int(160 * scale)) * s.height / s.width)
            phone, mask = rounded_phone(s, ph)
        paste_phone(canvas, phone, mask, (W - phone.width) // 2, top + (avail - ph) // 2)
    out = canvas.convert("RGB")
    out.save(os.path.join(outdir, name + ".png"))
    print(f"  {name}.png  {out.size[0]}x{out.size[1]}")

if __name__ == "__main__":
    for tag, (W, H) in {"69": (1290, 2796), "65": (1242, 2688)}.items():
        outdir = os.path.join(HERE, "final", tag)
        os.makedirs(outdir, exist_ok=True)
        print(f"== {tag}  {W}x{H} ==")
        for name, title, spec in ASSETS:
            build(name, title, spec, W, H, outdir)
    print("done")
