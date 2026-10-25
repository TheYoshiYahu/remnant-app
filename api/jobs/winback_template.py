"""
winback_template.py — the win-back email (S467).

For readers whose trial ended long ago and who never partnered. Voice: plain,
warm, no pressure, no countdown theatrics, no prescription of practice. The
canon stays open either way. Every copy carries the unsubscribe link.
"""
from __future__ import annotations

import html as _html

SUBJECT = "The study tools are open to you again for a day"
NUDGE_SUBJECT = "Your offer to come back is still open"


def _greeting(display_name: str | None) -> str:
    first = ((display_name or "").strip().split() or [""])[0]
    return f"Shalom {first}," if first else "Shalom,"


def render_text(display_name, open_url, unsubscribe_url, nudge=False) -> str:
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

— Remnant of Promise
remnantofpromise.org

Don't want emails like this? Choose here: {unsubscribe_url}
"""


def render_html(display_name, open_url, unsubscribe_url, nudge=False) -> str:
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
<p {p}>— Remnant of Promise<br><a href="https://remnantofpromise.org" style="color:#7a5c2e;">remnantofpromise.org</a></p>
<p style="margin:24px 0 0 0; font-size:12px; color:#8a7f72;">Don't want emails like this?
<a href="{u}" style="color:#8a7f72;">Choose here</a>.</p>
</td></tr></table></td></tr></table></body></html>"""
