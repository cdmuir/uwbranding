# ── Discrete scales (light) ──────────────────────────────────────────────────

#' UW brand discrete color scale
#'
#' Uses [uw_palette_discrete], ordered for contrast on light/white backgrounds.
#'
#' @inheritParams ggplot2::scale_color_manual
#' @export
#' @examples
#' ggplot2::ggplot(mpg, ggplot2::aes(displ, hwy, color = drv)) +
#'   ggplot2::geom_point() +
#'   scale_color_uw()
scale_color_uw <- function(...) {
  discrete_scale(aesthetics = "colour", palette = uw_pal, ...)
}

#' @rdname scale_color_uw
#' @export
scale_colour_uw <- scale_color_uw

#' UW brand discrete fill scale
#'
#' Uses [uw_palette_discrete], ordered for contrast on light/white backgrounds.
#'
#' @inheritParams ggplot2::scale_fill_manual
#' @export
#' @examples
#' ggplot2::ggplot(mpg, ggplot2::aes(class, fill = class)) +
#'   ggplot2::geom_bar() +
#'   scale_fill_uw()
scale_fill_uw <- function(...) {
  discrete_scale(aesthetics = "fill", palette = uw_pal, ...)
}

# ── Continuous scales (light) ─────────────────────────────────────────────────

#' UW brand sequential color scale (continuous, light backgrounds)
#'
#' Gradient from UW Light Gray to Badger Red.
#'
#' @param low Low-end color. Default UW Light Gray (`#E1E5E7`).
#' @param high High-end color. Default Badger Red (`#C5050C`).
#' @inheritParams ggplot2::scale_color_gradient
#' @export
#' @examples
#' ggplot2::ggplot(faithfuld, ggplot2::aes(waiting, eruptions, fill = density)) +
#'   ggplot2::geom_tile() +
#'   scale_fill_uw_c()
scale_color_uw_c <- function(
  low  = unname(uw_colors["light_gray"]),
  high = unname(uw_colors["badger_red"]),
  ...
) {
  scale_color_gradient(low = low, high = high, ...)
}

#' @rdname scale_color_uw_c
#' @export
scale_colour_uw_c <- scale_color_uw_c

#' @rdname scale_color_uw_c
#' @export
scale_fill_uw_c <- function(
  low  = unname(uw_colors["light_gray"]),
  high = unname(uw_colors["badger_red"]),
  ...
) {
  scale_fill_gradient(low = low, high = high, ...)
}

# ── Discrete scales (dark) ───────────────────────────────────────────────────

#' UW brand discrete color scale for dark backgrounds
#'
#' Uses [uw_palette_dark], ordered for contrast on dark panels. Red-family
#' colors are placed last because they are low-contrast on a Badger Red
#' background.
#'
#' @inheritParams ggplot2::scale_color_manual
#' @export
#' @examples
#' ggplot2::ggplot(mpg, ggplot2::aes(displ, hwy, color = drv)) +
#'   ggplot2::geom_point() +
#'   scale_color_uw_dark() +
#'   theme_uw_dark()
scale_color_uw_dark <- function(...) {
  discrete_scale(aesthetics = "colour", palette = uw_pal_dark, ...)
}

#' @rdname scale_color_uw_dark
#' @export
scale_colour_uw_dark <- scale_color_uw_dark

#' @rdname scale_color_uw_dark
#' @export
scale_fill_uw_dark <- function(...) {
  discrete_scale(aesthetics = "fill", palette = uw_pal_dark, ...)
}

# ── Continuous scales (dark) ──────────────────────────────────────────────────

#' UW brand sequential color scale for dark backgrounds (continuous)
#'
#' Default gradient runs Badger Red → White, suited to dark panels.
#'
#' @param low Low-end color. Default Badger Red (`#C5050C`).
#' @param high High-end color. Default White (`#FFFFFF`).
#' @inheritParams ggplot2::scale_color_gradient
#' @export
#' @examples
#' ggplot2::ggplot(faithfuld, ggplot2::aes(waiting, eruptions, fill = density)) +
#'   ggplot2::geom_tile() +
#'   scale_fill_uw_dark_c() +
#'   theme_uw_dark(grid = "none")
scale_color_uw_dark_c <- function(
  low  = unname(uw_colors["badger_red"]),
  high = unname(uw_colors["white"]),
  ...
) {
  scale_color_gradient(low = low, high = high, ...)
}

#' @rdname scale_color_uw_dark_c
#' @export
scale_colour_uw_dark_c <- scale_color_uw_dark_c

#' @rdname scale_color_uw_dark_c
#' @export
scale_fill_uw_dark_c <- function(
  low  = unname(uw_colors["badger_red"]),
  high = unname(uw_colors["white"]),
  ...
) {
  scale_fill_gradient(low = low, high = high, ...)
}
