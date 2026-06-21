/**
 * location-pref.ts — the single, app-wide source of truth for the reader's
 * chosen place, so the calendar engine computes sunset, feasts, and crescent
 * visibility for their own sky instead of always Jerusalem's.
 *
 * Parallels `reckoning-pref.ts`: one shared localStorage key the Today hub, the
 * Calendar route, and the Torah-portions work all read. The difference is the
 * UNSET semantics: this store returns `null` when the reader has chosen
 * nothing, so callers default to JERUSALEM *and* know to raise the
 * first-open location prompt. (`reckoning-pref` returns a working default
 * instead; location wants the prompt.)
 *
 * Stores the resolved `GeoLocation` (lat / lon / elevation / label) as JSON.
 * A bundled city is the usual source (see `cities.ts`), but any GeoLocation is
 * accepted so a future "use my location" path can write coordinates here too.
 */

import { type GeoLocation } from "./types.ts";

/** The app-wide localStorage key for the chosen place. */
export const LOCATION_PREF_KEY = "cal.location";

function isGeoLocation(v: unknown): v is GeoLocation {
  if (!v || typeof v !== "object") return false;
  const o = v as Record<string, unknown>;
  return (
    typeof o.latitudeDeg === "number" &&
    typeof o.longitudeDeg === "number" &&
    typeof o.elevationM === "number" &&
    Number.isFinite(o.latitudeDeg) &&
    Number.isFinite(o.longitudeDeg)
  );
}

/**
 * The reader's chosen place, or `null` when unset / unreadable (SSR, private
 * mode, a stale value). `null` is the signal to default to JERUSALEM and offer
 * the first-open picker.
 */
export function getLocationPref(): GeoLocation | null {
  if (typeof window === "undefined") return null;
  try {
    const raw = window.localStorage.getItem(LOCATION_PREF_KEY);
    if (!raw) return null;
    const parsed = JSON.parse(raw) as unknown;
    if (isGeoLocation(parsed)) return parsed;
  } catch {
    /* private mode / bad JSON — treat as unset */
  }
  return null;
}

/** True once the reader has explicitly chosen a place. */
export function hasChosenLocation(): boolean {
  return getLocationPref() !== null;
}

/** Persist the reader's chosen place. No-op off-window or in private mode. */
export function setLocationPref(loc: GeoLocation): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.setItem(LOCATION_PREF_KEY, JSON.stringify(loc));
  } catch {
    /* private mode — the choice just won't persist */
  }
}

/** Clear the chosen place (back to the JERUSALEM default + first-open prompt). */
export function clearLocationPref(): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.removeItem(LOCATION_PREF_KEY);
  } catch {
    /* ignore */
  }
}
