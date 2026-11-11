"""S496 — precheck496.py <chapter>: the drafter's own check of out/matthew_<chapter>_draft.json (same rules as assemble496; writes nothing).
Model: Claude Fable 5.1 (claude-fable-5-1)."""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
import assemble496
rc = assemble496.main('b1', int(sys.argv[1])); print('precheck496:', 'PASS' if rc == 0 else 'FAIL'); sys.exit(rc)
