#!/usr/bin/env python3
"""
ocr_charles_vol1.py
-------------------
Tesseract re-OCR front-end for the Charles 1913 vol 1 PDF.

Session-25 finding: the vol-1 PDF (`~/Downloads/charles-1913-vol1.pdf`,
archive.org/details/apocryphapseudep01char BYU upload, May 2026) carries a
text layer that is 100% Greek-glyph OCR drift across body pages (verified
session 25: 0 ASCII letters / 2970+ Greek letters per page raw). This makes
the standard `PdfReader.extract_text()` path used in `parse_charles_pseudepigrapha.py`
(vol 2 extractor) unusable for vol 1.

The PDF embeds the original 300dpi page-image scans alongside the corrupt
text layer. Re-OCR'ing those images with tesseract returns clean ASCII
(verified session 25 on pp 30/100/350/650: 4172-4629 ASCII letters per page,
0 Greek letters). This module wraps that re-OCR pipeline with a per-page
disk cache so the ~50-55 min full-volume cost is paid once and amortized
across subsequent extractor runs.

Usage:
    # Build the cache (idempotent; skips already-OCR'd pages):
    python ocr_charles_vol1.py --build-cache
    python ocr_charles_vol1.py --build-cache --start 21 --end 50
    python ocr_charles_vol1.py --build-cache --parallel 4

    # Read a single page (returns cached if present, OCRs on miss):
    python ocr_charles_vol1.py --page 30

Cache layout:
    ~/Desktop/App/source-texts/apocrypha-charles-vol1/ocr-cache/p<NNNN>.txt
    Each file = full plain-text OCR output for that PDF page (1-indexed).

Programmatic API:
    from ocr_charles_vol1 import ocr_page, ocr_pages
    text = ocr_page(30)                      # single page
    texts = ocr_pages(range(21, 51))         # list of texts in order
"""

from __future__ import annotations
import argparse
import os
import subprocess
import sys
import tempfile
import time
from multiprocessing import Pool


def _resolve_root() -> str:
    if os.environ.get("APP_ROOT"):
        return os.environ["APP_ROOT"]
    host = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host):
        return host
    script_dir = os.path.dirname(os.path.abspath(__file__))
    return os.path.dirname(script_dir)


ROOT = _resolve_root()


def _resolve_pdf_path() -> str:
    env = os.environ.get("CHARLES_VOL1_PDF")
    if env and os.path.exists(env):
        return env
    candidates = [
        os.path.expanduser("~/Downloads/charles-1913-vol1.pdf"),
        "/Users/mtm/Downloads/charles-1913-vol1.pdf",
        "/sessions/focused-friendly-heisenberg/mnt/Downloads/charles-1913-vol1.pdf",
    ]
    for p in candidates:
        if os.path.exists(p):
            return p
    return candidates[0]  # default, will raise on open if missing


PDF_PATH = _resolve_pdf_path()
CACHE_DIR = os.path.join(ROOT, "source-texts", "apocrypha-charles-vol1", "ocr-cache")
os.makedirs(CACHE_DIR, exist_ok=True)

OCR_LANG = os.environ.get("CHARLES_VOL1_OCR_LANG", "eng")
OCR_PSM = os.environ.get("CHARLES_VOL1_OCR_PSM", "4")    # PSM 4: single column of text of variable sizes
OCR_DPI = int(os.environ.get("CHARLES_VOL1_OCR_DPI", "240"))  # 240 balances speed vs accuracy on serif print
OCR_TIMEOUT_S = int(os.environ.get("CHARLES_VOL1_OCR_TIMEOUT", "75"))

# Parallel-column detection (session-26 vol1-h)
#
# The first cut tried a vertical-rule signal (the tallest dark column near the
# midpoint must exceed some height threshold). That fails for Charles 1913 vol 1
# because the parallel-text layout uses a WHITESPACE GUTTER, not a printed rule.
# The actual signal is the OPPOSITE: at the page midpoint, the dark-pixel count
# DIPS substantially compared to the body's typical column density. The
# midpoint-dip ratio gives clean separation across pp 15-77 (front-matter +
# 1 Esd body): parallel pages 0.14-0.61, flat pages 0.70-0.90. Threshold 0.65.
DETECT_DPI = int(os.environ.get("CHARLES_VOL1_DETECT_DPI", "100"))  # 100 DPI for sharper dark-count signal
DETECT_PIXEL_THRESHOLD = int(os.environ.get("CHARLES_VOL1_DETECT_PIXEL_THRESHOLD", "200"))  # < 200 = dark (catches anti-aliased text)
DETECT_BAND_HALF_FRAC = float(os.environ.get("CHARLES_VOL1_DETECT_BAND", "0.05"))  # ±5% of width around midpoint
DETECT_BODY_INSET_FRAC = float(os.environ.get("CHARLES_VOL1_DETECT_BODY_INSET", "0.15"))  # body band = 15-85% of width
DETECT_MIN_TYPICAL = int(os.environ.get("CHARLES_VOL1_DETECT_MIN_TYPICAL", "30"))  # below this, page is near-blank
DETECT_RATIO_THRESHOLD = float(os.environ.get("CHARLES_VOL1_DETECT_RATIO", "0.65"))  # ratio below = parallel

# Sentinel-versioned cache (session-26 vol1-h). Cache files now carry a first-line
# sentinel describing how the text was produced. Pre-session-26 cache files
# (session-25, ~81 pages) lack the sentinel and are treated as "unmarked"; on
# read they get checked for high `|`-ratio (indicates flat OCR on a parallel
# page) and re-OCR'd as left-half if so.
_SENTINEL_FLAT = "# CHARLES_VOL1_OCR_V2_FLAT"
_SENTINEL_LEFT = "# CHARLES_VOL1_OCR_V2_LEFT_HALF"
# Threshold: if an unmarked cache file has `|` on this fraction of content lines,
# we treat it as a stale flat-OCR'd parallel page and re-OCR as left-half.
_UNMARKED_PIPE_RATIO_TRIGGER = 0.20

# When using multiprocessing, restrict each tesseract subprocess to a single
# OMP thread so parallel workers don't over-subscribe the 4-CPU sandbox.
os.environ.setdefault("OMP_THREAD_LIMIT", "1")


def _cache_path(page_1idx: int) -> str:
    return os.path.join(CACHE_DIR, f"p{page_1idx:04d}.txt")


def _flat_pipe_ratio(text: str) -> float:
    """Fraction of content lines (non-blank) that contain a `|` character.
    Session-25's heuristic for tesseract-preserved parallel-column separators."""
    lines = [ln for ln in text.split("\n") if ln.strip()]
    if not lines:
        return 0.0
    return sum(1 for ln in lines if "|" in ln) / len(lines)


def _read_cache(page_1idx: int) -> tuple[str, str] | None:
    """Read a cache file. Returns (mode, text) or None.
    mode is one of: 'flat', 'left', 'unmarked' (pre-v2, no sentinel)."""
    cache = _cache_path(page_1idx)
    if not os.path.exists(cache):
        return None
    with open(cache, "r", encoding="utf-8") as f:
        content = f.read()
    nl = content.find("\n")
    first = content[:nl] if nl >= 0 else content
    rest = content[nl + 1:] if nl >= 0 else ""
    s = first.strip()
    if s == _SENTINEL_FLAT:
        return ("flat", rest)
    if s == _SENTINEL_LEFT:
        return ("left", rest)
    return ("unmarked", content)


def _write_cache(page_1idx: int, mode: str, text: str) -> None:
    """Write a cache file with a mode sentinel header line."""
    sentinel = _SENTINEL_LEFT if mode == "left" else _SENTINEL_FLAT
    cache = _cache_path(page_1idx)
    with open(cache, "w", encoding="utf-8") as f:
        f.write(f"{sentinel}\n{text}")


def detect_parallel_column(page_1idx: int, lo_dpi: int | None = None) -> bool:
    """Detect whether a PDF page has a parallel-column layout (vol1-h fix).

    Charles 1913 vol 1's parallel-text pages use a WHITESPACE GUTTER between
    the apocryphal-column and canonical-column (no printed vertical rule).
    Detection therefore looks for a midpoint DIP in dark-pixel column counts:

      typical = median(dark_per_column[15% ... 85% of width])
      cmin    = min(dark_per_column[midpoint ± 5% of width])
      ratio   = cmin / typical

    Across 1 Esd body pp 44-77 plus front-matter pp 15-30:
      parallel pages: ratio ≤ 0.61
      flat pages:     ratio ≥ 0.70
    Clean separation. Threshold: 0.65.

    Returns True if the page is parallel-column (left half = apocryphal text,
    right half = canonical text that we are dropping per Yoshi's session-25
    locked decision).
    """
    try:
        import numpy as np
    except Exception:
        return False
    pix = _render_pixmap(page_1idx, dpi=lo_dpi or DETECT_DPI)
    w, h = pix.width, pix.height
    samples = pix.samples
    n_components = len(samples) // (w * h) if w and h else 1
    if n_components == 1:
        arr = bytes_to_numpy_gray(samples, h, w)
    else:
        # Render as grayscale via the colorspace argument is the cleaner path,
        # but if a multi-component pixmap was passed, average channels.
        full = bytes_to_numpy_rgb(samples, h, w, n_components)
        arr = full.mean(axis=2).astype("uint8")
    # Dark threshold at 200 (not 128) — catches anti-aliased text bodies.
    dark = (arr < DETECT_PIXEL_THRESHOLD).sum(axis=0)
    if w < 50 or h < 50:
        return False
    mid = w // 2
    band_half = max(3, int(w * DETECT_BAND_HALF_FRAC))
    band_lo = max(0, mid - band_half)
    band_hi = min(w, mid + band_half)
    body_lo = int(w * DETECT_BODY_INSET_FRAC)
    body_hi = int(w * (1.0 - DETECT_BODY_INSET_FRAC))
    if body_hi <= body_lo:
        return False
    typical = float(np.median(dark[body_lo:body_hi]))
    if typical < DETECT_MIN_TYPICAL:
        return False  # near-blank or near-empty page
    cmin = float(dark[band_lo:band_hi].min())
    ratio = cmin / typical
    return ratio < DETECT_RATIO_THRESHOLD


def _render_pixmap(page_1idx: int, dpi: int, clip=None):
    """Render a PDF page (or a clip rect) at the given DPI. Returns a fitz Pixmap.
    Grayscale colorspace is used for detection-DPI renders to halve the byte count.
    """
    import fitz
    doc = fitz.open(PDF_PATH)
    try:
        page = doc.load_page(page_1idx - 1)
        cs = fitz.csGRAY if dpi <= DETECT_DPI else None
        kwargs = {"dpi": dpi}
        if cs is not None:
            kwargs["colorspace"] = cs
        if clip is not None:
            kwargs["clip"] = clip
        return page.get_pixmap(**kwargs)
    finally:
        doc.close()


def bytes_to_numpy_gray(samples: bytes, h: int, w: int):
    """Convert raw bytes to an h×w numpy array (1 channel)."""
    import numpy as np
    return np.frombuffer(samples, dtype="uint8").reshape(h, w)


def bytes_to_numpy_rgb(samples: bytes, h: int, w: int, n_components: int):
    """Convert raw bytes to an h×w×n numpy array."""
    import numpy as np
    return np.frombuffer(samples, dtype="uint8").reshape(h, w, n_components)


def _ocr_page_uncached(page_1idx: int) -> str:
    """Render a single PDF page to PNG at OCR_DPI and tesseract it. No cache.
    Flat single-column OCR — used for non-parallel pages."""
    pix = _render_pixmap(page_1idx, dpi=OCR_DPI)
    with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
        png_path = f.name
        pix.save(png_path)
    try:
        result = subprocess.run(
            ["tesseract", png_path, "-", "-l", OCR_LANG, "--psm", OCR_PSM],
            capture_output=True, text=True, timeout=OCR_TIMEOUT_S,
        )
        return result.stdout
    finally:
        os.unlink(png_path)


# Header band fraction (top portion of a parallel page that holds the
# centered, full-width running header). On Charles's vol-1 parallel-text
# pages the running header is centered horizontally across BOTH columns —
# left-half cropping the whole page chops the header in two and loses the
# chapter+verse info. So we render the page in two strips:
#   top strip (header band) at FULL WIDTH, ~6% of page height
#   body strip (rest)        at LEFT HALF, remaining ~94% of page height
# and concatenate the OCR output. Body-only crop preserves Yoshi's
# session-25 locked decision to drop the canonical (right) column while
# the header strip preserves chapter-range detection.
HEADER_BAND_FRAC = float(os.environ.get("CHARLES_VOL1_HEADER_BAND_FRAC", "0.06"))


def ocr_page_left_half_uncached(page_1idx: int) -> str:
    """Render a PDF page for parallel-column extraction: full-width top
    header band + left-half body, OCR each, concatenate. No cache.

    Used for parallel-column pages (vol1-h fix). Yoshi's session-25 locked
    decision: drop the canonical-comparison column, keep the apocryphal
    (Charles) translation only. Two-strip rendering preserves the centered
    full-width page header (which carries the chapter+verse range) — the
    left-half body crop would otherwise truncate it.
    """
    import fitz
    doc = fitz.open(PDF_PATH)
    try:
        page = doc.load_page(page_1idx - 1)
        rect = page.rect
        h = rect.y1 - rect.y0
        w = rect.x1 - rect.x0
        header_h = h * HEADER_BAND_FRAC
        mid_x = (rect.x0 + rect.x1) / 2
        header_rect = fitz.Rect(rect.x0, rect.y0, rect.x1, rect.y0 + header_h)
        body_rect = fitz.Rect(rect.x0, rect.y0 + header_h, mid_x, rect.y1)
        header_pix = page.get_pixmap(dpi=OCR_DPI, clip=header_rect)
        body_pix = page.get_pixmap(dpi=OCR_DPI, clip=body_rect)
    finally:
        doc.close()
    header_text = _tesseract_pixmap(header_pix)
    body_text = _tesseract_pixmap(body_pix)
    # Concatenate header + body. Header may have a trailing newline; keep
    # one blank line of separation so the page-header strip pipeline can
    # cleanly drop the header line.
    return header_text.rstrip() + "\n\n" + body_text


def _tesseract_pixmap(pix) -> str:
    """OCR a fitz Pixmap via a temp PNG. Returns the OCR'd text."""
    with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
        png_path = f.name
        pix.save(png_path)
    try:
        result = subprocess.run(
            ["tesseract", png_path, "-", "-l", OCR_LANG, "--psm", OCR_PSM],
            capture_output=True, text=True, timeout=OCR_TIMEOUT_S,
        )
        return result.stdout
    finally:
        os.unlink(png_path)


def ocr_page(page_1idx: int, force: bool = False) -> str:
    """Cache-aware single-page OCR. Returns the OCR'd text for page (1-indexed).

    Legacy API: returns whatever is in the cache regardless of mode, or
    flat-OCRs the page on cache miss. Prefer `ocr_page_smart` in new code —
    it routes parallel-column pages through `ocr_page_left_half_uncached`.
    """
    cache = _cache_path(page_1idx)
    if not force and os.path.exists(cache):
        cached = _read_cache(page_1idx)
        if cached is not None:
            mode, text = cached
            return text
    text = _ocr_page_uncached(page_1idx)
    _write_cache(page_1idx, "flat", text)
    return text


def ocr_page_smart(page_1idx: int, force: bool = False) -> str:
    """Cache-aware parallel-column-aware OCR (session-26 vol1-h entry point).

    Algorithm:
      1. If cache hit with sentinel = 'left' → return cached left-half text.
      2. If cache hit with sentinel = 'flat' → return cached flat text.
         (Caller's pixmap detection decided 'flat' was right at cache time.)
      3. If cache hit with no sentinel ('unmarked', pre-session-26 from
         session-25's flat-OCR pass) → check `|`-ratio. If ≥ 20%, the page
         was a parallel page mis-OCR'd as flat; re-OCR left-half and save
         with the 'left' sentinel. Otherwise upgrade the sentinel to 'flat'
         in place (no re-OCR) and return the text.
      4. Cache miss → render at low DPI, detect parallel-column via pixmap
         projection. If parallel, OCR left half; else flat OCR. Save with
         appropriate sentinel.

    Returns the OCR'd text (without the sentinel header line).
    """
    if not force:
        cached = _read_cache(page_1idx)
        if cached is not None:
            mode, text = cached
            if mode == "left":
                return text
            if mode == "flat":
                return text
            # unmarked: heuristic-based upgrade
            ratio = _flat_pipe_ratio(text)
            if ratio >= _UNMARKED_PIPE_RATIO_TRIGGER:
                # Stale flat-OCR'd parallel page — re-OCR as left half
                left = ocr_page_left_half_uncached(page_1idx)
                _write_cache(page_1idx, "left", left)
                return left
            else:
                # Treat as flat; upgrade sentinel for future runs (no re-OCR)
                _write_cache(page_1idx, "flat", text)
                return text
    # Cache miss (or force=True): render-detect-OCR-save
    if detect_parallel_column(page_1idx):
        text = ocr_page_left_half_uncached(page_1idx)
        _write_cache(page_1idx, "left", text)
    else:
        text = _ocr_page_uncached(page_1idx)
        _write_cache(page_1idx, "flat", text)
    return text


def ocr_pages(pages, force: bool = False) -> list[str]:
    """Cache-aware multi-page OCR (smart routing). Returns list in input order."""
    return [ocr_page_smart(p, force=force) for p in pages]


def _worker(args):
    page, force = args
    t0 = time.time()
    if not force:
        cached = _read_cache(page)
        if cached is not None:
            mode, text = cached
            if mode in ("flat", "left"):
                return (page, len(text), 0.0, True, mode)
            # unmarked — fall through to upgrade
    # Render, detect, OCR appropriately
    if not force:
        cached = _read_cache(page)
        if cached is not None and cached[0] == "unmarked":
            ratio = _flat_pipe_ratio(cached[1])
            if ratio >= _UNMARKED_PIPE_RATIO_TRIGGER:
                text = ocr_page_left_half_uncached(page)
                _write_cache(page, "left", text)
                return (page, len(text), time.time() - t0, False, "left")
            _write_cache(page, "flat", cached[1])
            return (page, len(cached[1]), 0.0, True, "flat-upgrade")
    if detect_parallel_column(page):
        text = ocr_page_left_half_uncached(page)
        _write_cache(page, "left", text)
        return (page, len(text), time.time() - t0, False, "left")
    text = _ocr_page_uncached(page)
    _write_cache(page, "flat", text)
    return (page, len(text), time.time() - t0, False, "flat")


def build_cache(start: int = 1, end: int | None = None,
                parallel: int = 1, force: bool = False,
                progress_every: int = 5) -> None:
    """Build the per-page OCR cache across [start..end] (1-indexed, inclusive).
    If end is None, defaults to last PDF page. Uses `parallel` worker processes.
    Already-cached pages are skipped unless force=True. Prints progress every
    progress_every pages."""
    import fitz
    doc = fitz.open(PDF_PATH)
    total_pages = len(doc)
    doc.close()
    if end is None:
        end = total_pages
    pages = list(range(start, end + 1))

    print(f"Building OCR cache: pages [{start}..{end}] ({len(pages)} pages), "
          f"parallel={parallel}, force={force}", flush=True)
    t_start = time.time()
    done = 0
    args_iter = [(p, force) for p in pages]
    if parallel <= 1:
        for arg in args_iter:
            page, chars, elapsed, cached, mode = _worker(arg)
            done += 1
            if done % progress_every == 0 or done == len(pages):
                rate = done / max(0.001, time.time() - t_start)
                eta = (len(pages) - done) / max(0.001, rate)
                tag = "(cached)" if cached else f"({elapsed:.1f}s)"
                print(f"  [{done:4d}/{len(pages)}] p{page} {chars}ch {tag} [{mode}]  "
                      f"rate={rate:.2f} p/s  eta={eta:.0f}s", flush=True)
    else:
        with Pool(parallel) as pool:
            for result in pool.imap_unordered(_worker, args_iter):
                page, chars, elapsed, cached, mode = result
                done += 1
                if done % progress_every == 0 or done == len(pages):
                    rate = done / max(0.001, time.time() - t_start)
                    eta = (len(pages) - done) / max(0.001, rate)
                    tag = "(cached)" if cached else f"({elapsed:.1f}s)"
                    print(f"  [{done:4d}/{len(pages)}] p{page} {chars}ch {tag} [{mode}]  "
                          f"rate={rate:.2f} p/s  eta={eta:.0f}s", flush=True)
    total = time.time() - t_start
    print(f"Done. {len(pages)} pages in {total:.1f}s "
          f"(avg {total/max(1,len(pages)):.2f}s/page).", flush=True)


def redetect_cache(start: int = 1, end: int | None = None,
                   progress_every: int = 5, dry_run: bool = False) -> None:
    """Walk the existing cache and re-check each page's mode against the
    current `detect_parallel_column` algorithm. Pages whose stored mode no
    longer agrees with the detector are re-OCR'd in the correct mode.

    Use after upgrading the detection algorithm (session-26 vol1-h
    midpoint-dip cut over). Skips uncached pages — use --build-cache for those.
    """
    import fitz
    doc = fitz.open(PDF_PATH)
    total_pages = len(doc)
    doc.close()
    if end is None:
        end = total_pages
    pages_to_check = list(range(start, end + 1))
    print(f"Redetect cache: pages [{start}..{end}] ({len(pages_to_check)} pages), "
          f"dry_run={dry_run}", flush=True)
    t_start = time.time()
    fixed = 0
    checked = 0
    for p in pages_to_check:
        cached = _read_cache(p)
        if cached is None:
            continue
        mode_now, text = cached
        is_parallel = detect_parallel_column(p)
        expected_mode = "left" if is_parallel else "flat"
        checked += 1
        if mode_now == "unmarked":
            # Pre-v2 cache: heuristic-upgrade via `|`-ratio still has authority
            # over pixmap detection because the cached text already shows what
            # tesseract produced. Trust the pixmap detection here too — it's
            # more reliable than the `|`-ratio heuristic.
            mode_now_effective = "unmarked"
        else:
            mode_now_effective = mode_now
        if mode_now_effective == expected_mode:
            if checked % progress_every == 0:
                print(f"  [{checked:4d}] p{p} [{mode_now}] OK ({expected_mode})", flush=True)
            continue
        # Mismatch — re-OCR
        if dry_run:
            print(f"  p{p} [{mode_now}] -> would re-OCR as {expected_mode}", flush=True)
            fixed += 1
            continue
        if expected_mode == "left":
            new_text = ocr_page_left_half_uncached(p)
        else:
            new_text = _ocr_page_uncached(p)
        _write_cache(p, expected_mode, new_text)
        fixed += 1
        print(f"  p{p} [{mode_now}] -> re-OCR'd as {expected_mode} ({len(new_text)} chars)", flush=True)
    total = time.time() - t_start
    print(f"Done. checked {checked} cached pages, fixed {fixed}, {total:.1f}s total.", flush=True)


def _main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--build-cache", action="store_true",
                    help="Build the per-page OCR cache.")
    ap.add_argument("--redetect-cache", action="store_true",
                    help="Walk existing cache; re-OCR pages whose mode no longer "
                         "agrees with the current detect_parallel_column algorithm.")
    ap.add_argument("--page", type=int, default=None,
                    help="OCR a single page (1-indexed) and print the result.")
    ap.add_argument("--start", type=int, default=1,
                    help="First PDF page to cache (1-indexed; default 1).")
    ap.add_argument("--end", type=int, default=None,
                    help="Last PDF page to cache (1-indexed, inclusive; default last).")
    ap.add_argument("--parallel", type=int, default=1,
                    help="Number of parallel OCR worker processes (default 1).")
    ap.add_argument("--force", action="store_true",
                    help="Re-OCR even if cached.")
    ap.add_argument("--progress-every", type=int, default=5,
                    help="Progress-print cadence (default every 5 pages).")
    ap.add_argument("--dry-run", action="store_true",
                    help="For --redetect-cache: report mismatches but don't re-OCR.")
    args = ap.parse_args()

    if args.page is not None:
        sys.stdout.write(ocr_page(args.page, force=args.force))
        return

    if args.redetect_cache:
        redetect_cache(start=args.start, end=args.end,
                       progress_every=args.progress_every,
                       dry_run=args.dry_run)
        return

    if args.build_cache:
        build_cache(start=args.start, end=args.end,
                    parallel=args.parallel, force=args.force,
                    progress_every=args.progress_every)
        return

    ap.print_help()


if __name__ == "__main__":
    _main()
