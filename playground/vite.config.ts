import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// used for local development (for wasm)
const crossOriginPolicy = {
  name: "configure-server",

  configureServer(server) {
    server.middlewares.use((_req, res, next) => {
      res.setHeader("Cross-Origin-Opener-Policy", "same-origin")
      res.setHeader("Cross-Origin-Embedder-Policy", "require-corp")
      next()
    })
  },
}

// https://vitejs.dev/config/
export default defineConfig({
  // HACK: import dynamically to avoid `ReferenceError: document is not defined`
  build: {
    modulePreload: {
        polyfill: false,
    },
  },
  plugins: [react(), crossOriginPolicy],
  // HACK: fix link path because endpoint of GitHub pages is https://syuparn.github.io/onylox/ (not root)
  base: process.env.GITHUB_PAGES
    ? 'onylox'
    : './'
})
