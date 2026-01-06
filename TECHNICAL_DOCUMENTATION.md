# Enstructura Website - Technical Documentation

**Version:** 1.0
**Date:** January 5, 2026
**Maintained by:** Enstructura Consultants (Pvt) Ltd

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Technology Stack](#technology-stack)
3. [File Structure](#file-structure)
4. [Page Architecture](#page-architecture)
5. [Deployment Guide](#deployment-guide)
6. [Maintenance Guide](#maintenance-guide)
7. [SEO Configuration](#seo-configuration)
8. [Performance Optimization](#performance-optimization)
9. [Troubleshooting](#troubleshooting)

---

## 1. Project Overview

### Website Purpose

Professional website for Enstructura Consultants (Pvt) Ltd, a structural engineering and consultancy firm based in Bengaluru, India.

### Core Features

- Multi-page corporate website
- Service portfolio showcase
- Team member profiles (**SACRED COW - DO NOT MODIFY WITHOUT CLIENT APPROVAL**)
- Client testimonials
- Project gallery
- Contact form integration
- Responsive design (mobile, tablet, desktop)
- Compliance pages (Privacy, Terms, Cookies)

### Target Audience

- Construction companies
- Architects
- Developers
- Government agencies
- Industrial clients

---

## 2. Technology Stack

### Frontend

- **HTML5** - Semantic markup
- **CSS3** - Custom styling + frameworks
- **JavaScript** - Interactive features
- **Bootstrap 3.3.7** - Responsive grid system
- **jQuery 3.x** - DOM manipulation and AJAX

### CSS Frameworks & Libraries

| Library        | Version | Purpose                 |
| -------------- | ------- | ----------------------- |
| Bootstrap      | 3.3.7   | Grid system, components |
| Font Awesome   | 4.x     | Icon fonts              |
| Animate.css    | Latest  | CSS animations          |
| Owl Carousel   | 2.x     | Image carousels         |
| Slick Carousel | Latest  | Alternative carousel    |
| Magnific Popup | Latest  | Lightbox functionality  |

### JavaScript Libraries

| Library                      | Purpose                 |
| ---------------------------- | ----------------------- |
| jquery.min.js                | Core JavaScript library |
| bootstrap.min.js             | Bootstrap components    |
| owl.carousel.min.js          | Carousel functionality  |
| slick.min.js                 | Alternative carousel    |
| wow.min.js                   | Scroll animations       |
| jquery.counterup.min.js      | Animated counters       |
| isotope.pkgd.min.js          | Grid layout             |
| jquery.magnific-popup.min.js | Image lightbox          |
| contact.form.js              | Contact form handling   |
| main.js                      | Custom site functions   |

---

## 3. File Structure

```
enstructura/
│
├── index.html                          # Homepage (PRIMARY)
├── about.html                          # Company information
├── team.html                           # Team members (SACRED COW)
├── services.html                       # Services overview
├── services-details.html               # Structural design details
├── gallery.html                        # Project gallery
├── contact.html                        # Contact form
├── clientele.html                      # Client list
├── testimonial.html                    # Client testimonials
├── Accreditations_and_Professional_registrations.html
│
├── [Service Detail Pages]
├── structural_investigation.html
├── ndt-retrofitting.html
├── testing.html
├── technical_training.html
├── project-management.html
├── environmental.html
├── green-building.html
├── architectural-green.html
│
├── [Compliance Pages]
├── privacy-policy.html                 # GDPR/IT Act compliance
├── terms-of-service.html              # Legal terms
├── cookie-policy.html                 # Cookie usage
├── error-404.html                     # 404 error page
│
├── style.css                          # Main custom stylesheet (5,009 lines)
├── sitemap.xml                        # SEO sitemap
├── robots.txt                         # Search engine directives
│
├── css/                               # CSS libraries
│   ├── bootstrap.min.css
│   ├── font-awesome.min.css
│   ├── animate.css
│   ├── responsive.css
│   └── [8 more CSS files]
│
├── js/                                # JavaScript libraries
│   ├── jquery.min.js
│   ├── bootstrap.min.js
│   ├── main.js
│   └── [14 more JS files]
│
├── images/                            # Image assets (197 MB)
│   ├── logo/                          # Company logo (PROTECTED)
│   ├── team/                          # Team photos (SACRED COW)
│   ├── services/                      # Service images (SACRED COW)
│   ├── services-slider/               # Service sliders (SACRED COW)
│   ├── about/                         # About page images
│   ├── home/                          # Homepage images
│   ├── brand/                         # Client logos
│   ├── certificates/                  # Certifications & PDFs
│   ├── registration/                  # Registration docs
│   └── new gallaery/                  # Gallery images
│
├── fonts/                             # Icon fonts
│   └── flaticon.css
│
├── docs/                              # Content documentation
│   ├── content_index_about.md
│   ├── content__services_batch1.md
│   └── [4 more content files]
│
└── PHPMailer/                         # Email functionality (if used)
```

---

## 4. Page Architecture

### Common Components

#### Header Structure

Every page includes:

1. **Toolbar** - Contact info, social links
2. **Logo + Tagline** - Brand identity
3. **Navigation Menu** - Dropdown menus for services/about
4. **Sticky Header** - Fixed on scroll

#### Footer Structure

Every page includes:

1. **Company Info** - Logo, description, company profile download
2. **Quick Links** - Navigation shortcuts
3. **Contact Info** - Phone, email, address
4. **Legal Links** - Privacy, Terms, Cookies
5. **Copyright** - © 2026 + Dooziesoft attribution

### Page-Specific Features

#### index.html (Homepage)

- Hero slider with project showcase
- About section with stats
- Services grid (8 services)
- Why Choose Us section
- Client testimonials
- Project gallery preview
- Call-to-action sections

#### services.html

- Service grid layout
- Icon-based service cards
- Links to detailed service pages

#### team.html ⚠️ **SACRED COW**

- Team member profiles
- Photos, names, designations
- Professional backgrounds
- **DO NOT modify without client approval**

#### gallery.html

- Filterable project gallery
- Isotope grid layout
- Lightbox image viewer
- Project categories

#### contact.html

- Contact form (name, email, phone, message)
- Google Maps embed
- Office address
- Contact information

---

## 5. Deployment Guide

### Pre-Deployment Checklist

#### Phase 1: File Cleanup

- [ ] Remove duplicate HTML files:

  - index-v1.html, index-v2.html, index1.html
  - team-v1.html, team-x.html, team1.html, team123.html
  - services-details1.html
  - test-performance.html (empty)

- [ ] Archive unused images (127 files, ~127 MB)
  - Create `_archive/images/` folder
  - Move unused images from audit list

#### Phase 2: Configuration

- [ ] Update domain in sitemap.xml (currently www.enstructura.in)
- [ ] Create robots.txt file
- [ ] Verify all internal links
- [ ] Update year in copyright (currently 2026)
- [ ] Add real social media links (currently placeholder #)

#### Phase 3: Testing

- [ ] Test contact form submission
- [ ] Test all navigation links
- [ ] Verify responsive design on mobile/tablet
- [ ] Check image loading
- [ ] Test 404 page
- [ ] Validate HTML (W3C Validator)
- [ ] Test cross-browser compatibility

#### Phase 4: SEO & Performance

- [ ] Submit sitemap to Google Search Console
- [ ] Set up Google Analytics (if not already)
- [ ] Add meta descriptions to all pages
- [ ] Optimize images (convert to WebP if possible)
- [ ] Enable GZIP compression
- [ ] Set up CDN (optional)

### Server Requirements

#### Minimum Requirements

- **Web Server:** Apache 2.4+ or Nginx 1.18+
- **PHP:** 7.4+ (if using contact forms with PHP)
- **SSL Certificate:** Required (HTTPS)
- **Disk Space:** 500 MB minimum
- **Bandwidth:** 10 GB/month recommended

#### Recommended Hosting

- Shared hosting: Sufficient for small-medium traffic
- VPS: Recommended for better performance
- Static hosting: Can use Netlify, Vercel, or GitHub Pages

### Deployment Steps

#### Method 1: FTP/SFTP Upload

```bash
# 1. Connect to server via FTP client (FileZilla, Cyberduck)
# 2. Navigate to public_html or www directory
# 3. Upload all files maintaining folder structure
# 4. Set permissions:
#    - Folders: 755
#    - Files: 644
#    - PHP files (if any): 644
```

#### Method 2: Git Deployment

```bash
# 1. Initialize git repository
git init

# 2. Add remote
git remote add origin <your-repo-url>

# 3. Commit and push
git add .
git commit -m "Initial deployment"
git push origin main

# 4. Connect to server and pull
ssh user@server
cd /var/www/html
git pull origin main
```

#### Method 3: cPanel File Manager

1. Login to cPanel
2. Navigate to File Manager
3. Go to public_html directory
4. Upload ZIP file of website
5. Extract ZIP file
6. Verify file structure

### Post-Deployment Tasks

1. **Test Live Site**

   - Check all pages load correctly
   - Test forms
   - Verify images display
   - Check mobile responsiveness

2. **Set Up Redirects** (if migrating from old site)

   ```apache
   # In .htaccess
   Redirect 301 /old-page.html /new-page.html
   ```

3. **Enable HTTPS**

   - Install SSL certificate (Let's Encrypt recommended)
   - Force HTTPS redirect:

   ```apache
   # In .htaccess
   RewriteEngine On
   RewriteCond %{HTTPS} off
   RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
   ```

4. **Set Up Google Search Console**

   - Verify ownership
   - Submit sitemap.xml
   - Monitor indexing status

5. **Enable Caching**
   ```apache
   # In .htaccess
   <IfModule mod_expires.c>
   ExpiresActive On
   ExpiresByType image/jpg "access plus 1 year"
   ExpiresByType image/jpeg "access plus 1 year"
   ExpiresByType image/png "access plus 1 year"
   ExpiresByType text/css "access plus 1 month"
   ExpiresByType application/javascript "access plus 1 month"
   </IfModule>
   ```

---

## 6. Maintenance Guide

### Regular Maintenance Tasks

#### Weekly

- [ ] Check contact form submissions
- [ ] Monitor website uptime
- [ ] Review Google Analytics traffic
- [ ] Check for broken links

#### Monthly

- [ ] Update content if needed
- [ ] Review and respond to inquiries
- [ ] Backup website files and database
- [ ] Check SSL certificate validity
- [ ] Review site speed performance

#### Quarterly

- [ ] Update copyright year (if applicable)
- [ ] Review and update team photos/bios
- [ ] Add new projects to gallery
- [ ] Update client testimonials
- [ ] Review compliance pages for legal updates

#### Annually

- [ ] Renew domain registration
- [ ] Renew SSL certificate (if not auto-renew)
- [ ] Review and update all page content
- [ ] Major security audit
- [ ] Update third-party libraries

### Content Update Procedures

#### Updating Team Members ⚠️ **SACRED COW**

**CRITICAL:** Always get client approval before modifying team.html

1. Backup current team.html
2. Prepare new images (same dimensions as existing)
3. Update HTML with new member info
4. Test on staging first
5. Get client sign-off
6. Deploy to production

#### Adding New Services

1. Create new service detail page (copy services-details.html as template)
2. Update services.html to add new service card
3. Update navigation menu in all pages
4. Add to sitemap.xml
5. Create supporting images
6. Update documentation

#### Updating Gallery

1. Optimize images (max 1920x1080px, under 500KB each)
2. Add images to `images/new gallaery/` folder
3. Update gallery.html with new image references
4. Test isotope filtering
5. Verify lightbox functionality

### Backup Strategy

#### What to Backup

- All HTML files
- style.css and custom CSS
- JavaScript files (main.js, contact.form.js)
- images/ folder (especially team and services)
- docs/ folder
- Database (if any)
- Configuration files (.htaccess, robots.txt)

#### Backup Schedule

- **Daily:** Automated server backups
- **Weekly:** Manual backup to local storage
- **Monthly:** Full backup to cloud storage
- **Before changes:** Always backup before major updates

#### Backup Tools

- cPanel Backup (if available)
- FTP download entire site
- Git repository (version control)
- Cloud storage (Google Drive, Dropbox)

---

## 7. SEO Configuration

### Current SEO Setup

#### Meta Tags

All pages include:

- Title tag (unique per page)
- Meta description (needs expansion on some pages)
- Viewport meta tag (responsive)
- Character encoding (UTF-8)

#### Sitemap

- **File:** sitemap.xml
- **Pages:** 22 active pages
- **Location:** Root directory
- **Format:** XML (standard)

#### URL Structure

- Clean, descriptive URLs
- Lowercase filenames
- Hyphens for word separation
- .html extension

### SEO Recommendations

#### Priority Actions

1. **Add Meta Descriptions** - Each page needs unique 150-160 character description
2. **Optimize Images** - Add alt tags to all images
3. **Schema Markup** - Add JSON-LD for:
   - Organization
   - LocalBusiness
   - Service
   - BreadcrumbList

#### robots.txt Configuration

```
User-agent: *
Allow: /

Sitemap: https://www.enstructura.in/sitemap.xml

# Disallow crawling of duplicate/old versions
Disallow: /index-v1.html
Disallow: /index-v2.html
Disallow: /index1.html
Disallow: /team-v1.html
Disallow: /team-x.html
Disallow: /team1.html
Disallow: /team123.html
```

#### Google Analytics Integration

Add to all pages before closing `</head>`:

```html
<!-- Google Analytics -->
<script
  async
  src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"
></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag() {
    dataLayer.push(arguments);
  }
  gtag("js", new Date());
  gtag("config", "GA_MEASUREMENT_ID");
</script>
```

---

## 8. Performance Optimization

### Current Performance

**Page Load Stats (estimated):**

- Homepage: ~3-4 seconds
- Service pages: ~2-3 seconds
- Gallery: ~4-5 seconds (image-heavy)

**Total Size:**

- Website: 449 MB
- Images: 197 MB (44% of total)
- CSS: 304 KB
- JS: 416 KB

### Optimization Recommendations

#### Image Optimization (HIGH PRIORITY)

1. **Convert to WebP format** - 30-40% size reduction
2. **Implement lazy loading** - Load images as user scrolls
3. **Use responsive images** - Different sizes for mobile/desktop
4. **Compress existing images** - Use TinyPNG, ImageOptim
5. **Remove unused images** - Save 127 MB

#### CSS Optimization

1. **Minify style.css** - Reduce from 5,009 lines
2. **Remove unused CSS** - Use PurgeCSS tool
3. **Combine CSS files** - Reduce HTTP requests
4. **Use CSS sprites** - For small icons

#### JavaScript Optimization

1. **Load scripts asynchronously** - Add async/defer attributes
2. **Minify custom JS** - main.js, contact.form.js
3. **Remove unused libraries** - Audit jquery plugins
4. **Move scripts to footer** - Improve render time

#### Server Optimization

1. **Enable GZIP compression**
2. **Set up browser caching**
3. **Use CDN for libraries** - jQuery, Bootstrap
4. **Enable keep-alive**
5. **Optimize database queries** (if applicable)

### Performance Monitoring Tools

- Google PageSpeed Insights
- GTmetrix
- WebPageTest
- Lighthouse (Chrome DevTools)

---

## 9. Troubleshooting

### Common Issues

#### Issue 1: Contact Form Not Sending

**Symptoms:** Form submits but email not received

**Solutions:**

1. Check contact.form.js configuration
2. Verify PHP mail() function is enabled on server
3. Check spam folder
4. Verify SMTP settings
5. Test with PHPMailer if available

#### Issue 2: Images Not Loading

**Symptoms:** Broken image icons, 404 errors

**Solutions:**

1. Check file paths are correct (case-sensitive on Linux)
2. Verify images exist in specified folders
3. Check file permissions (644 for files, 755 for folders)
4. Clear browser cache
5. Check .htaccess for rewrite rules

#### Issue 3: Menu Not Working on Mobile

**Symptoms:** Mobile menu doesn't toggle

**Solutions:**

1. Verify bootstrap.min.js is loaded
2. Check rsmenu-main.js is loaded
3. Test jQuery is loaded before other scripts
4. Check for JavaScript errors in console
5. Verify viewport meta tag is present

#### Issue 4: Carousel/Slider Not Working

**Symptoms:** Images don't slide, navigation broken

**Solutions:**

1. Check owl.carousel.min.js is loaded
2. Verify images have correct paths
3. Check jQuery version compatibility
4. Review main.js carousel initialization
5. Check for JavaScript errors

#### Issue 5: Slow Page Load

**Symptoms:** Pages take 5+ seconds to load

**Solutions:**

1. Optimize images (compress, WebP format)
2. Enable caching on server
3. Use CDN for libraries
4. Minify CSS and JavaScript
5. Remove unused assets
6. Enable GZIP compression

### Debug Mode

#### Enable Error Reporting (Development Only)

Add to top of PHP files (if any):

```php
<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
```

#### Browser Console

Check for errors:

1. Open Developer Tools (F12)
2. Navigate to Console tab
3. Look for red error messages
4. Check Network tab for failed requests

---

## Contact & Support

### Technical Support

**Developer:** Dooziesoft
**Website:** https://dooziesoft.com/
**Email:** support@dooziesoft.com (if available)

### Client Contact

**Company:** Enstructura Consultants (Pvt) Ltd
**Email:** info@enstructura.in
**Phone:** +91 9663329229
**Address:** # 2054, 2nd Main, BCCHS Layout, Raghuvanahalli, off. Kanakapura Road, Bengaluru - 560 062

---

## Document History

| Version | Date        | Changes               | Author          |
| ------- | ----------- | --------------------- | --------------- |
| 1.0     | Jan 5, 2026 | Initial documentation | Deployment Team |

---

**End of Technical Documentation**
