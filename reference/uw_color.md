# Look up UW–Madison brand colors by name

Look up UW–Madison brand colors by name

## Usage

``` r
uw_color(...)
```

## Arguments

- ...:

  One or more color names from
  [uw_colors](https://cdmuir.github.io/uwbranding/reference/uw_colors.md).
  If empty, the full named vector is returned.

## Value

A named character vector of hex codes.

## Examples

``` r
uw_color("badger_red")
#> badger_red 
#>  "#C5050C" 
uw_color("badger_red", "dark_red")
#> badger_red   dark_red 
#>  "#C5050C"  "#9B0000" 
uw_color() # all colors
#> badger_red      white   dark_red light_gray      black     yellow  gray_blue 
#>  "#C5050C"  "#FFFFFF"  "#9B0000"  "#E1E5E7"  "#121212"  "#FFBF00"  "#6B9999" 
#>       blue 
#>  "#386666" 
```
