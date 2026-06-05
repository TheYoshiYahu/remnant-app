/**
 * MapsSheet — whole-earth dispersion & gathering render (rebuilt S199).
 *
 * The S197 version was pulled: it boxed the map to the Ancient Near East and
 * drew the scattering as only the Assyrian/Babylonian exile and the gathering
 * as a return to the old land — erasing the worldwide remnant the prophets
 * named (the scattered seed across ALL nations, the Americas included). That is
 * the very lie the framework exists to dismantle.
 *
 * The rebuild puts the doctrine on the page first (the rewritten framework band,
 * tool="maps" entry_key="dispersion-overlay", quotes Deuteronomy 28:64, Amos
 * 9:9, Hosea 1:10 for the worldwide scattering and Isaiah 11:11-12, Jeremiah
 * 31:8-10, Ezekiel 37:21 for the gathering from the four corners and the
 * islands of the sea), then draws it on a REAL public-domain whole-earth map
 * (Natural Earth admin-0, PD; our own SVG — no copyrighted atlas plate). The
 * scattering fans OUT from the land to every continent and across the seas; the
 * gathering comes HOME from the four corners and the far isles — visibly
 * reaching the Americas, not a Mesopotamia round-trip. The ancient places
 * (maps_places, openbible.info coordinates, CC-BY) plot as the faint homeland
 * cluster over the Levant.
 */

import { useEffect, useMemo, useState } from "react";
import {
  fetchMapsPlaces,
  type MapPlace,
  type MapPlacesResponse,
  type ToolFetchResult,
} from "../lib/api";
import ToolAnnotationBand from "./ToolAnnotationBand";
import ToolSheet, {
  ToolError,
  ToolFoilNote,
  ToolLoading,
  ToolTierLockedCard,
} from "./ToolSheet";
import { WORLD_PATH, WORLD_VIEW_W, projectEquirect } from "./worldGeometry";

interface Props {
  onClose: () => void;
}

// Crop the empty polar bands (Antarctica / high Arctic) but keep all the
// inhabited world: ~81°N down to ~57°S — the Americas' tip and the far isles.
const VIEW_X = 0;
const VIEW_Y = 25;
const VIEW_W = WORLD_VIEW_W;
const VIEW_H = 400;

// The land of Yashar'el — origin of the scattering, destination of the gathering.
const HOME: [number, number] = [35.23, 31.78]; // Jerusalem

// The four corners, the ends of the earth, and the islands of the sea —
// every inhabited continent the seed was sown into and is gathered home from.
const CORNERS: { name: string; lon: number; lat: number }[] = [
  { name: "North America", lon: -98, lat: 40 },
  { name: "South America", lon: -60, lat: -15 },
  { name: "The western isles", lon: -6, lat: 54 },
  { name: "The north country", lon: 60, lat: 64 },
  { name: "Africa", lon: 20, lat: 2 },
  { name: "South Asia", lon: 80, lat: 22 },
  { name: "East Asia", lon: 116, lat: 36 },
  { name: "The far isles", lon: 160, lat: -16 },
  { name: "The south seas", lon: 134, lat: -27 },
];

/**
 * A curved arc between two lon/lat points, bowed perpendicular to the chord.
 * `bow` > 0 bows one way, < 0 the other, so the out-path and the home-path
 * trace a leaf between each corner and the land instead of overlapping.
 */
function arc(
  from: [number, number],
  to: [number, number],
  bow: number,
): string {
  const [x1, y1] = projectEquirect(from[0], from[1]);
  const [x2, y2] = projectEquirect(to[0], to[1]);
  const mx = (x1 + x2) / 2;
  const my = (y1 + y2) / 2;
  const dx = x2 - x1;
  const dy = y2 - y1;
  const len = Math.hypot(dx, dy) || 1;
  // unit normal
  const nx = -dy / len;
  const ny = dx / len;
  const cx = mx + nx * len * bow;
  const cy = my + ny * len * bow;
  return `M${x1.toFixed(1)},${y1.toFixed(1)} Q${cx.toFixed(1)},${cy.toFixed(
    1,
  )} ${x2.toFixed(1)},${y2.toFixed(1)}`;
}

export default function MapsSheet({ onClose }: Props) {
  const [state, setState] = useState<
    ToolFetchResult<MapPlacesResponse> | { status: "loading" }
  >({ status: "loading" });
  const [showScattering, setShowScattering] = useState(true);
  const [showGathering, setShowGathering] = useState(true);

  useEffect(() => {
    let cancelled = false;
    setState({ status: "loading" });
    fetchMapsPlaces().then((res) => {
      if (!cancelled) setState(res);
    });
    return () => {
      cancelled = true;
    };
  }, []);

  const places = useMemo<MapPlace[]>(
    () => (state.status === "ok" ? state.data.places : []),
    [state],
  );

  const [homeX, homeY] = projectEquirect(HOME[0], HOME[1]);

  return (
    <ToolSheet title="Maps · Dispersion & Gathering" onClose={onClose}>
      <ToolFoilNote>
        Drawn on our own SVG from a public-domain world map (Natural Earth) with
        ancient-place coordinates from openbible.info (CC-BY) — no copyrighted
        atlas plate. The overlay restores the geography the inherited "Holy
        Land" maps leave off.
      </ToolFoilNote>

      <div className="mb-4">
        <ToolAnnotationBand tool="maps" entryKey="dispersion-overlay" />
      </div>

      {state.status === "loading" && <ToolLoading label="Loading places…" />}
      {state.status === "error" && <ToolError message={state.message} />}
      {state.status === "tier-locked" && (
        <ToolTierLockedCard tierRequired={state.tierRequired} />
      )}
      {state.status === "ok" && (
        <div className="space-y-3">
          <div className="flex flex-wrap items-center justify-between gap-2 text-xs text-[var(--reader-muted)]">
            <span>{places.length} ancient places · whole earth</span>
            <div className="flex gap-3">
              <label className="flex items-center gap-1.5">
                <input
                  type="checkbox"
                  checked={showScattering}
                  onChange={(e) => setShowScattering(e.target.checked)}
                />
                <span style={{ color: "#C0454B" }}>Scattering</span>
              </label>
              <label className="flex items-center gap-1.5">
                <input
                  type="checkbox"
                  checked={showGathering}
                  onChange={(e) => setShowGathering(e.target.checked)}
                />
                <span style={{ color: "#3F8E63" }}>Gathering</span>
              </label>
            </div>
          </div>

          <svg
            viewBox={`${VIEW_X} ${VIEW_Y} ${VIEW_W} ${VIEW_H}`}
            className="w-full rounded border border-[var(--reader-rule)] bg-[var(--reader-surface-elev)]"
            role="img"
            aria-label="Whole-earth map: the worldwide scattering of the seed of Yashar'el and the gathering home from the four corners and the islands of the sea"
          >
            <defs>
              <marker
                id="arrow-out"
                viewBox="0 0 10 10"
                refX="8"
                refY="5"
                markerWidth="6"
                markerHeight="6"
                orient="auto-start-reverse"
              >
                <path d="M0,0 L10,5 L0,10 z" fill="#C0454B" />
              </marker>
              <marker
                id="arrow-home"
                viewBox="0 0 10 10"
                refX="8"
                refY="5"
                markerWidth="6"
                markerHeight="6"
                orient="auto-start-reverse"
              >
                <path d="M0,0 L10,5 L0,10 z" fill="#3F8E63" />
              </marker>
            </defs>

            {/* Sea */}
            <rect
              x={VIEW_X}
              y={VIEW_Y}
              width={VIEW_W}
              height={VIEW_H}
              fill="var(--reader-surface-elev)"
            />

            {/* Land — the real public-domain world (Natural Earth) */}
            <path
              d={WORLD_PATH}
              fill="var(--reader-rule)"
              stroke="var(--reader-bg)"
              strokeWidth={0.35}
              opacity={0.55}
            />

            {/* The ancient places — the faint homeland cluster over the Levant */}
            {places.map((p) => {
              const [x, y] = projectEquirect(p.lon, p.lat);
              return (
                <circle
                  key={p.place_id}
                  cx={x}
                  cy={y}
                  r={0.9}
                  fill="var(--reader-accent)"
                  opacity={0.4}
                >
                  <title>{p.name ?? p.place_id}</title>
                </circle>
              );
            })}

            {/* Scattering OUT (red) — to all nations, the four winds, the ends
                of the earth, across the seas to the Americas. */}
            {showScattering && (
              <g fill="none" stroke="#C0454B" strokeWidth={1.4} opacity={0.85}>
                {CORNERS.map((c) => (
                  <path
                    key={`out-${c.name}`}
                    d={arc(HOME, [c.lon, c.lat], 0.16)}
                    markerEnd="url(#arrow-out)"
                  />
                ))}
              </g>
            )}

            {/* Gathering HOME (green) — from the four corners and the islands
                of the sea, the whole house of all twelve tribes. */}
            {showGathering && (
              <g fill="none" stroke="#3F8E63" strokeWidth={1.4} opacity={0.9}>
                {CORNERS.map((c) => (
                  <path
                    key={`home-${c.name}`}
                    d={arc([c.lon, c.lat], HOME, 0.16)}
                    markerEnd="url(#arrow-home)"
                  />
                ))}
              </g>
            )}

            {/* The land — origin and destination */}
            <circle cx={homeX} cy={homeY} r={3} fill="var(--reader-accent)" />
            <text
              x={homeX + 5}
              y={homeY - 4}
              fontSize={10}
              fill="var(--reader-text)"
            >
              the land
            </text>
          </svg>

          <div className="flex flex-wrap gap-4 text-[11px] text-[var(--reader-muted)]">
            <span>
              <span style={{ color: "#C0454B" }}>──▶</span> scattering — to all
              nations, the ends of the earth
            </span>
            <span>
              <span style={{ color: "#3F8E63" }}>──▶</span> gathering — home from
              the four corners &amp; the isles
            </span>
          </div>
        </div>
      )}
    </ToolSheet>
  );
}
