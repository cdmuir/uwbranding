# UW brand discrete palette function for dark backgrounds

For direct use with
[`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).
See
[`scale_fill_uw_dark()`](https://cdmuir.github.io/uwbranding/reference/scale_color_uw_dark.md)
and
[`scale_color_uw_dark()`](https://cdmuir.github.io/uwbranding/reference/scale_color_uw_dark.md)
for the scale wrappers.

## Usage

``` r
uw_pal_dark(n = length(uw_palette_dark))
```

## Arguments

- n:

  Number of colors. Maximum 7.

## Value

Character vector of hex codes.

## Examples

``` r
uw_pal_dark(3)
#> [1] "#FFFFFF" "#FFBF00" "#E1E5E7"
```
