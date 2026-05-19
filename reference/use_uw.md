# Copy UW brand Quarto templates into the current project

These functions copy template files from the package's `inst/templates/`
directory into `path` so they can be used immediately with
`quarto render`. See the **Details** section for the files each function
copies.

## Usage

``` r
use_uw_pdf(path = ".", overwrite = FALSE)

use_uw_revealjs(path = ".", overwrite = FALSE)

use_uw_beamer(path = ".", overwrite = FALSE)
```

## Arguments

- path:

  Directory to copy files into. Defaults to the current working
  directory.

- overwrite:

  If `TRUE`, existing files are overwritten without prompting. Default
  `FALSE`.

## Value

The value of `path`, invisibly.

## Details

**`use_uw_pdf()`** copies:

- `uw-brand.tex` — LaTeX preamble (brand colors, fonts, heading styles)

- `_quarto.yml` — project config (XeLaTeX engine, shared settings)

- `template.qmd` — starter Quarto PDF document

**`use_uw_revealjs()`** copies:

- `_uw-light.scss` — RevealJS light theme

- `_uw-dark.scss` — RevealJS dark theme

- `template.qmd` — starter RevealJS presentation

**`use_uw_beamer()`** copies:

- `_uw-beamer-preamble.tex` — Beamer color/font/layout setup

- `title.tex` — custom title-page partial

- `template.qmd` — starter Beamer presentation
