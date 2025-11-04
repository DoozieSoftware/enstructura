# Copy rewrite — batch 6 (Accreditations, Green Building, 404)

This file contains before/after copy diffs for client review. Only textual copy is suggested; I will not change markup or classes when applying edits. After you approve, reply with "apply batch 6" and I'll perform exact-context replacements in the three HTML files and produce a short changelog.

---

## Accreditations_and_Professional_registrations.html

### BEFORE (selected copy)

- Left sidebar title: "ISO/IEC & NABL Accreditated"
- Tab heading: "Accreditations" and buttons: "Certificate of Incorporation", "Certificate of Accreditation", "Empanelment Certificate"
- Tab heading: "Registrations" and buttons: "GST Registration", "UDYAM Registration Certificate", "Chartered Engineer Registraion", "Structural Engineering ECI", "Structural Engineering Bruhat"
- Company Profile section title: "Company Profile" with a "View Profile" button
- Right preview title: "Certificate Preview"
- Preview placeholder: "Click any certificate to preview here"

### AFTER (proposed rewrite)

- Left sidebar title (replace):
  "Accreditations & Registrations"

- Tab heading: keep tabs labelled "Accreditations" and "Registrations" but update button copy to be concise and consistent (case and spelling):
  - "Certificate of Incorporation" (unchanged)
  - "Certificate of Accreditation" (fix spelling if needed)
  - "Empanelment Certificate"
  - "GST Registration"
  - "Udyam Registration"
  - "Chartered Engineer Registration"
  - "Structural Engineering — ECI"
  - "Structural Engineering — Bruhat"

- Company Profile section (replace):
  Title: "Company Profile"
  Button: "Download company profile" (more explicit than "View Profile")

- Right preview area (replace placeholder copy):
  "Certificate preview — click any item to open here. PDF and image previews available." 

Notes / rationale:
- Small editorial fixes (spelling: "Accreditated" → "Accreditations"; "Registraion" → "Registration").
- Use consistent title case and active verbs on CTAs (Download / View / Preview). These improve clarity when the page is used in proposals.

---

## green-building.html

### BEFORE (selected copy)

- Breadcrumb & page title: "Green Building"
- Main paragraph: placeholder Lorem Ipsum
- Section "What is included" with accordion items: "Project Scheduling", "Project Management", "Project Inspections" containing lorem ipsum paragraphs
- CTA area: "CONSTRUCTION PROJECTS" with lorem ipsum and an image

### AFTER (proposed rewrite)

- Page title (keep): "Green Building"

- Lead paragraph (replace Lorem Ipsum):
  "Sustainable design that balances performance, cost and comfort. Our green-building services blend energy-efficient design, material optimisation and code-compliant strategies so your project reduces operating costs and meets environmental standards."

- Intro bullets (short, benefit-led) to add under the lead or above accordion:
  - Energy modelling and passive design strategies to lower heating, cooling and lighting loads
  - Material selection and embodied-carbon guidance to reduce lifecycle impact
  - Water-efficient systems and rainwater harvesting design
  - Green rating support and documentation for local sustainability certifications

- Accordion items (rewrite copy examples):
  - Project Scheduling: "We integrate green milestones into construction sequencing to preserve sustainability features and avoid rework."
  - Project Management: "Delivery with sustainability in mind — our PM team coordinates contractors, MEP and sustainability specialists to ensure design intent is built correctly." 
  - Project Inspections: "On-site checks for thermal continuity, airtightness, waterproofing and MEP commissioning to secure expected performance on handover." 

- Construction Projects section (replace generic text):
  Replace with short case-note or value statement: "We apply green-building measures across residential, institutional and commercial projects — from efficient envelopes to water-smart plumbing — delivering measurable savings and compliance support."

Notes:
- Suggest adding meaningful image alt text for each slide in the carousel (e.g., "Passive solar facade — mixed-use building").

---

## error-404.html

### BEFORE (selected copy)

- Big headline: "404"
- Paragraph: "Page was not Found"
- Button/link: "Go to Home Page" linking to `index-2.html`

### AFTER (proposed rewrite)

- Headline (replace):
  "404 — Page not found"

- Lead message (replace):
  "We can’t find the page you’re looking for. It may have moved or the link might be broken."

- Helpful CTAs (replace existing single link):
  - Primary button: "Go to home" (link to `index.html` or your chosen canonical homepage — I recommend `index.html`)
  - Secondary link: "Contact us" (link to `contact.html`) with copy: "Tell us what went wrong" (helps capture missing pages or bad links)
  - Optional: small sitemap sentence: "Or try searching the site or visiting our Services page." (if you later add an on-site search, this is a natural spot)

Notes / accessibility:
- Make the CTAs keyboard-accessible and visually distinct. Use clearer sentence-case text and avoid the abrupt phrasing "Page was not Found".
- Consider redirecting common legacy URLs to canonical pages with server-side redirects in addition to improving the 404 wording.

---

Next steps

1. Review these proposed rewrites and suggest edits or approve. If approved, reply with "apply batch 6" and I will apply the exact changes to the three HTML files and create a short changelog showing the replacements.
2. If you prefer smaller steps (apply only Accreditations first), tell me which page to apply and I'll do that.

Files read to prepare this batch:
- `Accreditations_and_Professional_registrations.html`
- `green-building.html`
- `error-404.html`

Created by: assistant — batch 6 diffs for client review
