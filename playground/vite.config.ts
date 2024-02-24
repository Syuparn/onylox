import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  // HACK: fix link path because endpoint of GitHub pages is https://syuparn.github.io/onylox/ (not root)
  base: process.env.GITHUB_PAGES
    ? 'onylox'
    : './',
  worker: {
    // NOTE: since service worker is used for COOP/COEP in GitHub Pages, this is nesessary to avoid `ReferenceError: document is not defined`
    // https://github.com/vitejs/vite/issues/15305
    format: 'es'
  }
})
