# Worksheet Creation Guidelines

This document defines how to create and maintain **Preparation Worksheets** for TBox (Technology Box Inc.) computer projects. It is based on the existing 3rd-grade (*Eat Healthily!*) and 5th-grade (*Touristic Destinations*) worksheets.

---

## 1. Purpose and role of the worksheet

- **When it is used:** The worksheet is given to students **before** they start the corresponding TBox project on the computer.
- **How it is done:** Students work **offline** with **pen and paper** (and color pencils if desired). No computer or internet is needed.
- **Duration:** About **25 minutes** in total. Each part has a suggested time (roughly 3–6 minutes) so students can pace themselves.
- **Autonomy:** The text must allow students to complete the worksheet **on their own**; no teacher guidance is required during the activity.
- **Outcome:** After finishing, students have a clear idea of the project goal, main concepts, and a short “ready for the computer” checklist.

---

## 2. File and folder structure

### 2.1 Location and naming

- Use one folder per grade: `3-grade/`, `5-grade/`, etc.
- Worksheet files use the pattern: **`[Project-Name]-Preparation-Worksheet`**
  - Project names use **Title Case** and **hyphens** (e.g. `Eat-Healthily`, `Touristic-Destinations`).
- Provide **two files** per worksheet:
  - **`.html`** — for opening in a browser and printing (File → Print or Ctrl+P). This is what students receive on paper.
  - **`.md`** — source text that can be pasted into Word or Google Docs for wording/layout changes, then printed.

**Examples:**

- `3-grade/Eat-Healthily-Preparation-Worksheet.html`
- `3-grade/Eat-Healthily-Preparation-Worksheet.md`
- `5-grade/Touristic-Destinations-Preparation-Worksheet.html`
- `5-grade/Touristic-Destinations-Preparation-Worksheet.md`

### 2.2 Teacher-facing description

- Add or update a **README** (e.g. `README-Worksheet.md` in the Guides root or next to the worksheet) that states:
  - **Use:** When to give the worksheet (before the project).
  - **Format:** Offline, pen and paper.
  - **Time:** About 25 minutes.
  - **Guidance:** Self-guided; no teacher help needed during the activity.
  - **Files:** What the `.html` and `.md` are for.
  - **What the worksheet prepares:** A short list of concepts and skills (project goal, main ideas, checklist purpose).

---

## 3. Content structure (all worksheets)

Every preparation worksheet must follow this **overall flow**:

| Section | Content | Notes |
|--------|--------|--------|
| **Title** | “Get Ready for: [Project Name]” | Same phrasing as in the TBox project. |
| **Subtitle** | Grade X · Preparation worksheet · About 25 minutes | Plus one line: *Work with pen and paper. Use color pencils if you like. You do not need a computer or the internet.* |
| **Student info** | Name, Grade/Section, Date | Each with a line to write on. |
| **How to use** | 3 bullets (see below) | In a highlighted “intro” box. |
| **Part 1** | Your mission | ~3 min. States what they will do in the project. |
| **Parts 2–5** | Core concepts + tasks | ~4–6 min each. Mix of explanation and “Do this” tasks. |
| **Part 6** | Before you sit at the computer | ~2 min. Checklist; when all are checked, they are ready. |
| **Footer** | Project name, TBox, central topic, technology area | One short line. |

### 3.1 “How to use this worksheet” (fixed text)

Use this text in the intro box (only wording changes if you localise):

- Do the parts **in order** from top to bottom.
- Each part has a **time** so you know how long to spend.
- Read every instruction before you write. You can do this on your own.

### 3.2 Part 1 – Your mission

- **Time:** about 3 minutes.
- **Content:** One short paragraph under “**What you will do in the project:**” that explains the project goal and main tools/ideas (e.g. spreadsheet and charts, or email and graphic materials).
- **Tasks:** 1–2 simple “Do this” items that tie to that mission (e.g. choose a city, name 3 healthy foods).

### 3.3 Parts 2–5 – Concepts and tasks

- **Time:** about 4–6 minutes per part.
- **Content:** Each part introduces one main concept (e.g. “Parts of an email”, “Data: what can we collect?”, “Spam: what it is and how to stay safe”).
- **Structure per part:**
  - Short explanation in plain language.
  - **“Do this:”** followed by numbered tasks.
- **Task types to use:** fill-in lines, tables (e.g. word banks, matching), sketch boxes for drawing, circling/choosing from options, short sentences. Vary task types across the worksheet.

### 3.4 Part 6 – Before you sit at the computer

- **Time:** about 2 minutes.
- **Content:** A **checklist** of 4–5 statements. Students put a ✓ when the statement is true for them.
- **Statements** should reflect: understanding of the project, main concepts from the worksheet, and one concrete outcome (e.g. “I chose my city”, “I have an idea for my poster”).
- End with: *When all boxes are checked, you are ready to start the project on the computer.*

### 3.5 Footer (fixed pattern)

Use this pattern and adapt the bracketed parts:

*Preparation worksheet for the project “[Project Name]” (Technology Box Inc. / TBox). Central topic: [e.g. Healthy life / Citizens of the world]. Main technology area: [e.g. Spreadsheets / Email].*

---

## 4. HTML layout and styling

### 4.1 General

- **Doctype:** `<!DOCTYPE html>`, `lang="en"` (or appropriate language).
- **Viewport:** `<meta name="viewport" content="width=device-width, initial-scale=1.0">`.
- **Single-column, print-friendly:** `max-width: 700px`, centered, white background. No layout that depends on screen size for understanding.

### 4.2 Typography and colours

- **Font:** `'Segoe UI', Tahoma, Geneva, Verdana, sans-serif`.
- **Body:** `color: #1a1a1a`, `line-height: 1.5`.
- **Theme colour:** Choose **one** main colour per project for headings and accents (e.g. green `#2d7a4a` for “Eat Healthily”, blue `#0d5a7c` for “Touristic Destinations”). Use it for:
  - `h1` (font size ~1.5rem, border-bottom 3px solid)
  - `h2` (font size ~1.1rem)
  - `.intro-box` border and background (use a light tint of the same colour, e.g. `#e8f5e9` for green, `#e8f4f8` for blue)
  - Table header background

### 4.3 Required CSS classes and elements

| Class / element | Use |
|-----------------|-----|
| `.subtitle` | Grade, “Preparation worksheet”, “About 25 minutes”, plus the pen-and-paper line. |
| `.student-info` | Grid for Name, Grade/Section, Date with label + fill line. |
| `.intro-box` | “How to use this worksheet” and the 3 bullets. |
| `.time` | In each `h2`: “(about X minutes)”. |
| `.fill-line` | Underline-only fill-in (e.g. `<span class="fill-line"></span>`). |
| `table` | Word banks, matching, or simple data. Headers use the theme background. |
| `.sketch-box` | Empty box for drawings (min-height e.g. 120px, light grey background, border). |
| `.checklist` | Unordered list for Part 6; use `list-style: none` and “□” (or similar) per item. |
| `.footer` | One line at the bottom (project, TBox, topic, technology area). |

### 4.4 Print behaviour

- **@media print:** Reduce body padding (e.g. `0.5rem`), avoid breaking inside headings, intro box, tables, sketch boxes, and checklists.
- Use `page-break-inside: avoid` and `break-inside: avoid` so that **boxes do not split between pages**. Apply them to:
  - The intro box
  - Each logical “part” (if you wrap parts in a div, give it a class like `.part`)
  - Sketch boxes
  - The checklist block
- For **tables**, keep the header and the body together: use `page-break-inside: avoid` and `break-inside: avoid` on the whole table so the header row(s) and table body do not end up on different pages. Use a proper `<thead>` (and `<tbody>`) in the HTML so the structure is clear.
- **Do not leave the last paragraph alone on the last page.** Avoid a page break that would strand the footer (or the closing line of the worksheet) by itself on a new page. For example, use `page-break-before: avoid` on the footer, or wrap the footer with the checklist (or the last part) so they stay together.
- For coloured areas (e.g. intro box, table headers), use `-webkit-print-color-adjust: exact; print-color-adjust: exact` so they print as intended.

### 4.5 Optional: part wrappers

- For cleaner print control, wrap each “Part 1”…“Part 6” block in a `<div class="part">`. Then apply `page-break-inside: avoid` to `.part`. This keeps each part on one page when possible.

---

## 5. Markdown version (.md)

- The `.md` file must contain the **same content** as the HTML (all text, same order of parts and tasks).
- Use **horizontal rules** (`---`) between the main sections (after subtitle block, after “How to use”, and between Part 1–6).
- Use **markdown tables** where the HTML has tables.
- For checklists, use markdown list syntax, e.g. `- [ ] I know…`.
- For “fill” lines, use `_____` or `_________________________` as placeholders; the HTML will replace these with proper `.fill-line` elements.
- For sketch areas, use a fenced block or a simple ASCII box with a short note like “(Draw here)” or “(Your sketch)”.

The `.md` is the **source of truth** for wording; the HTML is the **print-ready** version. When you change content, update both.

---

## 6. Time allocation (total ~25 minutes)

Keep to this approximate distribution:

| Part | Suggested time |
|------|-----------------|
| Part 1 – Your mission | about 3 min |
| Part 2 | about 4–6 min |
| Part 3 | about 4–6 min |
| Part 4 | about 4–6 min |
| Part 5 | about 4–6 min |
| Part 6 – Checklist | about 2 min |
| **Total** | **~25 min** |

If one part is concept-heavy or has more tasks, give it up to 6 minutes and shorten another.

---

## 7. Wording and accessibility

- Use short sentences and everyday words.
- One idea per sentence where possible.
- **Bold** for important terms the first time they appear (e.g. **spreadsheet**, **spam**, **Subject**).
- Use *italics* for examples or optional cues (“e.g. …”, “like …”).
- Instructions start with a verb: “Write…”, “Circle…”, “Fill in…”, “Draw…”, “List…”.
- “Do this:” is followed by a numbered list of tasks.
- Avoid jargon; if a technical word is needed, briefly explain it in brackets or in the next sentence (e.g. “**spreadsheet** (like Excel)”).

---

## 8. Checklist before publishing

- [ ] Folder name matches grade (`X-grade/`).
- [ ] File names: `[Project-Name]-Preparation-Worksheet.html` and `.md`.
- [ ] Title is “Get Ready for: [Project Name]”.
- [ ] Subtitle includes grade, “Preparation worksheet”, “About 25 minutes”, and the pen-and-paper line.
- [ ] Student info block: Name, Grade/Section, Date.
- [ ] “How to use this worksheet” uses the standard 3 bullets.
- [ ] Part 1 = “Your mission” (~3 min); Part 6 = “Before you sit at the computer” (~2 min).
- [ ] Each part has “(about X minutes)” in the heading.
- [ ] Total time of parts ≈ 25 minutes.
- [ ] Part 6 ends with “When all boxes are checked, you are ready to start the project on the computer.”
- [ ] Footer includes project name, TBox, central topic, and main technology area.
- [ ] HTML uses the shared classes and one project theme colour; print CSS avoids bad page breaks (boxes, table header/body, and checklist do not split; footer is not alone on the last page).
- [ ] `.md` matches HTML content and uses tables/lists/placeholders where needed.
- [ ] README or teacher notes describe use, format, time, and what the worksheet prepares.

---

## 9. Summary of differences by grade (for reference)

- **Structure** is the same (Parts 1–6, mission → concepts → checklist).
- **Theme colour** and project name change per project.
- **Concepts** depend on the TBox project (e.g. 3rd: data, tables, calculations, charts; 5th: email parts, spam, graphic materials).
- **Task types** are shared (fill-in, tables, sketch box, checklist, circle/choose); only the content and difficulty adapt to the grade.
- **Part wrappers** (`.part`) and extra print rules are optional but recommended for consistency and better printing.

Using these guidelines keeps preparation worksheets consistent in structure, look, and use across grades and projects.
