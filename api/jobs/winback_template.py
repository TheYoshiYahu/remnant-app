"""
winback_template.py — the win-back email (S467).

For readers whose trial ended long ago and who never partnered. Voice: plain,
warm, no pressure, no countdown theatrics, no prescription of practice. The
canon stays open either way. Every copy carries the unsubscribe link.
"""
from __future__ import annotations

import html as _html
from datetime import date

# What's new since the reader's trial ended — taken from the app's New Features
# page (app/src/data/newFeatures.ts). Each reader only sees items dated after
# their trial ended. Newest first; keep in step with that page.
WHATS_NEW = [
    ("2026-10-24", "The Suggestion Board", "send ideas, vote on others', and watch them move from Planned to Built"),
    ("2026-10-23", "The 1 Enoch, Jubilees, Apocrypha and Jasher cards rebuilt", "every quotation checked word for word against the text"),
    ("2026-10-17", "Listen with the screen locked", "audio keeps going chapter to chapter on the phone apps"),
    ("2026-10-12", "Natural recorded voices", "with the restored names spoken rightly, and a voice picker"),
    ("2026-10-07", "Year Plan study and My Teachings", "walk the year plan with notes on each day"),
    ("2026-10-03", "Hidden Words", "see where one English word hides two or more Hebrew or Greek words"),
    ("2026-09-13", "Scripture first", "the app opens straight to the Scriptures"),
    ("2026-07-12", "Highlight a single word or phrase", "in thirty-six colors you can name"),
    ("2026-07-11", "Teachings", "full teachings to read inside the app"),
    ("2026-07-07", "A stronger search", "exact phrases, AND and OR, and searching within one book"),
]
MAX_ITEMS = 6


def whats_new_since(since: date | None) -> list:
    items = [w for w in WHATS_NEW if since is None or date.fromisoformat(w[0]) > since]
    return items[:MAX_ITEMS]

SUBJECT = "The study tools are open to you again for a day"
NUDGE_SUBJECT = "Your offer to come back is still open"


def _greeting(display_name: str | None) -> str:
    first = ((display_name or "").strip().split() or [""])[0]
    return f"Shalom {first}," if first else "Shalom,"


def render_text(display_name, open_url, unsubscribe_url, nudge=False, since=None) -> str:
    new = whats_new_since(since)
    new_block = (
        "\nAdded since you were last in:\n" + "\n".join(f"  - {t} — {d}" for _, t, d in new) + "\n"
        if new else ""
    )
    lead = (
        "A little while back we wrote to you about coming back to the study tools. That offer is still open."
        if nudge else
        "It has been a while since your week of full access in the Study Bible, and we wanted to open the door again."
    )
    return f"""{_greeting(display_name)}

{lead}

If you tap the link below, every study tool opens back up for 24 hours —
the framework commentary, the cross-reference threads, the restored library
beyond the canon, and the Hebrew and Greek lexicon. The clock starts when you tap.

If you'd like to stay, there is a thank-you on Companion, the full set of tools:
  - 25% off monthly for your first 6 months, or
  - 35% off your first year if you choose yearly.

Open the study tools for 24 hours:
{open_url}

If now is not the time, that is all right. The canon stays open to you
either way, and everything you saved is still there.
{new_block}
— Remnant of Promise
remnantofpromise.org

Don't want emails like this? Choose here: {unsubscribe_url}
"""


def render_html(display_name, open_url, unsubscribe_url, nudge=False, since=None) -> str:
    new = whats_new_since(since)
    g = _html.escape(_greeting(display_name))
    lead = (
        "A little while back we wrote to you about coming back to the study tools. That offer is still open."
        if nudge else
        "It has been a while since your week of full access in the Study Bible, and we wanted to open the door again."
    )
    o = _html.escape(open_url, quote=True)
    u = _html.escape(unsubscribe_url, quote=True)
    p = 'style="margin:0 0 16px 0; font-size:16px; line-height:1.6; color:#2b2420;"'
    return f"""<!DOCTYPE html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"><title>{_html.escape(NUDGE_SUBJECT if nudge else SUBJECT)}</title></head>
<body style="margin:0; padding:0; background-color:#f4f1ea;">
<table role="presentation" width="100%" cellpadding="0" cellspacing="0"><tr><td align="center" style="padding:32px 16px;">
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="max-width:560px; background:#ffffff; border-radius:8px; font-family:Georgia,serif;">
<tr><td style="padding:32px;">
<p {p}>{g}</p>
<p {p}>{_html.escape(lead)}</p>
<p {p}>If you tap the button below, every study tool opens back up for 24 hours — the framework
commentary, the cross-reference threads, the restored library beyond the canon, and the Hebrew and
Greek lexicon. The clock starts when you tap.</p>
<p {p}>If you'd like to stay, there is a thank-you on Companion, the full set of tools: <b>25% off monthly
for your first 6 months</b>, or <b>35% off your first year</b> if you choose yearly.</p>
<p style="margin:24px 0; text-align:center;"><a href="{o}" style="display:inline-block; padding:14px 28px;
background:#7a5c2e; color:#ffffff; text-decoration:none; border-radius:6px; font-size:16px;">Open the study tools for 24 hours</a></p>
<p {p}>If now is not the time, that is all right. The canon stays open to you either way, and
everything you saved is still there.</p>
{_new_html(new, p)}
<p {p}>— Remnant of Promise<br><a href="https://remnantofpromise.org" style="color:#7a5c2e;">remnantofpromise.org</a></p>
<p style="margin:24px 0 0 0; font-size:12px; color:#8a7f72;">Don't want emails like this?
<a href="{u}" style="color:#8a7f72;">Choose here</a>.</p>
</td></tr></table></td></tr></table></body></html>"""


def _new_html(new: list, p: str) -> str:
    if not new:
        return ""
    rows = "".join(
        f'<li style="margin:0 0 8px 0;"><b>{_html.escape(t)}</b> — {_html.escape(d)}</li>'
        for _, t, d in new
    )
    return (
        f'<p {p}><b>Added since you were last in:</b></p>'
        f'<ul style="margin:0 0 16px 0; padding-left:20px; font-size:15px; line-height:1.5; color:#2b2420;">{rows}</ul>'
    )

