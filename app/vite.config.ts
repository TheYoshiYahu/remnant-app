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
  },
})
