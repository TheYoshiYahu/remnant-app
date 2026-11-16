"""S506 — check506.py <slug> <live-dir>: merge the thread's members from every dump in <live-dir> (packet506.merged_readback) and run check503c on it
(S503_FIX=sweep506). Used after the scratch re-dump (seed503x --redump) and by the deploy paste after the live re-dump. Model: Claude Fable 5.1."""
import json, sys, os, subprocess, tempfile
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from packet506 import merged_readback
slug, live = sys.argv[1], sys.argv[2]
D = merged_readback(slug, live); tmp = Path(tempfile.mkdtemp()) / f'{slug}_merged.json'; json.dump(D, open(tmp, 'w'), ensure_ascii=False, default=str)
print(f"check506 {slug}: {D['schema_note']}")
sys.exit(subprocess.run([sys.executable, str(Path(__file__).resolve().parent / 'check503c.py'), slug, str(tmp)], env=dict(os.environ, S503_FIX=os.environ.get('S503_FIX', 'sweep506'))).returncode)
