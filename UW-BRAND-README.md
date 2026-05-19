# UW–Madison Brand Identity for Quarto PDF

This folder contains a Quarto PDF template that applies the 
[UW–Madison brand identity](https://brand.wisc.edu/).

## Files

### PDF documents (root)

| File | Purpose |
|---|---|
| `_quarto.yml` | Project config — shared PDF engine, brand header, and execute defaults |
| `uw-brand-template.qmd` | Starter Quarto PDF document — copy and rename for each project |
| `uw-brand.tex` | LaTeX preamble — auto-applied to all PDF documents via `_quarto.yml` |
| `R/theme_uw.R` | ggplot2 theme and color scales — source at the top of any script or chunk |

### Slides (`slides/`)

| File | Purpose |
|---|---|
| `slides/_quarto.yml` | Slide sub-project config — isolates slides from root PDF settings |
| `slides/uw-revealjs-template.qmd` | RevealJS template — copy and rename for each talk |
| `slides/_uw-light.scss` | RevealJS light theme (white bg, Badger Red headings) |
| `slides/_uw-dark.scss` | RevealJS dark theme (near-black bg, Badger Red accents) |
| `slides/uw-beamer-template.qmd` | Beamer/PDF slide template — copy and rename for each talk |
| `slides/_uw-beamer-preamble.tex` | Beamer color, font, and layout setup (light/dark toggle) |
| `slides/title.tex` | Beamer title-page partial — activates the UW custom title layout |

## Rendering

```bash
# Render a single PDF document
quarto render my-doc.qmd

# Render a RevealJS presentation
quarto render slides/my-talk.qmd

# Render a Beamer presentation
quarto render slides/my-beamer.qmd

# Render all PDFs (root project)
quarto render

# Render all slides (slides sub-project)
quarto render slides/
```

## Setup

### 1. Install the fonts

All UW fonts are free Google Fonts. Install them as **system fonts** so 
XeLaTeX can find them.

| Font | Role | Download |
|---|---|---|
| Crimson Pro | Body text (main serif) | <https://brand.wisc.edu/resource/crimson-pro-font/> |
| Red Hat Display | Headings / sans-serif | <https://brand.wisc.edu/resource/red-hat-display-font/> |
| Red Hat Text | Small body / UI labels | <https://brand.wisc.edu/resource/red-hat-text-font/> |

**macOS:** Open Font Book → File → Add Fonts  
**Windows:** Right-click the `.ttf`/`.otf` file → Install for all users

After installing, verify XeLaTeX can find them:

```bash
fc-list | grep -i "crimson"
fc-list | grep -i "red hat"
```

### 2. Download brand assets

Create an `assets/` folder next to your `.qmd` file with this structure:

```
assets/
  icons/          ← SVG or PNG icons from brand.wisc.edu
  illustrations/  ← SVG or PNG illustrations from brand.wisc.edu
  graphics/       ← Graphic elements from brand.wisc.edu
  uw-crest.png    ← Optional: crest logo for page header
```

Download links:

- **Icons (print):** <https://brand.wisc.edu/resource/icons-for-print/>
- **Icons (digital):** <https://brand.wisc.edu/resource/icons-for-digital/>
- **Illustrations (print):** <https://brand.wisc.edu/resource/illustrations-for-print/>
- **Illustrations (digital):** <https://brand.wisc.edu/resource/illustrations-for-digital/>
- **Graphic elements (print):** <https://brand.wisc.edu/resource/graphic-elements-for-print/>
- **Graphic elements (digital):** <https://brand.wisc.edu/resource/graphic-elements-for-digital/>
- **UW Crest logo:** <https://brand.wisc.edu/resource/crest-only-logo-for-web-digital-use-full-color/>

### 3. Render

```bash
quarto render your-document.qmd
```

Or use the **Render** button in RStudio.

---

## Switching light ↔ dark

**RevealJS** — swap one line in the YAML:
```yaml
# Light:
theme: [default, _uw-light.scss]
# Dark:
theme: [default, _uw-dark.scss]
```
And in the setup chunk, match the plot theme:
```r
theme_set(theme_uw(base_size = 14))       # light
theme_set(theme_uw_dark(base_size = 14))  # dark
```

**Beamer** — flip one line in `_uw-beamer-preamble.tex`:
```latex
\uwdarkfalse   % light (default)
\uwdarktrue    % dark
```
And match the plot theme in the setup chunk (same as RevealJS above, but use `base_size = 9`).

---

## Quick reference

### Brand colors

| Name | Hex | Use |
|---|---|---|
| Badger Red | `#C5050C` | Primary — headings, accents |
| Dark Red | `#9B0000` | Secondary — subheadings, links |
| Light Gray | `#E1E5E7` | Backgrounds, secondary elements |
| Black | `#121212` | Body text |
| White | `#FFFFFF` | Backgrounds |

### LaTeX macros (defined in `uw-brand.tex`)

```latex
\badgerred{text}          % Badger Red inline text color
\darkred{text}            % Dark Red inline text color

\uwicon{filename}{height}              % Brand icon at given height
\uwillustration{filename}{width}       % Brand illustration at given width
\uwiconinline{filename}                % Icon sized to current line height

\begin{uwbox}[Title]   ... \end{uwbox}      % Red callout box
\begin{uwinfo}[Title]  ... \end{uwinfo}     % Gray info box
\begin{uwaccent}[Title] ... \end{uwaccent}  % Dark red accent box
```

Use these inside ```` ```{=latex} ```` blocks in your `.qmd`:

````markdown
```{=latex}
\begin{uwbox}[Key Takeaway]
Content of the box goes here.
\end{uwbox}
```
````

### ggplot2 theme and scales (`R/theme_uw.R`)

```r
source("R/theme_uw.R")

# Individual color lookup
uw_color("badger_red")           # "#C5050C"
uw_color("dark_red", "yellow")   # named vector

# Discrete scales
scale_color_uw()
scale_fill_uw()

# Continuous (sequential) scales — light gray → Badger Red
scale_color_uw_c()
scale_fill_uw_c()

# Theme — use alone or combine with the scales above
theme_uw()                       # Crimson Pro body, Red Hat Display headings
theme_uw(base_size = 12)
theme_uw(grid = "x")            # "both" | "x" | "y" | "none"
theme_uw(title_color = "black") # override title color
```

---

## Typography guidance (from brand.wisc.edu)

| Font | Recommended use |
|---|---|
| **Red Hat Display** | Headlines, subheadings, large sizes |
| **Red Hat Text** | Body copy at small sizes, labels |
| **Crimson Pro** | Long-form body copy, publications, print — *not for websites* |
