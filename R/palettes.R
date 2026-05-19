#' UW–Madison discrete palette for light backgrounds
#'
#' Colors are ordered so early entries have strong contrast on white. Light
#' gray is last because it is nearly invisible on white.
#'
#' @export
uw_palette_discrete <- c(
  "#C5050C", # badger_red
  "#121212", # black
  "#9B0000", # dark_red
  "#FFBF00", # yellow
  "#6B9999", # gray_blue
  "#386666", # blue
  "#E1E5E7"  # light_gray
)

#' UW–Madison discrete palette for dark backgrounds
#'
#' Colors are ordered so early entries have strong contrast on dark panels.
#' Red-family colors are last because they disappear on a Badger Red
#' background.
#'
#' @export
uw_palette_dark <- c(
  "#FFFFFF", # white
  "#FFBF00", # yellow
  "#E1E5E7", # light_gray
  "#6B9999", # gray_blue
  "#386666", # blue
  "#C5050C", # badger_red
  "#9B0000"  # dark_red
)

#' UW brand discrete palette function for light backgrounds
#'
#' For direct use with [ggplot2::discrete_scale()]. See [scale_fill_uw()] and
#' [scale_color_uw()] for the scale wrappers.
#'
#' @param n Number of colors. Maximum 7.
#' @return Character vector of hex codes.
#' @export
#' @examples
#' uw_pal(3)
uw_pal <- function(n = length(uw_palette_discrete)) {
  if (n > length(uw_palette_discrete)) {
    warning(
      "UW brand palette has only ", length(uw_palette_discrete),
      " colors; ", n, " requested."
    )
  }
  uw_palette_discrete[seq_len(min(n, length(uw_palette_discrete)))]
}

#' UW brand discrete palette function for dark backgrounds
#'
#' For direct use with [ggplot2::discrete_scale()]. See [scale_fill_uw_dark()]
#' and [scale_color_uw_dark()] for the scale wrappers.
#'
#' @param n Number of colors. Maximum 7.
#' @return Character vector of hex codes.
#' @export
#' @examples
#' uw_pal_dark(3)
uw_pal_dark <- function(n = length(uw_palette_dark)) {
  if (n > length(uw_palette_dark)) {
    warning(
      "UW dark palette has only ", length(uw_palette_dark),
      " colors; ", n, " requested."
    )
  }
  uw_palette_dark[seq_len(min(n, length(uw_palette_dark)))]
}
