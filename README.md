# uwbranding

UW–Madison brand identity for R and Quarto: ggplot2 themes, color scales, and Quarto document templates.

## Installation

```r
# install.packages("pak")
pak::pak("yourname/uwbranding")
```

## Fonts

All UW brand fonts are free Google Fonts. Install them as system fonts so
XeLaTeX and ggplot2 can find them.

| Font | Role | Download |
|---|---|---|
| Crimson Pro | Body text (PDF) | <https://brand.wisc.edu/resource/crimson-pro-font/> |
| Red Hat Display | Headings | <https://brand.wisc.edu/resource/red-hat-display-font/> |
| Red Hat Text | Labels, slides | <https://brand.wisc.edu/resource/red-hat-text-font/> |

## ggplot2 themes

```r
library(uwbranding)
library(ggplot2)

# Light theme (PDF documents, light slides)
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point() +
  scale_color_uw() +
  theme_uw()

# Dark theme (dark slides, poster panels)
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point() +
  scale_color_uw_dark() +
  theme_uw_dark()               # style = "black" (default) or "red"
```

### Scales at a glance

| Function | Aesthetic | Background |
|---|---|---|
| `scale_color_uw()` / `scale_fill_uw()` | discrete | light |
| `scale_color_uw_c()` / `scale_fill_uw_c()` | continuous | light |
| `scale_color_uw_dark()` / `scale_fill_uw_dark()` | discrete | dark |
| `scale_color_uw_dark_c()` / `scale_fill_uw_dark_c()` | continuous | dark |

### Brand colors

```r
uw_colors                          # full named vector
uw_color("badger_red")             # "#C5050C"
uw_color("badger_red", "yellow")   # named vector of two
```

## Quarto templates

Copy template files into any project directory:

```r
use_uw_pdf()        # uw-brand.tex + _quarto.yml + template.qmd
use_uw_revealjs()   # _uw-light.scss + _uw-dark.scss + template.qmd
use_uw_beamer()     # _uw-beamer-preamble.tex + title.tex + template.qmd
```

All three default to the current working directory. Pass `path = "slides"` etc.
to copy into a subdirectory. Use `overwrite = TRUE` to replace existing files.

### Switching light ↔ dark

**RevealJS** — swap one line in the template YAML and match the setup chunk:

```yaml
theme: [default, _uw-light.scss]   # light
theme: [default, _uw-dark.scss]    # dark
```

```r
theme_set(theme_uw(base_size = 14))       # light
theme_set(theme_uw_dark(base_size = 14))  # dark
```

**Beamer** — flip one line in `_uw-beamer-preamble.tex`:

```latex
\uwdarkfalse   % light (default)
\uwdarktrue    % dark
```

## Brand resources

- Colors: <https://brand.wisc.edu/visual-identity/colors/>
- Typography: <https://brand.wisc.edu/visual-identity/typography/>
- Icons & illustrations: <https://brand.wisc.edu/visual-identity/graphics-and-icons/>
