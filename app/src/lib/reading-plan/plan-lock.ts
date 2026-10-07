/**
 * plan-lock.ts — shared entitlement rules + lock copy for the S442 Year Plan
 * study features (YEAR_PLAN_STUDY_SPEC.md).
 *
 *   partner  = an account in its free week or paying (`me.status` "active" or
 *              "trialing") — the same check as the Hidden Words tables. Opens
 *              the whole plan, pacing, notes, and My Teachings.
 *   teacher  = partner AND the top tier ("everything"; the 7-day trial is the
 *              top tier) — opens For Teachers.
 *
 * The server re-checks both on every endpoint; this is presentation only.
 */

export const PLAN_LOCK_TITLE = "The whole plan is a partner feature";

export const PLAN_LOCK_MESSAGE =
  "Seeing every day of the plan ahead of time, setting your own pace, and " +
  "turning your notes into your own teachings are part of a partnership, " +
  "including the free first week. Today's reading stays free for everyone. " +
  "Partnership is managed from your account on the web at remnantofpromise.org.";

export const TEACHER_LOCK_TITLE = "For Teachers is part of the Everything tier";

export const TEACHER_LOCK_MESSAGE =
  "Building assignments for a class or a family — any stretch of the plan or " +
  "any passage, questions with an answer key, memory verses — and printing " +
  "student and teacher copies, with or without the chapter text, is part of " +
  "the Everything partnership (and the free first week). Partnership is " +
  "managed from your account on the web at remnantofpromise.org.";

export function isPlanEntitled(status: string | null | undefined): boolean {
  return status === "active" || status === "trialing";
}

export function isTeacherEntitled(
  status: string | null | undefined,
  tier: string | null | undefined,
): boolean {
  return isPlanEntitled(status) && tier === "everything";
}
