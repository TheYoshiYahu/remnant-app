/**
 * LocationPicker / LocationBar — let the reader choose their place so the
 * calendar engine computes sunset, feast days, and crescent visibility for
 * their own sky instead of always Jerusalem's.
 *
 * Offline, bundled-only: the picker searches `cities.ts` (no geocoding
 * service), true to the engine's "COMPUTE, DON'T SCRAPE" rule. The choice
 * persists through `location-pref.ts` under the shared `cal.location` key, so
 * the Today hub, the Calendar route, and the Torah-portions work all read one
 * answer.
 *
 *   - <LocationBar>    a compact "Your place · <label> · Change" strip for the
 *                      Today landing and the Calendar.
 *   - <LocationPicker> the searchable modal, in the bordered-chrome modal
 *                      register (bg-black/40 backdrop, reader-surface card).
 *
 * Aesthetic per DESIGN_LANGUAGE: chrome-metal + reader vars, no grey.
 */

import { useEffect, useMemo, useRef, useState } from "react";
import { searchCities, type City } from "../lib/calendar/cities.ts";
import {
  getLocationPref,
  setLocationPref,
} from "../lib/calendar/location-pref.ts";
import { JERUSALEM, type GeoLocation } from "../lib/calendar/types.ts";

/** Compact location strip. Shows the current place and opens the picker. */
export function LocationBar({
  onChange,
  className,
}: {
  /** Called after the reader picks a place, so the host can recompute. */
  onChange?: (loc: GeoLocation) => void;
  className?: string;
}) {
  const [open, setOpen] = useState(false);
  const [loc, setLoc] = useState<GeoLocation>(() => getLocationPref() ?? JERUSALEM);
  const chosen = getLocationPref() !== null;

  return (
    <div
      className={
        "flex items-center justify-between gap-3 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2 " +
        (className ?? "")
      }
    >
      <div className="min-w-0">
        <div className="text-[10px] font-medium uppercase tracking-wider text-[var(--reader-muted)]">
          Your place {chosen ? "" : "· default"}
        </div>
        <div className="truncate font-serif text-sm font-semibold text-[var(--reader-text)]">
          {loc.label ?? "Jerusalem"}
        </div>
      </div>
      <button
        type="button"
        onClick={() => setOpen(true)}
        className="chrome-metal chrome-metal-gold shrink-0"
      >
        {chosen ? "Change" : "Set location"}
      </button>

      {open && (
        <LocationPicker
          onClose={() => setOpen(false)}
          onPick={(city) => {
            setLocationPref(city);
            setLoc(city);
            setOpen(false);
            onChange?.(city);
          }}
        />
      )}
    </div>
  );
}

/** The searchable city modal. */
export function LocationPicker({
  onPick,
  onClose,
  required = false,
}: {
  onPick: (loc: City) => void;
  /** Dismiss without choosing. Hidden when `required` (first-open prompt). */
  onClose?: () => void;
  /** First-open mode: no backdrop-dismiss, no ✕ — the reader must choose. */
  required?: boolean;
}) {
  const [query, setQuery] = useState("");
  const inputRef = useRef<HTMLInputElement>(null);
  const results = useMemo(() => searchCities(query), [query]);

  useEffect(() => {
    inputRef.current?.focus();
  }, []);

  return (
    <div
      className="fixed inset-0 z-50 flex items-end justify-center bg-black/40 p-4 sm:items-center"
      onClick={required ? undefined : onClose}
      role="dialog"
      aria-modal="true"
      aria-label="Choose your location"
    >
      <div
        className="flex max-h-[85vh] w-full max-w-lg flex-col overflow-hidden rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 shadow-xl"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="mb-1 flex items-baseline justify-between">
          <h2
            className="font-serif text-lg font-semibold"
            style={{ color: "var(--reader-accent)" }}
          >
            Choose your location
          </h2>
          {!required && onClose && (
            <button
              type="button"
              className="ml-2 text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
              onClick={onClose}
              aria-label="Close"
            >
              ✕
            </button>
          )}
        </div>
        <p className="mb-3 text-sm text-[var(--reader-muted)]">
          Pick the place nearest you so sunsets, Sabbaths, and the appointed
          times are computed for your own sky. You can change this anytime.
        </p>

        <input
          ref={inputRef}
          type="search"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search a city or country…"
          className="mb-3 w-full rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)] px-3 py-2 text-base text-[var(--reader-text)]"
        />

        <div className="-mx-1 overflow-y-auto">
          {results.length === 0 ? (
            <div className="px-3 py-6 text-center text-sm text-[var(--reader-muted)]">
              No match. Try a nearby major city.
            </div>
          ) : (
            <ul className="flex flex-col">
              {results.map((c) => (
                <li key={`${c.label}-${c.region}`}>
                  <button
                    type="button"
                    onClick={() => onPick(c)}
                    className="flex w-full items-baseline justify-between gap-3 rounded px-3 py-2 text-left hover:bg-[var(--reader-bg)]"
                  >
                    <span className="font-medium text-[var(--reader-text)]">
                      {c.label}
                    </span>
                    <span className="shrink-0 text-xs text-[var(--reader-muted)]">
                      {c.region}
                    </span>
                  </button>
                </li>
              ))}
            </ul>
          )}
        </div>
      </div>
    </div>
  );
}
