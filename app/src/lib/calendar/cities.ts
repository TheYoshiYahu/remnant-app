/**
 * cities.ts — a bundled, offline list of places the reader can pick so the
 * calendar engine computes sunset boundaries, feast days, and crescent
 * visibility for their own sky instead of Jerusalem's.
 *
 * Fully offline, no geocoding service — true to the engine's "COMPUTE, DON'T
 * SCRAPE" rule. Each entry carries the fields the engine's `GeoLocation` needs:
 * latitude (°N), longitude (°E), elevation (m), and a human label. The list is
 * a broad global spread of major cities; the picker also lets the reader land
 * near their region even if their exact town isn't listed. Jerusalem leads as
 * the canonical reference.
 */

import { JERUSALEM, type GeoLocation } from "./types.ts";

export interface City extends GeoLocation {
  /** Display name — required for cities (GeoLocation's label is optional). */
  label: string;
  /** Country / region, for disambiguating same-named cities in the picker. */
  region: string;
  /** Extra search terms (common alternates) so search finds the place. */
  aka?: string[];
}

/**
 * The bundled places. Coordinates are city-center; elevation is approximate —
 * both are far more accurate for the reader's sunset than defaulting to
 * Jerusalem. Sorted into the picker by label at render time.
 */
export const CITIES: readonly City[] = [
  // ── Reference ──
  { label: "Jerusalem", region: "Israel", latitudeDeg: JERUSALEM.latitudeDeg, longitudeDeg: JERUSALEM.longitudeDeg, elevationM: JERUSALEM.elevationM, aka: ["yerushalayim"] },

  // ── North America ──
  { label: "New York", region: "USA", latitudeDeg: 40.7128, longitudeDeg: -74.006, elevationM: 10, aka: ["nyc"] },
  { label: "Los Angeles", region: "USA", latitudeDeg: 34.0522, longitudeDeg: -118.2437, elevationM: 71, aka: ["la"] },
  { label: "Chicago", region: "USA", latitudeDeg: 41.8781, longitudeDeg: -87.6298, elevationM: 181 },
  { label: "Houston", region: "USA", latitudeDeg: 29.7604, longitudeDeg: -95.3698, elevationM: 24 },
  { label: "Phoenix", region: "USA", latitudeDeg: 33.4484, longitudeDeg: -112.074, elevationM: 331 },
  { label: "Denver", region: "USA", latitudeDeg: 39.7392, longitudeDeg: -104.9903, elevationM: 1609 },
  { label: "Atlanta", region: "USA", latitudeDeg: 33.749, longitudeDeg: -84.388, elevationM: 320 },
  { label: "Miami", region: "USA", latitudeDeg: 25.7617, longitudeDeg: -80.1918, elevationM: 2 },
  { label: "Dallas", region: "USA", latitudeDeg: 32.7767, longitudeDeg: -96.797, elevationM: 131 },
  { label: "Seattle", region: "USA", latitudeDeg: 47.6062, longitudeDeg: -122.3321, elevationM: 53 },
  { label: "San Francisco", region: "USA", latitudeDeg: 37.7749, longitudeDeg: -122.4194, elevationM: 16 },
  { label: "Washington, D.C.", region: "USA", latitudeDeg: 38.9072, longitudeDeg: -77.0369, elevationM: 7, aka: ["dc"] },
  { label: "Toronto", region: "Canada", latitudeDeg: 43.6532, longitudeDeg: -79.3832, elevationM: 76 },
  { label: "Vancouver", region: "Canada", latitudeDeg: 49.2827, longitudeDeg: -123.1207, elevationM: 70 },
  { label: "Montreal", region: "Canada", latitudeDeg: 45.5019, longitudeDeg: -73.5674, elevationM: 36 },
  { label: "Mexico City", region: "Mexico", latitudeDeg: 19.4326, longitudeDeg: -99.1332, elevationM: 2240 },

  // ── South America ──
  { label: "São Paulo", region: "Brazil", latitudeDeg: -23.5505, longitudeDeg: -46.6333, elevationM: 760, aka: ["sao paulo"] },
  { label: "Rio de Janeiro", region: "Brazil", latitudeDeg: -22.9068, longitudeDeg: -43.1729, elevationM: 2 },
  { label: "Buenos Aires", region: "Argentina", latitudeDeg: -34.6037, longitudeDeg: -58.3816, elevationM: 25 },
  { label: "Lima", region: "Peru", latitudeDeg: -12.0464, longitudeDeg: -77.0428, elevationM: 154 },
  { label: "Bogotá", region: "Colombia", latitudeDeg: 4.711, longitudeDeg: -74.0721, elevationM: 2640, aka: ["bogota"] },
  { label: "Santiago", region: "Chile", latitudeDeg: -33.4489, longitudeDeg: -70.6693, elevationM: 570 },

  // ── Europe ──
  { label: "London", region: "United Kingdom", latitudeDeg: 51.5074, longitudeDeg: -0.1278, elevationM: 11 },
  { label: "Manchester", region: "United Kingdom", latitudeDeg: 53.4808, longitudeDeg: -2.2426, elevationM: 38 },
  { label: "Dublin", region: "Ireland", latitudeDeg: 53.3498, longitudeDeg: -6.2603, elevationM: 20 },
  { label: "Paris", region: "France", latitudeDeg: 48.8566, longitudeDeg: 2.3522, elevationM: 35 },
  { label: "Madrid", region: "Spain", latitudeDeg: 40.4168, longitudeDeg: -3.7038, elevationM: 667 },
  { label: "Barcelona", region: "Spain", latitudeDeg: 41.3874, longitudeDeg: 2.1686, elevationM: 12 },
  { label: "Lisbon", region: "Portugal", latitudeDeg: 38.7223, longitudeDeg: -9.1393, elevationM: 2 },
  { label: "Rome", region: "Italy", latitudeDeg: 41.9028, longitudeDeg: 12.4964, elevationM: 21 },
  { label: "Berlin", region: "Germany", latitudeDeg: 52.52, longitudeDeg: 13.405, elevationM: 34 },
  { label: "Amsterdam", region: "Netherlands", latitudeDeg: 52.3676, longitudeDeg: 4.9041, elevationM: -2 },
  { label: "Zurich", region: "Switzerland", latitudeDeg: 47.3769, longitudeDeg: 8.5417, elevationM: 408 },
  { label: "Vienna", region: "Austria", latitudeDeg: 48.2082, longitudeDeg: 16.3738, elevationM: 151 },
  { label: "Stockholm", region: "Sweden", latitudeDeg: 59.3293, longitudeDeg: 18.0686, elevationM: 28 },
  { label: "Oslo", region: "Norway", latitudeDeg: 59.9139, longitudeDeg: 10.7522, elevationM: 23 },
  { label: "Warsaw", region: "Poland", latitudeDeg: 52.2297, longitudeDeg: 21.0122, elevationM: 113 },
  { label: "Athens", region: "Greece", latitudeDeg: 37.9838, longitudeDeg: 23.7275, elevationM: 170 },
  { label: "Kyiv", region: "Ukraine", latitudeDeg: 50.4501, longitudeDeg: 30.5234, elevationM: 179, aka: ["kiev"] },
  { label: "Moscow", region: "Russia", latitudeDeg: 55.7558, longitudeDeg: 37.6173, elevationM: 156 },

  // ── Africa ──
  { label: "Cairo", region: "Egypt", latitudeDeg: 30.0444, longitudeDeg: 31.2357, elevationM: 23 },
  { label: "Lagos", region: "Nigeria", latitudeDeg: 6.5244, longitudeDeg: 3.3792, elevationM: 11 },
  { label: "Nairobi", region: "Kenya", latitudeDeg: -1.2921, longitudeDeg: 36.8219, elevationM: 1795 },
  { label: "Johannesburg", region: "South Africa", latitudeDeg: -26.2041, longitudeDeg: 28.0473, elevationM: 1753 },
  { label: "Cape Town", region: "South Africa", latitudeDeg: -33.9249, longitudeDeg: 18.4241, elevationM: 25 },
  { label: "Accra", region: "Ghana", latitudeDeg: 5.6037, longitudeDeg: -0.187, elevationM: 61 },
  { label: "Addis Ababa", region: "Ethiopia", latitudeDeg: 9.03, longitudeDeg: 38.74, elevationM: 2355 },
  { label: "Casablanca", region: "Morocco", latitudeDeg: 33.5731, longitudeDeg: -7.5898, elevationM: 27 },

  // ── Middle East ──
  { label: "Tel Aviv", region: "Israel", latitudeDeg: 32.0853, longitudeDeg: 34.7818, elevationM: 5 },
  { label: "Istanbul", region: "Turkey", latitudeDeg: 41.0082, longitudeDeg: 28.9784, elevationM: 39 },
  { label: "Dubai", region: "UAE", latitudeDeg: 25.2048, longitudeDeg: 55.2708, elevationM: 5 },
  { label: "Riyadh", region: "Saudi Arabia", latitudeDeg: 24.7136, longitudeDeg: 46.6753, elevationM: 612 },
  { label: "Amman", region: "Jordan", latitudeDeg: 31.9454, longitudeDeg: 35.9284, elevationM: 757 },
  { label: "Beirut", region: "Lebanon", latitudeDeg: 33.8938, longitudeDeg: 35.5018, elevationM: 56 },
  { label: "Baghdad", region: "Iraq", latitudeDeg: 33.3152, longitudeDeg: 44.3661, elevationM: 34 },
  { label: "Tehran", region: "Iran", latitudeDeg: 35.6892, longitudeDeg: 51.389, elevationM: 1190 },

  // ── Asia ──
  { label: "New Delhi", region: "India", latitudeDeg: 28.6139, longitudeDeg: 77.209, elevationM: 216, aka: ["delhi"] },
  { label: "Mumbai", region: "India", latitudeDeg: 19.076, longitudeDeg: 72.8777, elevationM: 14 },
  { label: "Bangalore", region: "India", latitudeDeg: 12.9716, longitudeDeg: 77.5946, elevationM: 920, aka: ["bengaluru"] },
  { label: "Karachi", region: "Pakistan", latitudeDeg: 24.8607, longitudeDeg: 67.0011, elevationM: 8 },
  { label: "Dhaka", region: "Bangladesh", latitudeDeg: 23.8103, longitudeDeg: 90.4125, elevationM: 4 },
  { label: "Bangkok", region: "Thailand", latitudeDeg: 13.7563, longitudeDeg: 100.5018, elevationM: 2 },
  { label: "Singapore", region: "Singapore", latitudeDeg: 1.3521, longitudeDeg: 103.8198, elevationM: 15 },
  { label: "Jakarta", region: "Indonesia", latitudeDeg: -6.2088, longitudeDeg: 106.8456, elevationM: 8 },
  { label: "Manila", region: "Philippines", latitudeDeg: 14.5995, longitudeDeg: 120.9842, elevationM: 16 },
  { label: "Hong Kong", region: "China", latitudeDeg: 22.3193, longitudeDeg: 114.1694, elevationM: 8 },
  { label: "Shanghai", region: "China", latitudeDeg: 31.2304, longitudeDeg: 121.4737, elevationM: 4 },
  { label: "Beijing", region: "China", latitudeDeg: 39.9042, longitudeDeg: 116.4074, elevationM: 44 },
  { label: "Tokyo", region: "Japan", latitudeDeg: 35.6762, longitudeDeg: 139.6503, elevationM: 40 },
  { label: "Seoul", region: "South Korea", latitudeDeg: 37.5665, longitudeDeg: 126.978, elevationM: 38 },

  // ── Oceania ──
  { label: "Sydney", region: "Australia", latitudeDeg: -33.8688, longitudeDeg: 151.2093, elevationM: 58 },
  { label: "Melbourne", region: "Australia", latitudeDeg: -37.8136, longitudeDeg: 144.9631, elevationM: 31 },
  { label: "Perth", region: "Australia", latitudeDeg: -31.9523, longitudeDeg: 115.8613, elevationM: 46 },
  { label: "Brisbane", region: "Australia", latitudeDeg: -27.4698, longitudeDeg: 153.0251, elevationM: 27 },
  { label: "Auckland", region: "New Zealand", latitudeDeg: -36.8485, longitudeDeg: 174.7633, elevationM: 196 },
];

/** Case-insensitive search over label, region, and alternates. */
export function searchCities(query: string): readonly City[] {
  const q = query.trim().toLowerCase();
  const sorted = [...CITIES].sort((a, b) => a.label.localeCompare(b.label));
  if (!q) return sorted;
  return sorted.filter(
    (c) =>
      c.label.toLowerCase().includes(q) ||
      c.region.toLowerCase().includes(q) ||
      (c.aka?.some((a) => a.includes(q)) ?? false),
  );
}
