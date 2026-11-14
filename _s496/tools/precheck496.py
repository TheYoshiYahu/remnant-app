"""S496 — precheck496.py <chapter> [book]: the drafter's own check of out/<book>_<chapter>_draft.json (same rules as assemble496; writes nothing).
book defaults to matthew (b1–b5); S502: `precheck496.py 7 mark`, `precheck496.py 15 luke`. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
import assemble496
from common496 import batch_of
ch = int(sys.argv[1]); book = sys.argv[2] if len(sys.argv) > 2 else 'matthew'; batch = batch_of(book, ch)
rc = assemble496.main(batch, ch); print('precheck496:', 'PASS' if rc == 0 else 'FAIL'); sys.exit(rc)
