"""
trial_reminder_template.py — content for the trial-ending email.

One subject line plus matching HTML and plaintext bodies. Kept separate from the
job logic so copy can be edited without touching the send/idempotency code.

Voice: aligned to Yoshi's ministry voice (yoshi-voice skill). Warm, plain,
honest — never salesy, no countdown pressure, no prescription of practice
(Red Line #8: invite, don't instruct), and no inclusion-gospel claims (the
email never says signing up makes anyone anything). It says plainly what stays
free forever (the full canon + everything the reader saved) and what a
partnership keeps open (the study tools), then extends a single invitation. The
canon stays open either way — that promise is the spine of the message.

This is email — a surface OUTSIDE the native app — so a tappable CTA to the web
pricing page is appropriate and fee-free (it's the in-APP tappable paths that
were removed for store-commission compliance).
"""

from __future__ import annotations

# The one call-to-action target. Web pricing page (Stripe checkout lives here).
PRICING_URL = "https://bible.remnantofpromise.org/pricing"

SUBJECT = "Your week of full access is almost up"


def _greeting(display_name: str | None) -> str:
    name = (display_name or "").strip()
    # First word only, so a full "First Last" doesn't read oddly in a greeting.
    first = name.split()[0] if name else ""
    return f"Shalom {first}," if first else "Shalom,"


def render_text(display_name: str | None = None) -> str:
    """Plaintext body."""
    return f"""{_greeting(display_name)}

Thank you for spending this week in the Scriptures with full access open.

Your seven days of complete access are coming to a close. Here is what that
means, plainly, with nothing hidden:

What stays yours, free, always:
  - All 66 books of the canon, open to read anytime.
  - Everything you have marked — your notes, highlights, bookmarks, and the
    place you left off. None of it is touched.

What a partnership keeps open:
  - The framework commentary, growing chapter by chapter.
  - The cross-reference threads that anchor each passage in its source.
  - The restored library beyond the canon, and the Hebrew and Greek lexicon.

If the study tools have served you this week, you are welcome to come alongside
the work as a partner. If now is not the time, the Word stays open to you all
the same — that part never closes.

Become a partner:
{PRICING_URL}

The canon stays open either way. We are grateful you are reading.

— Remnant of Promise
remnantofpromise.org
"""


def render_html(display_name: str | None = None) -> str:
    """HTML body. Inline styles only (email clients strip <style>/external CSS)."""
    greeting = _greeting(display_name)
    return f"""\
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{SUBJECT}</title>
  </head>
  <body style="margin:0; padding:0; background-color:#f4f1ea;">
    <table role="presentation" width="100%" cellpadding="0" cellspacing="0"
           style="background-color:#f4f1ea; padding:24px 12px;">
      <tr>
        <td align="center">
          <table role="presentation" width="100%" cellpadding="0" cellspacing="0"
                 style="max-width:560px; background-color:#ffffff; border:1px solid #e4ddcb;
                        border-radius:10px; overflow:hidden;
                        font-family:Georgia,'Times New Roman',serif; color:#23201a;">
            <tr>
              <td style="padding:32px 32px 8px 32px;">
                <p style="margin:0 0 16px 0; font-size:16px; line-height:1.5;">{greeting}</p>
                <p style="margin:0 0 16px 0; font-size:16px; line-height:1.6;">
                  Thank you for spending this week in the Scriptures with full access open.
                </p>
                <p style="margin:0 0 20px 0; font-size:16px; line-height:1.6;">
                  Your seven days of complete access are coming to a close. Here is what
                  that means, plainly, with nothing hidden:
                </p>

                <p style="margin:0 0 6px 0; font-size:14px; font-weight:bold;
                          text-transform:uppercase; letter-spacing:0.04em; color:#6b6450;">
                  What stays yours, free, always
                </p>
                <ul style="margin:0 0 20px 0; padding-left:20px; font-size:16px; line-height:1.6;">
                  <li style="margin-bottom:6px;">All 66 books of the canon, open to read anytime.</li>
                  <li>Everything you have marked — your notes, highlights, bookmarks, and the
                      place you left off. None of it is touched.</li>
                </ul>

                <p style="margin:0 0 6px 0; font-size:14px; font-weight:bold;
                          text-transform:uppercase; letter-spacing:0.04em; color:#6b6450;">
                  What a partnership keeps open
                </p>
                <ul style="margin:0 0 24px 0; padding-left:20px; font-size:16px; line-height:1.6;">
                  <li style="margin-bottom:6px;">The framework commentary, growing chapter by chapter.</li>
                  <li style="margin-bottom:6px;">The cross-reference threads that anchor each passage in its source.</li>
                  <li>The restored library beyond the canon, and the Hebrew and Greek lexicon.</li>
                </ul>

                <p style="margin:0 0 24px 0; font-size:16px; line-height:1.6;">
                  If the study tools have served you this week, you are welcome to come
                  alongside the work as a partner. If now is not the time, the Word stays
                  open to you all the same — that part never closes.
                </p>
              </td>
            </tr>
            <tr>
              <td align="center" style="padding:0 32px 32px 32px;">
                <a href="{PRICING_URL}"
                   style="display:inline-block; background-color:#23201a; color:#ffffff;
                          text-decoration:none; font-family:Arial,Helvetica,sans-serif;
                          font-size:15px; font-weight:bold; padding:13px 28px; border-radius:6px;">
                  Become a partner
                </a>
                <p style="margin:18px 0 0 0; font-size:14px; line-height:1.6; color:#6b6450;">
                  The canon stays open either way. We are grateful you are reading.
                </p>
              </td>
            </tr>
            <tr>
              <td style="padding:18px 32px; border-top:1px solid #e4ddcb;
                         font-family:Arial,Helvetica,sans-serif; font-size:12px; color:#8a8472;">
                Remnant of Promise &middot;
                <a href="https://remnantofpromise.org"
                   style="color:#8a8472;">remnantofpromise.org</a>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </body>
</html>
"""
