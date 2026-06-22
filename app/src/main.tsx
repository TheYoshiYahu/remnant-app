import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import DownloadStatusIndicator from './components/DownloadStatusIndicator.tsx'

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
