/**
 * planner-store.ts — the personal-planner persistence layer for the calendar
 * day-view (The Appointed Times, v2).
 *
 * DELIBERATELY abstracted behind a `PlannerStore` interface so the launch
 * backbone — real cross-device sync — can drop in behind the same shape with
 * zero changes to the UI. This pass ships a synchronous localStorage backing
 * (the same persistence convention the app already uses for prefs, e.g.
 * lib/theme.ts), namespaced under one key.
 *
 * >>> FOLLOW-UP DEPENDENCY (launch-blocking): replace LocalStoragePlannerStore
 *     with a synced implementation (server / CRDT). The interface below is the
 *     seam — keep it stable. Entries are keyed by an opaque civil-day id
 *     (YYYY-MM-DD of the day's daytime) so a server can key the same way. <<<
 */

// ---------------------------------------------------------------------------
// Domain
// ---------------------------------------------------------------------------

export type PlannerItemKind = "event" | "task" | "note";

export interface PlannerItem {
  id: string;
  kind: PlannerItemKind;
  /** The civil day this item belongs to (YYYY-MM-DD). */
  dayId: string;
  /** Free text — the event title, task label, or note body. */
  text: string;
  /** Optional time-of-day for events, e.g. "18:30". */
  time?: string;
  /** Tasks only: completion state. */
  done?: boolean;
  /** Millis since epoch when created — for stable ordering. */
  createdAt: number;
}

export interface DayPlanner {
  events: PlannerItem[];
  tasks: PlannerItem[];
  notes: PlannerItem[];
}

/** The seam a real sync backend implements. Intentionally tiny. */
export interface PlannerStore {
  /** All items for one civil day, grouped by kind. */
  getDay(dayId: string): DayPlanner;
  /** Add an item; returns the created item (with generated id). */
  add(input: Omit<PlannerItem, "id" | "createdAt">): PlannerItem;
  /** Patch an existing item by id. No-op if absent. */
  update(id: string, patch: Partial<Omit<PlannerItem, "id" | "dayId">>): void;
  /** Remove an item by id. */
  remove(id: string): void;
  /** Civil-day ids that hold at least one item — for grid badges. */
  daysWithItems(): Set<string>;
  /** Subscribe to changes; returns an unsubscribe fn. */
  subscribe(listener: () => void): () => void;
}

// ---------------------------------------------------------------------------
// localStorage implementation
// ---------------------------------------------------------------------------

const STORAGE_KEY = "calendar-planner-v1";

interface Persisted {
  version: 1;
  items: Record<string, PlannerItem>;
}

function emptyState(): Persisted {
  return { version: 1, items: {} };
}

/** A stable-enough id without Math.random (id = kind + dayId + counter+time). */
let idCounter = 0;
function makeId(kind: PlannerItemKind, dayId: string, createdAt: number): string {
  idCounter += 1;
  return `${kind}_${dayId}_${createdAt.toString(36)}_${idCounter.toString(36)}`;
}

export class LocalStoragePlannerStore implements PlannerStore {
  private state: Persisted;
  private listeners = new Set<() => void>();
  // Snapshot caches — getDay/daysWithItems MUST return stable references between
  // mutations so useSyncExternalStore doesn't loop. Bumped on every write.
  private version = 0;
  private dayCache = new Map<string, { version: number; value: DayPlanner }>();
  private daysCache: { version: number; value: Set<string> } | null = null;

  constructor() {
    this.state = this.read();
  }

  private read(): Persisted {
    if (typeof localStorage === "undefined") return emptyState();
    try {
      const raw = localStorage.getItem(STORAGE_KEY);
      if (!raw) return emptyState();
      const parsed = JSON.parse(raw) as Persisted;
      if (!parsed || parsed.version !== 1 || typeof parsed.items !== "object") {
        return emptyState();
      }
      return parsed;
    } catch {
      return emptyState();
    }
  }

  private write(): void {
    this.version += 1; // invalidate snapshot caches
    if (typeof localStorage !== "undefined") {
      try {
        localStorage.setItem(STORAGE_KEY, JSON.stringify(this.state));
      } catch {
        /* quota / private mode — keep working in-memory */
      }
    }
    for (const l of this.listeners) l();
  }

  getDay(dayId: string): DayPlanner {
    const cached = this.dayCache.get(dayId);
    if (cached && cached.version === this.version) return cached.value;
    const value = this.computeDay(dayId);
    this.dayCache.set(dayId, { version: this.version, value });
    return value;
  }

  private computeDay(dayId: string): DayPlanner {
    const out: DayPlanner = { events: [], tasks: [], notes: [] };
    for (const item of Object.values(this.state.items)) {
      if (item.dayId !== dayId) continue;
      if (item.kind === "event") out.events.push(item);
      else if (item.kind === "task") out.tasks.push(item);
      else out.notes.push(item);
    }
    const order = (a: PlannerItem, b: PlannerItem) =>
      (a.time ?? "").localeCompare(b.time ?? "") || a.createdAt - b.createdAt;
    out.events.sort(order);
    out.tasks.sort((a, b) => a.createdAt - b.createdAt);
    out.notes.sort((a, b) => a.createdAt - b.createdAt);
    return out;
  }

  add(input: Omit<PlannerItem, "id" | "createdAt">): PlannerItem {
    const createdAt = Date.now();
    const id = makeId(input.kind, input.dayId, createdAt);
    const item: PlannerItem = { ...input, id, createdAt };
    this.state.items[id] = item;
    this.write();
    return item;
  }

  update(id: string, patch: Partial<Omit<PlannerItem, "id" | "dayId">>): void {
    const cur = this.state.items[id];
    if (!cur) return;
    this.state.items[id] = { ...cur, ...patch };
    this.write();
  }

  remove(id: string): void {
    if (!this.state.items[id]) return;
    delete this.state.items[id];
    this.write();
  }

  daysWithItems(): Set<string> {
    if (this.daysCache && this.daysCache.version === this.version) {
      return this.daysCache.value;
    }
    const days = new Set<string>();
    for (const item of Object.values(this.state.items)) days.add(item.dayId);
    this.daysCache = { version: this.version, value: days };
    return days;
  }

  subscribe(listener: () => void): () => void {
    this.listeners.add(listener);
    return () => this.listeners.delete(listener);
  }
}

/** The app-wide singleton (swap this construction for the synced store later). */
export const plannerStore: PlannerStore = new LocalStoragePlannerStore();

/** Civil-day id (YYYY-MM-DD) from a daytime instant, in UTC to match the grid. */
export function civilDayId(daytime: Date): string {
  const y = daytime.getUTCFullYear();
  const m = String(daytime.getUTCMonth() + 1).padStart(2, "0");
  const d = String(daytime.getUTCDate()).padStart(2, "0");
  return `${y}-${m}-${d}`;
}
