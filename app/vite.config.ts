import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
  server: {
    // Default Vite dev port. The live API at bible.remnantofpromise.org
    // has CORS_ORIGINS configured to allow http://localhost:5173, so the
    // reader fetches the production API directly during local dev.
    port: 5173,
    // S127 W7 — the share-card render imports the locked v4 brand-mark
    // from `~/Desktop/App/brand-assets/` (one level above the Vite
    // project root at `app/`). Vite's default fs.allow is the project
    // root only, which would block the import. Adding `..` permits
    // imports from the repo root downward, so `brand-assets/` is
    // reachable. Source-of-truth stays in `brand-assets/` per
    // DESIGN_LANGUAGE.md §24; Vite content-hashes the bytes into the
    // PWA bundle at build time.
    fs: {
      allow: [".."],
    },
  },
})
