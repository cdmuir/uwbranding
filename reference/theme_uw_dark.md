# UW–Madison ggplot2 theme (dark)

Two background styles for slides and poster panels, both using light
text with Badger Red accents. The title slide treatment matches the
Quarto RevealJS and Beamer templates.

## Usage

``` r
theme_uw_dark(
  style = c("black", "red"),
  base_size = 14,
  base_family = "Red Hat Text",
  grid = NULL,
  ...
)
```

## Arguments

- style:

  Background style. `"black"` (default) uses a near-black (`#121212`)
  background with a Badger Red title. `"red"` uses a Badger Red
  background with a white title.

- base_size:

  Base font size in points. Default `14` — larger than
  [`theme_uw()`](https://cdmuir.github.io/uwbranding/reference/theme_uw.md)
  because dark themes are typically used at presentation scale.

- base_family:

  Base font family. Default `"Red Hat Text"` (sans-serif reads better on
  screen at presentation sizes).

- grid:

  Which major grid lines to show. One of `"both"`, `"x"`, `"y"`, or
  `"none"`. Defaults to `"both"` for `style = "black"` and `"none"` for
  `style = "red"`.

- ...:

  Additional arguments passed to
  [`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html).

## Value

A
[`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html)
object.

## Examples

``` r
ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
  ggplot2::geom_point(color = "white") +
  theme_uw_dark()


ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
  ggplot2::geom_point(color = "white") +
  theme_uw_dark(style = "red")
```
