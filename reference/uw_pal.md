# UW brand discrete palette function for light backgrounds

For direct use with
[`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).
See
[`scale_fill_uw()`](https://cdmuir.github.io/uwbranding/reference/scale_fill_uw.md)
and
[`scale_color_uw()`](https://cdmuir.github.io/uwbranding/reference/scale_color_uw.md)
for the scale wrappers.

## Usage

``` r
uw_pal(n = length(uw_palette_discrete))
```

## Arguments

- n:

  Number of colors. Maximum 7.

## Value

Character vector of hex codes.

## Examples

``` r
uw_pal(3)
#> [1] "#C5050C" "#121212" "#9B0000"
```
