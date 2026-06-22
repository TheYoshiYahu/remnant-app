/**
 * Tests for offlineKeep.ts — the PURE auto-sync policy.
 *
 * Same runner-agnostic convention as offlineDownload.test.ts: no runner is
 * wired into package.json, so this compiles under tsc and runs via the tsx
 * fallback harness when executed directly.
 *
 * Scope: autoSyncAllowed — the gate that decides whether a SILENT, automatic,
 * deploy-triggered background refresh may run. This is the heart of the
 * Wi-Fi-only-by-default data-trap fix, so it's the part worth pinning. The
 * localStorage-backed preferences and the live network reads belong in an
 * integration test once a runner + jsdom land.
 */

import { autoSyncAllowed, type ConnectionType } from "./offlineKeep";

declare const describe: undefined | ((name: string, fn: () => void) => void);
declare const test: undefined | ((name: string, fn: () => void) => void);
declare const expect:
  | undefined
  | ((received: unknown) => {
      toBe: (expected: unknown) => void;
    });
declare const process: { exit: (code: number) => never } | undefined;

type Check = { label: string; run: () => string | null };

function eq<T>(label: string, actual: T, expected: T): string | null {
  return actual === expected
    ? null
    : `FAIL [${label}]\n  expected: ${JSON.stringify(expected)}\n  actual:   ${JSON.stringify(actual)}`;
}

const allow = (
  online: boolean,
  connection: ConnectionType,
  allowCellular: boolean,
) => autoSyncAllowed({ online, connection, allowCellular });

const checks: Check[] = [
  // ---- offline is never allowed -----------------------------------------
  {
    label: "offline blocks even on wifi with cellular allowed",
    run: () => eq("offline⇒false", allow(false, "wifi", true), false),
  },
  // ---- Wi-Fi-only default (allowCellular = false) -----------------------
  {
    label: "wifi-only: wifi connection is allowed",
    run: () => eq("wifi⇒true", allow(true, "wifi", false), true),
  },
  {
    label: "wifi-only: cellular connection is blocked",
    run: () => eq("cellular⇒false", allow(true, "cellular", false), false),
  },
  {
    label: "wifi-only: UNKNOWN connection is the safe-default block",
    run: () => eq("unknown⇒false", allow(true, "unknown", false), false),
  },
  // ---- allowCellular opt-in ---------------------------------------------
  {
    label: "allow-cellular: cellular is allowed",
    run: () => eq("cellular+optin⇒true", allow(true, "cellular", true), true),
  },
  {
    label: "allow-cellular: unknown is allowed (opt-in covers can't-detect)",
    run: () => eq("unknown+optin⇒true", allow(true, "unknown", true), true),
  },
  {
    label: "allow-cellular: wifi is still allowed",
    run: () => eq("wifi+optin⇒true", allow(true, "wifi", true), true),
  },
];

// ----- dual harness: vitest/jest if present, else plain run ---------------

if (typeof describe === "function" && typeof test === "function" && typeof expect === "function") {
  describe("offlineKeep.autoSyncAllowed", () => {
    for (const c of checks) {
      test(c.label, () => {
        expect!(c.run()).toBe(null);
      });
    }
  });
} else {
  const failures = checks.map((c) => c.run()).filter((r): r is string => r !== null);
  if (failures.length > 0) {
    console.error(failures.join("\n\n"));
    console.error(`\n${failures.length}/${checks.length} checks FAILED`);
    if (typeof process !== "undefined") process.exit(1);
  } else {
    console.log(`offlineKeep: all ${checks.length} policy checks passed`);
  }
}
