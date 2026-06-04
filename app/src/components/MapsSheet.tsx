/**
 * MapsSheet — own-tile Bible map render (S197, new surface).
 *
 * We ship coordinates only (openbible.info ancient places, CC-BY) and render on
 * our own SVG — no copyrighted atlas plate. An equirectangular projection over
 * the Ancient-Near-East bounding box plots every place with a representative
 * point; on top we draw the dispersion/gathering overlay the inherited atlases
 * leave off — the Assyrian and Babylonian exile routes that scattered the house
 * of Yashar'el, and the gathering home the prophets promised. The framework note
 * rides via ToolAnnotationBand tool="maps", entry_key="dispersion-overlay".
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

interface Props {
  onClose: () => void;
}

// Ancient-Near-East bounding box (lon/lat) — covers Egypt → Mesopotamia.
const LON_MIN = 24;
const LON_MAX = 52;
const LAT_MIN = 24;
const LAT_MAX = 43;
const W = 900;
const H = Math.round((W * (LAT_MAX - LAT_MIN)) / (LON_MAX - LON_MIN));

function project(lon: number, lat: number): [number, number] {
  const x = ((lon - LON_MIN) / (LON_MAX - LON_MIN)) * W;
  const y = ((LAT_MAX - lat) / (LAT_MAX - LAT_MIN)) * H;
  return [x, y];
}

function inBox(p: MapPlace): boolean {
  return (
    p.lon >= LON_MIN && p.lon <= LON_MAX && p.lat >= LAT_MIN && p.lat <= LAT_MAX
  );
}

// Illustrative dispersion (out) + gathering (home) routes, drawn on our tiles.
// Coordinates are approximate anchor points, projected the same as the places.
const SAMARIA: [number, number] = [35.3, 32.28]; // northern kingdom capital
const NINEVEH: [number, number] = [43.15, 36.36]; // Assyria
const JERUSALEM: [number, number] = [35.23, 31.78];
const BABYLON: [number, number] = [44.42, 32.54];

export default function MapsSheet({ onClose }: Props) {
  const [state, setState] = useState<
    ToolFetchResult<MapPlacesResponse> | { status: "loading" }
  >({ status: "loading" });
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

  const points = useMemo(() => {
    if (state.status !== "ok") return [];
    return state.data.places.filter(inBox);
  }, [state]);

  return (
    <ToolSheet title="Maps · Dispersion & Gathering" onClose={onClose}>
      <ToolFoilNote>
        Rendered on our own tiles from openbible.info coordinates (CC-BY) and
        OpenStreetMap geometry (ODbL) — no copyrighted atlas plate. The overlay
        adds the geography the inherited "Holy Land" maps leave off.
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
          <div className="flex items-center justify-between text-xs text-[var(--reader-muted)]">
            <span>{points.length} places plotted</span>
            <label className="flex items-center gap-1.5">
              <input
                type="checkbox"
                checked={showGathering}
                onChange={(e) => setShowGathering(e.target.checked)}
              />
              Scattering &amp; gathering overlay
            </label>
          </div>

          <svg
            viewBox={`0 0 ${W} ${H}`}
            className="w-full rounded border border-[var(--reader-rule)] bg-[var(--reader-surface-elev)]"
            role="img"
            aria-label="Ancient Near East map with dispersion and gathering routes"
          >
            <defs>
              <marker
                id="arrow-out"
                viewBox="0 0 10 10"
                refX="8"
                refY="5"
                markerWidth="7"
                markerHeight="7"
                orient="auto-start-reverse"
              >
                <path d="M0,0 L10,5 L0,10 z" fill="#C0454B" />
              </marker>
              <marker
                id="arrow-home"
                viewBox="0 0 10 10"
                refX="8"
                refY="5"
                markerWidth="7"
                markerHeight="7"
                orient="auto-start-reverse"
              >
                <path d="M0,0 L10,5 L0,10 z" fill="#3F8E63" />
              </marker>
            </defs>

            {/* Place dots — the untouched base geography. */}
            {points.map((p) => {
              const [x, y] = project(p.lon, p.lat);
              return (
                <circle
                  key={p.place_id}
                  cx={x}
                  cy={y}
                  r={1.6}
                  fill="var(--reader-muted)"
                  opacity={0.55}
                >
                  <title>{p.name ?? p.place_id}</title>
                </circle>
              );
            })}

            {showGathering && (
              <g strokeWidth={2.2} fill="none">
                {/* Dispersion OUT (red) — Assyrian + Babylonian exile */}
                <line
                  x1={project(...SAMARIA)[0]}
                  y1={project(...SAMARIA)[1]}
                  x2={project(...NINEVEH)[0]}
                  y2={project(...NINEVEH)[1]}
                  stroke="#C0454B"
                  markerEnd="url(#arrow-out)"
                />
                <line
                  x1={project(...JERUSALEM)[0]}
                  y1={project(...JERUSALEM)[1]}
                  x2={project(...BABYLON)[0]}
                  y2={project(...BABYLON)[1]}
                  stroke="#C0454B"
                  strokeDasharray="6 4"
                  markerEnd="url(#arrow-out)"
                />
                {/* Gathering HOME (green) — the second recovery */}
                <line
                  x1={project(...NINEVEH)[0]}
                  y1={project(...NINEVEH)[1] + 6}
                  x2={project(...SAMARIA)[0]}
                  y2={project(...SAMARIA)[1] + 6}
                  stroke="#3F8E63"
                  markerEnd="url(#arrow-home)"
                />
                <line
                  x1={project(...BABYLON)[0]}
                  y1={project(...BABYLON)[1] + 6}
                  x2={project(...JERUSALEM)[0]}
                  y2={project(...JERUSALEM)[1] + 6}
                  stroke="#3F8E63"
                  strokeDasharray="6 4"
                  markerEnd="url(#arrow-home)"
                />
                {/* Anchor labels */}
                {(
                  [
                    ["Samaria", SAMARIA],
                    ["Nineveh", NINEVEH],
                    ["Jerusalem", JERUSALEM],
                    ["Babylon", BABYLON],
                  ] as [string, [number, number]][]
                ).map(([label, ll]) => {
                  const [x, y] = project(...ll);
                  return (
                    <g key={label}>
                      <circle cx={x} cy={y} r={3.2} fill="var(--reader-accent)" />
                      <text
                        x={x + 5}
                        y={y - 4}
                        fontSize={11}
                        fill="var(--reader-text)"
                      >
                        {label}
                      </text>
                    </g>
                  );
                })}
              </g>
            )}
          </svg>

          <div className="flex gap-4 text-[11px] text-[var(--reader-muted)]">
            <span>
              <span style={{ color: "#C0454B" }}>──▶</span> scattering (exile)
            </span>
            <span>
              <span style={{ color: "#3F8E63" }}>──▶</span> gathering (second
              recovery)
            </span>
          </div>
        </div>
      )}
    </ToolSheet>
  );
}
