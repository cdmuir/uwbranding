#' UW–Madison ggplot2 theme (light)
#'
#' Applies the UW–Madison brand identity to a ggplot2 plot:
#' - Red Hat Display for titles and facet strip labels
#' - Red Hat Text for axis labels, legend text, and captions
#' - Crimson Pro (or `base_family`) for all other text
#' - Badger Red title and facet strip background
#' - Light gray grid lines on a white panel
#'
#' @param base_size Base font size in points. Default `11`.
#' @param base_family Base font family for body text. Default
#'   `"Crimson Pro"`. Use `"Red Hat Text"` for a pure sans-serif body.
#' @param title_color Color for the plot title. Accepts a name from
#'   [uw_colors] or any hex string. Default `"badger_red"`.
#' @param grid Which major grid lines to show. One of `"both"` (default),
#'   `"x"`, `"y"`, or `"none"`.
#' @param ... Additional arguments passed to [ggplot2::theme()].
#' @return A [ggplot2::theme()] object.
#' @export
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
#'   ggplot2::geom_point() +
#'   ggplot2::labs(title = "Fuel Economy") +
#'   theme_uw()
#'
#' # Grid on x axis only, larger base size
#' ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
#'   ggplot2::geom_point() +
#'   theme_uw(base_size = 14, grid = "x")
theme_uw <- function(
  base_size   = 11,
  base_family = "Crimson Pro",
  title_color = "badger_red",
  grid        = c("both", "x", "y", "none"),
  ...
) {
  grid <- match.arg(grid)

  title_hex <- if (title_color %in% names(uw_colors)) {
    unname(uw_colors[title_color])
  } else {
    title_color
  }

  major_x <- if (grid %in% c("both", "x")) {
    element_line(color = "#E1E5E7", linewidth = 0.4)
  } else {
    element_blank()
  }

  major_y <- if (grid %in% c("both", "y")) {
    element_line(color = "#E1E5E7", linewidth = 0.4)
  } else {
    element_blank()
  }

  theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    theme(
      plot.title = element_text(
        family = "Red Hat Display",
        face   = "bold",
        color  = title_hex,
        size   = base_size * 1.25,
        margin = margin(b = 4)
      ),
      plot.subtitle = element_text(
        family = "Red Hat Display",
        color  = "#121212",
        size   = base_size * 0.95,
        margin = margin(b = 8)
      ),
      plot.caption = element_text(
        family = "Red Hat Text",
        color  = "#121212",
        size   = base_size * 0.78,
        hjust  = 1,
        margin = margin(t = 6)
      ),
      plot.title.position   = "plot",
      plot.caption.position = "plot",
      axis.title = element_text(
        family = "Red Hat Text",
        face   = "bold",
        color  = "#121212",
        size   = base_size * 0.88
      ),
      axis.title.x = element_text(margin = margin(t = 6)),
      axis.title.y = element_text(margin = margin(r = 6)),
      axis.text = element_text(
        family = "Red Hat Text",
        color  = "#121212",
        size   = base_size * 0.82
      ),
      axis.ticks         = element_line(color = "#E1E5E7"),
      panel.grid.major.x = major_x,
      panel.grid.major.y = major_y,
      panel.grid.minor   = element_blank(),
      panel.background   = element_rect(fill = "white", color = NA),
      plot.background    = element_rect(fill = "white", color = NA),
      legend.title = element_text(
        family = "Red Hat Text",
        face   = "bold",
        color  = "#121212",
        size   = base_size * 0.88
      ),
      legend.text = element_text(
        family = "Red Hat Text",
        color  = "#121212",
        size   = base_size * 0.82
      ),
      legend.key        = element_rect(fill = "white", color = NA),
      legend.background = element_rect(fill = "white", color = NA),
      strip.text = element_text(
        family = "Red Hat Display",
        face   = "bold",
        color  = "white",
        size   = base_size * 0.88
      ),
      strip.background = element_rect(fill = "#C5050C", color = NA),
      plot.margin      = margin(12, 12, 8, 12),
      ...
    )
}
