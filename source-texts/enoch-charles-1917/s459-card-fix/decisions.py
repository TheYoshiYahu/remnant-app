# S459 — hand decisions for the 1 Enoch card fix. Read against the live Charles 1917 text (enoch-cards-live.json).
# MOVE: card id -> the live verse the card's thought actually sits on (overrides regrade's proposal).
# KEEP: keep the card's current address even though regrade proposed another.
# NVERSES: how many consecutive verses to quote from the (new) address.
# RETIRE: cards whose claim has no live verse to stand on.
# PROSE: hand-written prose (after the quote) in Yoshi's voice — Come and See: the verse carries, the prose points.

MOVE = {
    # NOT_FOUND — the words were never Charles; the thought lives here
    4453: '104:1', 4454: '103:4', 12850: '104:1', 52065: '104:1',
    25549: '103:5', 25412: '104:7',
    66488: '14:18',
    48751: '19:3',
    29120: '39:3', 48743: '14:8', 48786: '14:8', 48824: '14:8',
    4680: '22:4', 7869: '22:4', 7946: '22:4', 7955: '22:4',
    46048: '24:4',
    4726: '62:8',
    15003: '40:2', 48830: '40:2',
    4298: '40:5',
    69783: '48:9',
    4848: '46:6',
    4900: '61:8', 15015: '61:8', 57410: '61:8', 135969: '61:8',
    4877: '62:3',
    4849: '63:8',
    4807: '65:10',
    4808: '10:13',
    25691: '74:12',
    55283: '81:6',
    4334: '104:9', 4335: '99:2',
    22503: '82:4', 25692: '82:5', 22500: '82:4', 22579: '82:4',
    4753: '89:58',
    4761: '90:25', 4424: '90:25',
    13799: '90:20', 14898: '90:20',
    13805: '90:18',
    4425: '90:29', 13433: '90:29', 59997: '90:29',
    4386: '90:33', 4426: '90:33', 4685: '90:33',
    7938: '90:10',
    145067: '96:8',
    # RE_ANCHOR_REWORDED — overrides of the regrade proposal
    21397: '61:4',
    19917: '53:3',
    19972: '62:2',      # source is 61:8 itself; 62:2 is the true parallel
    56652: '63:1',
    4292: '14:18', 12820: '14:18', 12942: '14:18', 45458: '14:18', 49285: '14:18', 49384: '14:18',
    66489: '14:18', 120191: '14:18', 157298: '14:18',
    55168: '72:6',
    7868: '26:2',
    4274: '90:37', 4275: '90:38',
    # 62:1 group (the enthronement words are 61:8)
    4258: '61:8', 7876: '61:8', 9899: '61:8', 18922: '61:8', 18995: '61:8', 19007: '61:8', 56650: '61:8', 90046: '61:8', 135426: '61:8',
    # collisions resolved
    7844: '16:4', 4900: '62:2', 135969: '69:27', 7894: '40:4', 12953: '40:4', 66492: '40:4', 15036: '21:6', 15035: '18:11',
    22503: '82:5', 66488: '14:20', 4335: '104:10', 56509: '5:4', 4682: '90:18',
    4736: '46:4', 4847: '46:4', 4901: '46:4',
}

KEEP = {
    # regrade proposed another verse, but the live verse at the card's own address carries the thought
    4330, 7957, 39145, 17258, 16298, 150619, 4329, 7892, 12956, 12979, 69749, 69795, 56571, 4845, 135440,
    4512, 15005, 22549, 22559, 55177, 55179, 17245, 22580, 4366, 4683, 4814, 4396, 7855, 7906, 4557, 7958,
    120469, 7874, 60447, 7956, 7947, 7948, 4680, 7869,
}

NVERSES = {
    69749: 2, 69795: 2,   # 45:4–5 together
    4557: 1,
}

RETIRE = {
    4396: 'duplicate — card 121872 (Matt 8:29 -> 1 Enoch 16:1) carries the same thought on the true verse',
    4853: 'duplicate — card 4851 (Matt 26:64 -> 1 Enoch 46:4) already quotes this verse',
}

from prose import PROSE
