import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import DownloadStatusIndicator from './components/DownloadStatusIndicator.tsx'
import { bootstrapBackgroundDownloads } from './lib/downloadManager.ts'

// S355 — resume an interrupted offline download IMMEDIATELY on page load,
// before React mounts and without waiting for the /me round-trip. Every in-app
// navigation is a full-page reload that tears down the JS context and stops the
// download; this restarts it in the first frame so the partner never has to tap
// "Resume" and the background download keeps making progress across navigation.
bootstrapBackgroundDownloads()

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <App />
    {/* Global offline-download progress pill. Mounted as a sibling of the
        whole app (not inside any route) so it stays visible on EVERY
        surface — the partner can start a download in Settings, navigate
        away to read, and still see it progressing to completion. It only
        depends on the module-level download manager, so it needs no app
        context. */}
    <DownloadStatusIndicator />
  </StrictMode>,
)
