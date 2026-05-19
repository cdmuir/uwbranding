#' Copy UW brand Quarto templates into the current project
#'
#' These functions copy template files from the package's `inst/templates/`
#' directory into `path` so they can be used immediately with
#' `quarto render`. See the **Details** section for the files each function
#' copies.
#'
#' @section Details:
#'
#' **`use_uw_pdf()`** copies:
#' - `uw-brand.tex` — LaTeX preamble (brand colors, fonts, heading styles)
#' - `_quarto.yml` — project config (XeLaTeX engine, shared settings)
#' - `template.qmd` — starter Quarto PDF document
#'
#' **`use_uw_revealjs()`** copies:
#' - `_uw-light.scss` — RevealJS light theme
#' - `_uw-dark.scss` — RevealJS dark theme
#' - `template.qmd` — starter RevealJS presentation
#'
#' **`use_uw_beamer()`** copies:
#' - `_uw-beamer-preamble.tex` — Beamer color/font/layout setup
#' - `title.tex` — custom title-page partial
#' - `template.qmd` — starter Beamer presentation
#'
#' @param path Directory to copy files into. Defaults to the current
#'   working directory.
#' @param overwrite If `TRUE`, existing files are overwritten without
#'   prompting. Default `FALSE`.
#'
#' @return The value of `path`, invisibly.
#' @name use_uw
NULL

#' @rdname use_uw
#' @export
use_uw_pdf <- function(path = ".", overwrite = FALSE) {
  copy_templates("pdf", path = path, overwrite = overwrite)
}

#' @rdname use_uw
#' @export
use_uw_revealjs <- function(path = ".", overwrite = FALSE) {
  copy_templates("revealjs", path = path, overwrite = overwrite)
}

#' @rdname use_uw
#' @export
use_uw_beamer <- function(path = ".", overwrite = FALSE) {
  copy_templates("beamer", path = path, overwrite = overwrite)
}

# Internal helper -------------------------------------------------------

copy_templates <- function(type, path, overwrite) {
  template_dir <- system.file(
    "templates", type,
    package = "uwbranding",
    mustWork = TRUE
  )

  if (!dir.exists(path)) {
    dir.create(path, recursive = TRUE)
  }

  files <- list.files(template_dir, full.names = TRUE)

  for (src in files) {
    dest <- file.path(path, basename(src))
    if (file.exists(dest) && !overwrite) {
      message(
        "Skipping ", basename(src),
        " — already exists (use overwrite = TRUE to replace)."
      )
      next
    }
    file.copy(src, dest, overwrite = overwrite)
    message("Created: ", dest)
  }

  invisible(path)
}
