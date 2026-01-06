#!/bin/bash

# Enstructura Website Cleanup Script
# Version: 1.0
# Date: January 5, 2026
# Purpose: Archive duplicate HTML files and prepare for deployment

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print banner
echo -e "${GREEN}"
echo "=================================================="
echo "  Enstructura Website Cleanup Script"
echo "  Version 1.0 - January 5, 2026"
echo "=================================================="
echo -e "${NC}"

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${YELLOW}Working directory: $SCRIPT_DIR${NC}\n"

# Step 1: Create backup
echo -e "${GREEN}Step 1: Creating backup...${NC}"
BACKUP_DIR="$HOME/enstructura_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "Copying files to: $BACKUP_DIR"
cp -r "$SCRIPT_DIR"/* "$BACKUP_DIR/" 2>/dev/null
echo -e "${GREEN}✓ Backup created successfully${NC}\n"

# Step 2: Create archive folders
echo -e "${GREEN}Step 2: Creating archive folders...${NC}"
mkdir -p "$SCRIPT_DIR/_archive/html_duplicates"
mkdir -p "$SCRIPT_DIR/_archive/images_unused"
echo -e "${GREEN}✓ Archive folders created${NC}\n"

# Step 3: Archive duplicate HTML files
echo -e "${GREEN}Step 3: Archiving duplicate HTML files...${NC}"

DUPLICATE_FILES=(
    "index-v1.html"
    "index-v2.html"
    "index1.html"
    "team-v1.html"
    "team-x.html"
    "team1.html"
    "team123.html"
    "services-details1.html"
    "test-performance.html"
)

MOVED_COUNT=0
MISSING_COUNT=0

for file in "${DUPLICATE_FILES[@]}"; do
    if [ -f "$SCRIPT_DIR/$file" ]; then
        mv "$SCRIPT_DIR/$file" "$SCRIPT_DIR/_archive/html_duplicates/"
        echo "  ✓ Moved: $file"
        ((MOVED_COUNT++))
    else
        echo "  ⚠ Not found: $file (already removed?)"
        ((MISSING_COUNT++))
    fi
done

echo -e "\n${GREEN}Summary: $MOVED_COUNT files moved, $MISSING_COUNT files not found${NC}\n"

# Step 4: Generate file listing
echo -e "${GREEN}Step 4: Generating file listings...${NC}"

echo "Generating active HTML files list..."
ls -1 "$SCRIPT_DIR"/*.html 2>/dev/null > "$SCRIPT_DIR/_archive/active_html_files.txt"
ACTIVE_COUNT=$(wc -l < "$SCRIPT_DIR/_archive/active_html_files.txt")
echo "  ✓ $ACTIVE_COUNT active HTML files"

echo "Generating archived files list..."
ls -1 "$SCRIPT_DIR/_archive/html_duplicates/" 2>/dev/null > "$SCRIPT_DIR/_archive/archived_files.txt"
ARCHIVED_COUNT=$(wc -l < "$SCRIPT_DIR/_archive/archived_files.txt")
echo "  ✓ $ARCHIVED_COUNT archived files"

echo ""

# Step 5: Verify critical files exist
echo -e "${GREEN}Step 5: Verifying critical files...${NC}"

CRITICAL_FILES=(
    "index.html"
    "about.html"
    "services.html"
    "team.html"
    "contact.html"
    "privacy-policy.html"
    "terms-of-service.html"
    "cookie-policy.html"
    "sitemap.xml"
    "robots.txt"
)

ALL_PRESENT=true

for file in "${CRITICAL_FILES[@]}"; do
    if [ -f "$SCRIPT_DIR/$file" ]; then
        echo "  ✓ $file"
    else
        echo -e "  ${RED}✗ MISSING: $file${NC}"
        ALL_PRESENT=false
    fi
done

echo ""

# Step 6: Calculate space savings
echo -e "${GREEN}Step 6: Calculating space savings...${NC}"

if [ -d "$SCRIPT_DIR/_archive/html_duplicates" ]; then
    ARCHIVE_SIZE=$(du -sh "$SCRIPT_DIR/_archive/html_duplicates" | cut -f1)
    echo "  Space saved by archiving HTML duplicates: $ARCHIVE_SIZE"
fi

# Step 7: Generate cleanup report
echo -e "\n${GREEN}Step 7: Generating cleanup report...${NC}"

REPORT_FILE="$SCRIPT_DIR/_archive/cleanup_report_$(date +%Y%m%d_%H%M%S).txt"

cat > "$REPORT_FILE" << EOF
===============================================
Enstructura Website Cleanup Report
===============================================
Date: $(date)
Backup Location: $BACKUP_DIR

FILES PROCESSED:
- HTML files moved to archive: $MOVED_COUNT
- HTML files not found: $MISSING_COUNT
- Active HTML files remaining: $ACTIVE_COUNT

ARCHIVE LOCATION:
$SCRIPT_DIR/_archive/html_duplicates/

ARCHIVED FILES:
$(cat "$SCRIPT_DIR/_archive/archived_files.txt" 2>/dev/null || echo "None")

ACTIVE FILES:
$(cat "$SCRIPT_DIR/_archive/active_html_files.txt" 2>/dev/null || echo "None")

CRITICAL FILES VERIFICATION:
$(for file in "${CRITICAL_FILES[@]}"; do
    if [ -f "$SCRIPT_DIR/$file" ]; then
        echo "✓ $file - Present"
    else
        echo "✗ $file - MISSING"
    fi
done)

NEXT STEPS:
1. Review archived files in _archive/html_duplicates/
2. Update footer links in all active HTML files
3. Test website locally before deployment
4. Follow deployment checklist in DEPLOYMENT_HANDOVER.md
5. Delete _archive folder after 90 days if no issues

BACKUP INFORMATION:
Full backup created at: $BACKUP_DIR
To restore: cp -r $BACKUP_DIR/* $SCRIPT_DIR/

===============================================
EOF

echo -e "${GREEN}✓ Report saved to: $REPORT_FILE${NC}\n"

# Final summary
echo -e "${GREEN}=================================================="
echo "  CLEANUP COMPLETED SUCCESSFULLY!"
echo "==================================================${NC}"
echo ""
echo -e "${YELLOW}Summary:${NC}"
echo "  - Backup created: $BACKUP_DIR"
echo "  - Files archived: $MOVED_COUNT"
echo "  - Active pages: $ACTIVE_COUNT"
echo "  - Report saved: $REPORT_FILE"
echo ""

if [ "$ALL_PRESENT" = true ]; then
    echo -e "${GREEN}✓ All critical files are present${NC}"
else
    echo -e "${RED}⚠ WARNING: Some critical files are missing!${NC}"
    echo -e "${RED}  Please review the report and restore if needed${NC}"
fi

echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "  1. Review archived files in _archive/html_duplicates/"
echo "  2. Update footer compliance links in all active pages"
echo "  3. Test the website locally"
echo "  4. Follow DEPLOYMENT_HANDOVER.md for deployment"
echo ""
echo -e "${GREEN}Done!${NC}"
