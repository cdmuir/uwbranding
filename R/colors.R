#' UW–Madison brand colors
#'
#' A named character vector of hex codes for all official UW–Madison brand
#' colors. Primary and secondary digital colors are taken directly from
#' <https://brand.wisc.edu/visual-identity/colors/>. Accent colors are
#' approximate hex conversions from the published print CMYK values.
#'
#' @format A named character vector with eight elements:
#' \describe{
#'   \item{badger_red}{`#C5050C` — primary brand color}
#'   \item{white}{`#FFFFFF`}
#'   \item{dark_red}{`#9B0000` — secondary digital}
#'   \item{light_gray}{`#E1E5E7` — secondary digital}
#'   \item{black}{`#121212` — secondary digital}
#'   \item{yellow}{`#FFBF00` — print accent (CMYK 0, 25, 100, 0)}
#'   \item{gray_blue}{`#6B9999` — print accent (CMYK 30, 0, 0, 40)}
#'   \item{blue}{`#386666` — print accent (CMYK 45, 0, 0, 60)}
#' }
#' @source <https://brand.wisc.edu/visual-identity/colors/>
#' @export
uw_colors <- c(
  badger_red = "#C5050C",
  white      = "#FFFFFF",
  dark_red   = "#9B0000",
  light_gray = "#E1E5E7",
  black      = "#121212",
  yellow     = "#FFBF00",
  gray_blue  = "#6B9999",
  blue       = "#386666"
)

#' Look up UW–Madison brand colors by name
#'
#' @param ... One or more color names from [uw_colors]. If empty, the full
#'   named vector is returned.
#' @return A named character vector of hex codes.
#' @export
#' @examples
#' uw_color("badger_red")
#' uw_color("badger_red", "dark_red")
#' uw_color() # all colors
uw_color <- function(...) {
  cols <- c(...)
  if (is.null(cols)) return(uw_colors)
  unknown <- setdiff(cols, names(uw_colors))
  if (length(unknown) > 0) {
    stop(
      "Unknown UW color(s): ", paste(unknown, collapse = ", "),
      "\nAvailable: ", paste(names(uw_colors), collapse = ", ")
    )
  }
  uw_colors[cols]
}
