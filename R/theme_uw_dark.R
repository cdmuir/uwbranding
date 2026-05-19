#' UW–Madison ggplot2 theme (dark)
#'
#' Two background styles for slides and poster panels, both using light text
#' with Badger Red accents. The title slide treatment matches the Quarto
#' RevealJS and Beamer templates.
#'
#' @param style Background style. `"black"` (default) uses a near-black
#'   (`#121212`) background with a Badger Red title. `"red"` uses a Badger
#'   Red background with a white title.
#' @param base_size Base font size in points. Default `14` — larger than
#'   [theme_uw()] because dark themes are typically used at presentation
#'   scale.
#' @param base_family Base font family. Default `"Red Hat Text"` (sans-serif
#'   reads better on screen at presentation sizes).
#' @param grid Which major grid lines to show. One of `"both"`, `"x"`,
#'   `"y"`, or `"none"`. Defaults to `"both"` for `style = "black"` and
#'   `"none"` for `style = "red"`.
#' @param ... Additional arguments passed to [ggplot2::theme()].
#' @return A [ggplot2::theme()] object.
#' @export
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
#'   ggplot2::geom_point(color = "white") +
#'   theme_uw_dark()
#'
#' ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
#'   ggplot2::geom_point(color = "white") +
#'   theme_uw_dark(style = "red")
theme_uw_dark <- function(
  style       = c("black", "red"),
  base_size   = 14,
  base_family = "Red Hat Text",
  grid        = NULL,
  ...
) {
  style <- match.arg(style)

  if (style == "black") {
    bg_color     <- "#121212"
    title_color  <- "#C5050C"
    text_color   <- "#E1E5E7"
    grid_color   <- "#2D2D2D"
    strip_bg     <- "#C5050C"
    strip_fg     <- "#FFFFFF"
    default_grid <- "both"
  } else {
    bg_color     <- "#C5050C"
    title_color  <- "#FFFFFF"
    text_color   <- "#FFFFFF"
    grid_color   <- "#9B0000"
    strip_bg     <- "#9B0000"
    strip_fg     <- "#FFFFFF"
    default_grid <- "none"
  }

  grid <- if (is.null(grid)) default_grid else grid

  major_x <- if (grid %in% c("both", "x")) {
    element_line(color = grid_color, linewidth = 0.4)
  } else {
    element_blank()
  }

  major_y <- if (grid %in% c("both", "y")) {
    element_line(color = grid_color, linewidth = 0.4)
  } else {
    element_blank()
  }

  theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    theme(
      plot.title = element_text(
        family = "Red Hat Display",
        face   = "bold",
        color  = title_color,
        size   = base_size * 1.25,
        margin = margin(b = 4)
      ),
      plot.subtitle = element_text(
        family = "Red Hat Display",
        color  = text_color,
        size   = base_size * 0.95,
        margin = margin(b = 8)
      ),
      plot.caption = element_text(
        family = base_family,
        color  = text_color,
        size   = base_size * 0.75,
        hjust  = 1,
        margin = margin(t = 6)
      ),
      plot.title.position   = "plot",
      plot.caption.position = "plot",
      axis.title = element_text(
        family = base_family,
        face   = "bold",
        color  = text_color,
        size   = base_size * 0.88
      ),
      axis.title.x = element_text(margin = margin(t = 6)),
      axis.title.y = element_text(margin = margin(r = 6)),
      axis.text = element_text(
        family = base_family,
        color  = text_color,
        size   = base_size * 0.82
      ),
      axis.ticks         = element_line(color = grid_color),
      panel.grid.major.x = major_x,
      panel.grid.major.y = major_y,
      panel.grid.minor   = element_blank(),
      panel.background   = element_rect(fill = bg_color, color = NA),
      plot.background    = element_rect(fill = bg_color, color = NA),
      legend.title = element_text(
        family = base_family,
        face   = "bold",
        color  = text_color,
        size   = base_size * 0.88
      ),
      legend.text = element_text(
        family = base_family,
        color  = text_color,
        size   = base_size * 0.82
      ),
      legend.key        = element_rect(fill = bg_color, color = NA),
      legend.background = element_rect(fill = bg_color, color = NA),
      strip.text = element_text(
        family = "Red Hat Display",
        face   = "bold",
        color  = strip_fg,
        size   = base_size * 0.88
      ),
      strip.background = element_rect(fill = strip_bg, color = NA),
      plot.margin      = margin(12, 12, 8, 12),
      ...
    )
}
