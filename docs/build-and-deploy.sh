#!/bin/bash

# Enstructura Website - Vite Build & Deploy Script
# Version: 1.0
# Date: January 5, 2026
# Purpose: Automate building and preparing for deployment

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${GREEN}"
echo "=============================================="
echo "  Enstructura Website Build & Deploy"
echo "  Version 1.0"
echo "=============================================="
echo -e "${NC}\n"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Step 1: Check Node.js and npm
echo -e "${BLUE}Step 1: Checking Node.js and npm...${NC}"
if ! command_exists node; then
    echo -e "${RED}✗ Node.js not found. Please install from https://nodejs.org/${NC}"
    exit 1
fi

if ! command_exists npm; then
    echo -e "${RED}✗ npm not found. Please install Node.js${NC}"
    exit 1
fi

NODE_VERSION=$(node --version)
NPM_VERSION=$(npm --version)
echo -e "${GREEN}✓ Node.js ${NODE_VERSION}${NC}"
echo -e "${GREEN}✓ npm ${NPM_VERSION}${NC}\n"

# Step 2: Install dependencies
echo -e "${BLUE}Step 2: Installing dependencies...${NC}"
cd "$SCRIPT_DIR"

if [ ! -d "node_modules" ]; then
    echo "Installing npm packages (first time)..."
    npm install
    echo -e "${GREEN}✓ Dependencies installed${NC}\n"
else
    echo -e "${GREEN}✓ node_modules already exists${NC}\n"
fi

# Step 3: Clean previous build
echo -e "${BLUE}Step 3: Cleaning previous build...${NC}"
if [ -d "dist" ]; then
    rm -rf dist
    echo -e "${GREEN}✓ Old dist/ folder removed${NC}\n"
else
    echo -e "${GREEN}✓ No previous build found${NC}\n"
fi

# Step 4: Run build
echo -e "${BLUE}Step 4: Building production version...${NC}"
npm run build

if [ ! -d "dist" ]; then
    echo -e "${RED}✗ Build failed! dist/ folder not created${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Build completed successfully${NC}\n"

# Step 5: Calculate sizes
echo -e "${BLUE}Step 5: Calculating file sizes...${NC}"

DIST_SIZE=$(du -sh dist | cut -f1)
CSS_SIZE=$(find dist/css -name "*.css" 2>/dev/null | xargs du -ch 2>/dev/null | tail -1 | cut -f1 || echo "0 B")
JS_SIZE=$(find dist/js -name "*.js" 2>/dev/null | xargs du -ch 2>/dev/null | tail -1 | cut -f1 || echo "0 B")
HTML_SIZE=$(find dist -maxdepth 1 -name "*.html" 2>/dev/null | xargs du -ch 2>/dev/null | tail -1 | cut -f1 || echo "0 B")

echo -e "${GREEN}Build Summary:${NC}"
echo "  Total dist/ size: $DIST_SIZE"
echo "  HTML files: $HTML_SIZE"
echo "  CSS files: $CSS_SIZE"
echo "  JavaScript files: $JS_SIZE"
echo ""

# Step 6: List output files
echo -e "${BLUE}Step 6: Generated files...${NC}"
FILE_COUNT=$(find dist -type f | wc -l)
echo -e "${GREEN}✓ Total files: $FILE_COUNT${NC}\n"

# Step 7: Generate deployment info
echo -e "${BLUE}Step 7: Generating deployment information...${NC}"

DEPLOY_INFO="dist/DEPLOYMENT_INFO.txt"
cat > "$DEPLOY_INFO" << EOF
=====================================
Enstructura Website - Build Info
=====================================
Build Date: $(date)
Build Size: $DIST_SIZE
Total Files: $FILE_COUNT

CSS Files: $CSS_SIZE
JS Files: $JS_SIZE
HTML Files: $HTML_SIZE

DEPLOYMENT CHECKLIST:
- [ ] Verify all files present in dist/
- [ ] Test locally: npm run preview
- [ ] Upload dist/* to public_html
- [ ] Set permissions: chmod 755 folders, 644 files
- [ ] Verify on live site
- [ ] Check all pages load
- [ ] Test forms and links
- [ ] Verify on mobile devices

DEPLOYMENT COMMAND (FTP):
Local: /dist/*
Remote: /public_html/

VERIFICATION COMMANDS:
# List all HTML files
find dist -name "*.html" | sort

# List all CSS files
find dist/css -name "*.css"

# List all JS files
find dist/js -name "*.js"

# Total size
du -sh dist

# File count
find dist -type f | wc -l

=====================================
EOF

echo -e "${GREEN}✓ Deployment info saved to: $DEPLOY_INFO${NC}\n"

# Step 8: Preview instructions
echo -e "${BLUE}Step 8: Ready for deployment!${NC}"
echo -e "${GREEN}Next steps:${NC}"
echo "  1. Test locally: ${YELLOW}npm run preview${NC}"
echo "  2. Upload to server: ${YELLOW}Copy dist/* to public_html${NC}"
echo "  3. Set permissions on server"
echo "  4. Verify at: ${YELLOW}https://www.enstructura.in${NC}"
echo ""

# Step 9: Optional preview
read -p "Would you like to preview the build now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Starting preview server at http://localhost:5000${NC}"
    echo "Press Ctrl+C to stop the preview"
    npm run preview
fi

echo -e "\n${GREEN}Build process complete!${NC}\n"
