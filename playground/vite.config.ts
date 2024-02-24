import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// NOTE: for security reason, SharedArrayBuffer(, which is required for wasm runtime) cannot run without these headers!
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
  plugins: [react(), crossOriginPolicy],
  // HACK: fix link path because endpoint of GitHub pages is https://syuparn.github.io/onylox/ (not root)
  base: process.env.GITHUB_PAGES
    ? 'onylox'
    : './'
})
