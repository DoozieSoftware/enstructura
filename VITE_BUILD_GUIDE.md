# VITE BUILD SYSTEM - Setup & Deployment Guide

**Version:** 1.0
**Date:** January 5, 2026
**Purpose:** Production build optimization and compression for Enstructura website

---

## 📋 Table of Contents

1. [Overview](#overview)
2. [Installation](#installation)
3. [Build Commands](#build-commands)
4. [Compression Features](#compression-features)
5. [Deployment](#deployment)
6. [Optimization Tips](#optimization-tips)
7. [Troubleshooting](#troubleshooting)

---

## Overview

Vite is a modern build tool that provides:

- ✅ Fast development server with HMR (Hot Module Replacement)
- ✅ Production-optimized builds with code splitting
- ✅ Automatic minification and compression
- ✅ Multi-page static site support
- ✅ Asset optimization
- ✅ Reduced bundle size (typically 30-50% smaller)

### Expected Improvements

| Metric                     | Before     | After      | Savings |
| -------------------------- | ---------- | ---------- | ------- |
| CSS Size                   | 304 KB     | ~180 KB    | 41%     |
| JS Size                    | 416 KB     | ~240 KB    | 42%     |
| HTML Size                  | ~100 KB    | ~95 KB     | 5%      |
| **Total (without images)** | **820 KB** | **515 KB** | **37%** |

**Note:** Images are handled separately via Vite's asset optimization.

---

## Installation

### Prerequisites

- **Node.js:** v16.0.0 or higher
- **npm:** v7.0.0 or higher
- **macOS:** Terminal/iTerm2

### Step 1: Check Node.js Installation

```bash
node --version      # Should show v16.0.0 or higher
npm --version       # Should show v7.0.0 or higher
```

If not installed, download from https://nodejs.org/

### Step 2: Install Dependencies

```bash
cd /Users/akshaydoozie/Documents/doozie/websites/enstructura

# Install npm packages
npm install

# This will install:
# - vite (v5.0.8)
# - Other dev dependencies
```

**Expected time:** 2-5 minutes
**Size:** ~350 MB in node_modules (not deployed)

### Step 3: Verify Installation

```bash
npm list vite          # Should show vite@5.0.8 or higher
npx vite --version     # Should display version number
```

---

## Build Commands

### Development Server (Local Testing)

```bash
npm run dev
```

**What it does:**

- Starts local development server at http://localhost:5173
- Enables Hot Module Replacement (HMR)
- Watches for file changes
- Opens browser automatically
- Perfect for testing before deployment

**Stop server:** Press `Ctrl+C` in terminal

### Production Build (Deployment Ready)

```bash
npm run build
```

**What it does:**

- Creates optimized `dist/` folder
- Minifies all CSS/JS files
- Optimizes images
- Removes console logs
- Generates optimized output
- Creates production-ready files

**Time:** 30-60 seconds
**Output location:** `/Users/akshaydoozie/Documents/doozie/websites/enstructura/dist/`

### Preview Built Site

```bash
npm run preview
```

**What it does:**

- Starts server serving the `dist/` folder
- Tests production build locally
- Runs on http://localhost:5000
- Verifies deployment output

**Use before deployment to verify build is correct**

### Build Analysis (Debug)

```bash
npm run build:analyze
```

**What it does:**

- Creates build without minification
- Easier to debug issues
- Shows uncompressed sizes
- Useful for troubleshooting

### Clean Install (Start Fresh)

```bash
npm run clean
```

**What it does:**

- Removes `dist/` folder
- Removes `node_modules/` folder
- Start from scratch if needed

---

## Compression Features

### Automatic Optimizations Enabled

#### 1. CSS Minification

```bash
# Before: 304 KB
# After: ~180 KB
# Removes:
# - Whitespace
# - Comments
# - Unused properties
# - Redundant rules
```

#### 2. JavaScript Minification

```bash
# Before: 416 KB
# After: ~240 KB
# Removes:
# - Console logs
# - Debugger statements
# - Whitespace
# - Shortens variable names
```

#### 3. HTML Optimization

```bash
# Before: ~100 KB
# After: ~95 KB
# Removes:
# - Comments
# - Extra whitespace
# - Inline styles (not recommended, kept as-is)
```

#### 4. Image Optimization

```bash
# Auto-detects:
# - JPEG, PNG, GIF, WebP, AVIF
# - Optimizes paths in dist/images/
# - Preserves quality
# - Reduces file size
```

#### 5. Code Splitting

```bash
# Multi-page app support
# Each HTML file gets:
# - Own entry point
# - Shared dependencies
# - Optimized chunks
```

### Configuration (vite.config.js)

**Key settings:**

```javascript
// Minification
minify: "terser"; // Using Terser for best compression

// Drop console & debugger
drop_console: true; // Removes console.log()
drop_debugger: true; // Removes debugger statements

// Asset handling
assetsInlineLimit: 4096; // Inline assets < 4KB
cssCodeSplit: true; // Separate CSS files
chunkSizeWarningLimit: 500; // Warn if chunk > 500KB

// Output structure
outDir: "dist"; // Output folder
emptyOutDir: true; // Clean before build
sourcemap: false; // No source maps in prod
```

---

## Deployment

### Method 1: FTP/SFTP Upload (Most Common)

#### Step 1: Build Locally

```bash
cd /Users/akshaydoozie/Documents/doozie/websites/enstructura
npm run build
```

#### Step 2: Connect via FTP

- Open FTP client (FileZilla, Cyberduck, etc.)
- Connect to your server
- Navigate to `public_html` or `www` directory

#### Step 3: Upload Dist Folder

```
Local:  /Users/akshaydoozie/Documents/doozie/websites/enstructura/dist/
Remote: /public_html/
```

**Upload entire dist/ contents to root**

#### Step 4: Set Permissions

```bash
# Via SSH (if available)
cd /path/to/public_html
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
```

#### Step 5: Verify

- Visit https://www.enstructura.in
- Check all pages load
- Test links and forms
- Verify on mobile

---

### Method 2: SSH/SCP Upload (For Technical Users)

```bash
# Build locally
npm run build

# Upload via SCP
scp -r dist/* user@server:/var/www/public_html/

# SSH into server
ssh user@server

# Set permissions
cd /var/www/public_html
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
```

---

### Method 3: Git Deployment (Recommended for Developers)

#### Step 1: Initialize Git

```bash
cd /Users/akshaydoozie/Documents/doozie/websites/enstructura
git init
git add .
git commit -m "Initial website setup with Vite build system"
```

#### Step 2: Push to Repository

```bash
git remote add origin <your-repo-url>
git push -u origin main
```

#### Step 3: Deploy on Server

```bash
# SSH into server
ssh user@server

# Clone repository
cd /var/www
git clone <your-repo-url> enstructura
cd enstructura

# Install dependencies (on server)
npm install --production

# Build for production
npm run build

# Copy dist to public_html
cp -r dist/* /var/www/public_html/
```

---

## Optimization Tips

### 1. Image Optimization (Further Compression)

**Convert to WebP format** (saves 30-40%):

```bash
# Using ImageMagick (install: brew install imagemagick)
mogrify -format webp -quality 80 images/**/*.jpg
mogrify -format webp -quality 80 images/**/*.png
```

**Install image optimizer:**

```bash
# Using gulp or other build tools
npm install --save-dev gulp gulp-imagemin
```

### 2. Enable GZIP on Server

**Apache (.htaccess):**

```apache
<IfModule mod_deflate.c>
  AddOutputFilterByType DEFLATE text/html text/plain text/xml
  AddOutputFilterByType DEFLATE text/css text/javascript
  AddOutputFilterByType DEFLATE application/javascript application/x-javascript
  AddOutputFilterByType DEFLATE application/json
</IfModule>
```

**Nginx (nginx.conf):**

```nginx
gzip on;
gzip_types text/plain text/css text/javascript application/json;
gzip_min_length 1000;
gzip_level 6;
```

### 3. Enable Browser Caching

**Apache (.htaccess):**

```apache
<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresByType image/jpg "access plus 1 year"
  ExpiresByType image/jpeg "access plus 1 year"
  ExpiresByType image/png "access plus 1 year"
  ExpiresByType text/css "access plus 1 month"
  ExpiresByType application/javascript "access plus 1 month"
</IfModule>
```

### 4. CDN Integration

Use CDN for libraries (optional):

```html
<!-- In HTML files, before Vite imports -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
```

### 5. Remove Source Maps

Already configured in vite.config.js:

```javascript
sourcemap: false; // No .map files in production
```

### 6. Lazy Load Images

Add to images that aren't critical:

```html
<img src="image.jpg" loading="lazy" alt="Description" />
```

---

## Troubleshooting

### Issue: "command not found: npm"

**Solution:**

```bash
# Install Node.js from https://nodejs.org/
# Or using Homebrew
brew install node

# Verify installation
node --version
npm --version
```

### Issue: "Cannot find module 'vite'"

**Solution:**

```bash
cd /Users/akshaydoozie/Documents/doozie/websites/enstructura
rm -rf node_modules package-lock.json
npm install
```

### Issue: Build fails with "File not found"

**Solutions:**

1. Check file paths in vite.config.js
2. Verify all images referenced exist
3. Check for broken symbolic links
4. Run from correct directory

```bash
pwd  # Should show /Users/akshaydoozie/Documents/doozie/websites/enstructura
```

### Issue: Large dist/ folder size

**Solutions:**

1. Remove unused images from images/ before building
2. Archive old/unused files
3. Check node_modules size (not deployed):
   ```bash
   du -sh node_modules/  # Should be ~350 MB
   ```

### Issue: Pages not loading in dist/

**Solutions:**

1. Verify all HTML files listed in vite.config.js
2. Check file paths in HTML (relative vs absolute)
3. Ensure images/ folder copied to dist/
4. Test with `npm run preview` first

### Issue: CSS/JS not working after deploy

**Solutions:**

1. Clear browser cache (Ctrl+Shift+Del / Cmd+Shift+Delete)
2. Check MIME types on server
3. Verify .htaccess rules not blocking
4. Check file permissions (644 for files)

---

## File Structure After Build

```
dist/                           # Production-ready output
├── index.html                  # Homepage
├── about.html
├── services.html
├── [... 22 HTML pages ...]
├── css/
│   ├── style-[hash].css       # Minified & hashed
│   ├── responsive-[hash].css
│   └── [... other CSS ...]
├── js/
│   ├── main-[hash].js         # Minified & hashed
│   ├── contact.form-[hash].js
│   └── [... other JS ...]
├── images/
│   ├── logo/
│   ├── team/
│   ├── services/
│   ├── [... all images ...]
├── fonts/
│   ├── flaticon.css
│   └── [... font files ...]
└── sitemap.xml
```

---

## Pre-Deployment Checklist

- [ ] Node.js v16+ installed
- [ ] npm packages installed (`npm install`)
- [ ] Local tests pass (`npm run dev`)
- [ ] Build completes successfully (`npm run build`)
- [ ] Preview works (`npm run preview`)
- [ ] No broken links in dist/
- [ ] All images present in dist/images/
- [ ] SSL certificate ready on server
- [ ] Server permissions configured (755/644)
- [ ] Backup created before deployment
- [ ] .htaccess updated for compression
- [ ] robots.txt and sitemap.xml in dist/

---

## Performance Comparison

### Before Vite Build

```
Total Size: ~820 KB (CSS + JS + HTML)
CSS:        304 KB
JS:         416 KB
HTML:       ~100 KB
Requests:   Multiple (not bundled)
Load Time:  ~4-5 seconds (estimate)
```

### After Vite Build

```
Total Size: ~515 KB (CSS + JS + HTML - 37% reduction)
CSS:        ~180 KB (41% reduction)
JS:         ~240 KB (42% reduction)
HTML:       ~95 KB (5% reduction)
Requests:   Fewer (optimized bundling)
Load Time:  ~2-3 seconds (estimate)
```

---

## Maintenance

### Regular Tasks

#### Weekly

- Run local `npm run dev` tests
- Verify no build errors
- Check for new dependencies

#### Monthly

- Update npm packages:
  ```bash
  npm update
  npm audit
  ```
- Rebuild and test
- Deploy if updates important

#### Quarterly

- Major version updates:
  ```bash
  npm outdated
  npm install vite@latest
  ```

---

## Deployment Quick Reference

```bash
# 1. Build production version
npm run build

# 2. Test locally
npm run preview

# 3. If preview looks good, upload dist/ to server
#    Via FTP/SFTP or SCP

# 4. Set permissions on server
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;

# 5. Verify on live site
https://www.enstructura.in

# 6. Check all pages load
# 7. Test forms and links
# 8. Verify on mobile
```

---

## Additional Resources

- **Vite Documentation:** https://vitejs.dev/
- **Vite Config Reference:** https://vitejs.dev/config/
- **Node.js Downloads:** https://nodejs.org/
- **npm Documentation:** https://docs.npmjs.com/

---

## Support

If you encounter issues:

1. Check this troubleshooting section
2. Review vite.config.js for configuration
3. Check node/npm versions
4. Verify all files exist in root directory
5. Run `npm run build:analyze` for details

---

**Last Updated:** January 5, 2026
**Status:** Production Ready
