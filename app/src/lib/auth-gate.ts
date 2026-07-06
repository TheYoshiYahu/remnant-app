/**
 * (unused) — superseded by the SOFT sign-in reminder approach.
 *
 * An earlier draft of this build added a HARD account gate (redirect
 * unauthenticated users to /sign-in). That direction was reversed: anonymous
 * users must keep full reader access, and instead get a dismissible, per-launch
 * sign-in REMINDER (see components/SigninReminderModal.tsx + lib/signin-reminder.ts).
 *
 * This module is intentionally empty and imported by nothing. (The file could
 * not be deleted in this environment; it is left inert so no hard-gate logic
 * ships. Safe to delete from the repo.)
 */
export {};
