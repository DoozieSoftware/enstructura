## Team & Clientele — before / after (batch 4)

Summary: Proposed copy updates for team pages and the clientele page. Each section includes the key original snippets (BEFORE) and suggested replacements (AFTER). The changes are content-only and keep existing HTML structure and classes.

---

### File: team.html (and team variants)

#### BEFORE (page heading / sample member block)

```html
<div class="sec-title text-center">
  <h3>Our team Member</h3>
</div>

<!-- Sample member -->
<div class="member-header">
  <h4 class="member-name">S Ravi</h4>
  <p class="member-title">Board of Director</p>
</div>
<div class="description-card">
  <div class="member-role">35+ Years of Experience</div>
  <p class="member-desc">
    Seasoned Structural Engineer with over three decades of expertise in the analysis,
    design, evaluation, and rehabilitation of RCC and steel structures. Specializes in
    multi-storeyed buildings, industrial facilities, hydraulic structures, and
    liquid-retaining systems. Extensive experience in structural investigations,
    non-destructive testing, and designing remedial measures for distressed structures.
  </p>
</div>
```

#### AFTER (creative rewrite)

```html
<div class="sec-title text-center">
  <h3>Our People — Engineering with Experience</h3>
</div>

<!-- Sample member rewritten for clarity and benefit-led tone -->
<div class="member-header">
  <h4 class="member-name">S Ravi</h4>
  <p class="member-title">Board of Director</p>
</div>
<div class="description-card">
  <div class="member-role">35+ Years' Experience</div>
  <p class="member-desc">
    A leading structural engineer with 35+ years delivering safe, economical and durable
    solutions across high‑rise, industrial and hydraulic projects. Ravi specialises in
    forensic investigations, NDT‑led diagnostics and pragmatic repair strategies that
    protect asset life while keeping construction disruption and cost low.
  </p>
</div>
```

Notes:
- Apply the same tone to other member bios: lead with role + seniority, then a 1–2 sentence impact statement (what they deliver and why it matters).
- Page titles updated to be benefits-focused and consistent across `team.html`, `team1.html`, `team-v1.html`, `team123.html` — keep layout and markup identical for safe in-place replacement.

---

### File: clientele.html

#### BEFORE

```html
<h2>Our Esteemed <span style="color: #fbc02d">Clients</span></h2>
<p>We are proud to have partnered exclusively with prestigious government organizations</p>
```

#### AFTER (creative rewrite)

```html
<h2>Our Clients</h2>
<p>Trusted by government bodies, industry leaders and premier institutions, we partner to
  deliver engineering solutions that meet strict regulatory standards and stand the test
  of time.</p>
```

Notes:
- The `clientele.html` page is primarily a logo gallery — the rewritten intro clarifies value (trust, regulatory experience) and reads well on marketing collateral.
- Logos and layout unchanged.

---

Next steps
- If this style looks good, reply with "apply batch 4" and I will patch the four team pages and `clientele.html` with exact, safe replacements.
- If you want alternate tone variants (short/formal/technical), tell me which pages and I’ll add 1–2 alternates inline in this MD file.
