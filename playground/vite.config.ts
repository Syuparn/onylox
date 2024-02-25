import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  // HACK: import dynamically to avoid `ReferenceError: document is not defined`
  build: {
    modulePreload: {
        polyfill: false,
    },
  },
  plugins: [react()],
  // HACK: fix link path because endpoint of GitHub pages is https://syuparn.github.io/onylox/ (not root)
  base: process.env.GITHUB_PAGES
    ? 'onylox'
    : './'
})
