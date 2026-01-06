import { defineConfig } from 'vite'
import { glob } from 'glob'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))

// Get all HTML files for multi-page build
const getEntries = () => {
    const htmlFiles = glob.sync(path.resolve(__dirname, '*.html'), {
        ignore: 'node_modules/**'
    })

    const entries = {}
    htmlFiles.forEach(file => {
        const name = path.basename(file, '.html')
        entries[name] = file
    })

    return entries
}

export default defineConfig({
    root: __dirname,
    base: '/',

    // Server configuration
    server: {
        port: 5173,
        strictPort: false,
        open: true,
        hmr: {
            protocol: 'ws',
            host: 'localhost',
            port: 5173
        }
    },

    // Preview configuration
    preview: {
        port: 5000,
        strictPort: false
    },

    // Build configuration
    build: {
        // Output directory
        outDir: 'dist',

        // Empty outDir on build
        emptyOutDir: true,

        // Source map
        sourcemap: false,

        // Minification
        minify: 'terser',
        terserOptions: {
            compress: {
                drop_console: true,
                drop_debugger: true
            }
        },

        // Rollup options
        rollupOptions: {
            input: getEntries(),
            output: {
                // Preserve folder structure
                preserveModules: false,
                entryFileNames: '[name].js',
                chunkFileNames: 'js/[name]-[hash].js',
                assetFileNames: (assetInfo) => {
                    const info = assetInfo.name.split('.')
                    const ext = info[info.length - 1]

                    if (/png|jpe?g|gif|svg|webp|avif/.test(ext)) {
                        return `images/[name]-[hash][extname]`
                    } else if (/woff|woff2|eot|ttf|otf/.test(ext)) {
                        return `fonts/[name]-[hash][extname]`
                    } else if (ext === 'css') {
                        return `css/[name]-[hash][extname]`
                    }
                    return `assets/[name]-[hash][extname]`
                }
            }
        },

        // Chunk size warnings
        chunkSizeWarningLimit: 500,

        // CSS code split
        cssCodeSplit: true,

        // Assets inline limit (in bytes)
        assetsInlineLimit: 4096,

        // Report compressed file size
        reportCompressedSize: true
    },

    // Optimization
    optimizeDeps: {
        include: [
            'jquery'
        ]
    },

    // CSS configuration
    css: {
        postcss: null,
        preprocessorOptions: {
            css: {
                charset: false
            }
        }
    },

    // Resolve configuration
    resolve: {
        alias: {
            '@': path.resolve(__dirname, './src'),
            '@images': path.resolve(__dirname, './images'),
            '@styles': path.resolve(__dirname, './css'),
            '@scripts': path.resolve(__dirname, './js')
        },
        extensions: ['.mjs', '.js', '.ts', '.jsx', '.tsx', '.json']
    }
})
