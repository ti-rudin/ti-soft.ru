import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'
import { fileURLToPath, URL } from 'node:url'
import history from 'connect-history-api-fallback'

export default defineConfig(({ mode }) => {
  // Загружаем переменные окружения из папки main-front
  const env = loadEnv(mode, process.cwd(), '')
  console.log(env);

  return {
  plugins: [vue()],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  server: {
    host: true,
    port: 4001, 
    cors: false,
    strictPort: true,
    allowedHosts: env.VITE_ALLOWED_HOSTS ? env.VITE_ALLOWED_HOSTS.split(',') : ['all'],
    headers: {
      'Cross-Origin-Opener-Policy': 'same-origin-allow-popups',
      'Cross-Origin-Embedder-Policy': 'require-corp',
      'Content-Security-Policy' : "script-src 'self' 'unsafe-inline' mc.yandex.ru ti-soft.ru yastatic.net 'nonce-erere34r3fdca3df4f'; img-src ti-soft.ru https://mc.yandex.ru; child-src blob: https://mc.yandex.ru; frame-src blob: https://mc.yandex.ru; frame-ancestors blob: https://mc.yandex.ru;"

    },
    proxy: {
    },
    middleware: [
      history({
        verbose: true,
        disableDotRule: true,
        htmlAcceptHeaders: ['text/html', 'application/xhtml+xml']
      })
    ]
  },
  preview: {
    port: 4001,
    allowedHosts: env.VITE_ALLOWED_HOSTS ? env.VITE_ALLOWED_HOSTS.split(',') : ['all'],
  },
  base: '/',
  publicDir: 'public',
  build: {
    rollupOptions: {
      output: {
        manualChunks: undefined
      }
    }
  }
}})
