# UW brand sequential color scale (continuous, light backgrounds)

Gradient from UW Light Gray to Badger Red.

## Usage

``` r
scale_color_uw_c(
  low = unname(uw_colors["light_gray"]),
  high = unname(uw_colors["badger_red"]),
  ...
)

scale_colour_uw_c(
  low = unname(uw_colors["light_gray"]),
  high = unname(uw_colors["badger_red"]),
  ...
)

scale_fill_uw_c(
  low = unname(uw_colors["light_gray"]),
  high = unname(uw_colors["badger_red"]),
  ...
)
```

## Arguments

- low:

  Low-end color. Default UW Light Gray (`#E1E5E7`).

- high:

  High-end color. Default Badger Red (`#C5050C`).

- ...:

  Arguments passed on to
  [`continuous_scale`](https://ggplot2.tidyverse.org/reference/continuous_scale.html)

  `scale_name`

  :   **\[deprecated\]** The name of the scale that should be used for
      error messages associated with this scale.

  `breaks`

  :   One of:

      - `NULL` for no breaks

      - [`waiver()`](https://ggplot2.tidyverse.org/reference/waiver.html)
        for the default breaks computed by the [transformation
        object](https://scales.r-lib.org/reference/new_transform.html)

      - A numeric vector of positions

      - A function that takes the limits as input and returns breaks as
        output (e.g., a function returned by
        [`scales::extended_breaks()`](https://scales.r-lib.org/reference/breaks_extended.html)).
        Note that for position scales, limits are provided after scale
        expansion. Also accepts rlang
        [lambda](https://rlang.r-lib.org/reference/as_function.html)
        function notation.

  `minor_breaks`

  :   One of:

      - `NULL` for no minor breaks

      - [`waiver()`](https://ggplot2.tidyverse.org/reference/waiver.html)
        for the default breaks (none for discrete, one minor break
        between each major break for continuous)

      - A numeric vector of positions

      - A function that given the limits returns a vector of minor
        breaks. Also accepts rlang
        [lambda](https://rlang.r-lib.org/reference/as_function.html)
        function notation. When the function has two arguments, it will
        be given the limits and major break positions.

  `n.breaks`

  :   An integer guiding the number of major breaks. The algorithm may
      choose a slightly different number to ensure nice break labels.
      Will only have an effect if `breaks = waiver()`. Use `NULL` to use
      the default number of breaks given by the transformation.

  `labels`

  :   One of the options below. Please note that when `labels` is a
      vector, it is highly recommended to also set the `breaks` argument
      as a vector to protect against unintended mismatches.

      - `NULL` for no labels

      - [`waiver()`](https://ggplot2.tidyverse.org/reference/waiver.html)
        for the default labels computed by the transformation object

      - A character vector giving labels (must be same length as
        `breaks`)

      - An expression vector (must be the same length as breaks). See
        ?plotmath for details.

      - A function that takes the breaks as input and returns labels as
        output. Also accepts rlang
        [lambda](https://rlang.r-lib.org/reference/as_function.html)
        function notation.

  `limits`

  :   One of:

      - `NULL` to use the default scale range

      - A numeric vector of length two providing limits of the scale.
        Use `NA` to refer to the existing minimum or maximum

      - A function that accepts the existing (automatic) limits and
        returns new limits. Also accepts rlang
        [lambda](https://rlang.r-lib.org/reference/as_function.html)
        function notation. Note that setting limits on positional scales
        will **remove** data outside of the limits. If the purpose is to
        zoom, use the limit argument in the coordinate system (see
        [`coord_cartesian()`](https://ggplot2.tidyverse.org/reference/coord_cartesian.html)).

  `rescaler`

  :   A function used to scale the input values to the range \[0, 1\].
      This is always
      [`scales::rescale()`](https://scales.r-lib.org/reference/rescale.html),
      except for diverging and n colour gradients (i.e.,
      [`scale_colour_gradient2()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html),
      [`scale_colour_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html)).
      The `rescaler` is ignored by position scales, which always use
      [`scales::rescale()`](https://scales.r-lib.org/reference/rescale.html).
      Also accepts rlang
      [lambda](https://rlang.r-lib.org/reference/as_function.html)
      function notation.

  `oob`

  :   One of:

      - Function that handles limits outside of the scale limits (out of
        bounds). Also accepts rlang
        [lambda](https://rlang.r-lib.org/reference/as_function.html)
        function notation.

      - The default
        ([`scales::censor()`](https://scales.r-lib.org/reference/oob.html))
        replaces out of bounds values with `NA`.

      - [`scales::squish()`](https://scales.r-lib.org/reference/oob.html)
        for squishing out of bounds values into range.

      - [`scales::squish_infinite()`](https://scales.r-lib.org/reference/oob.html)
        for squishing infinite values into range.

  `trans`

  :   **\[deprecated\]** Deprecated in favour of `transform`.

  `call`

  :   The `call` used to construct the scale for reporting messages.

  `super`

  :   The super class to use for the constructed scale

## Examples

``` r
ggplot2::ggplot(faithfuld, ggplot2::aes(waiting, eruptions, fill = density)) +
  ggplot2::geom_tile() +
  scale_fill_uw_c()
#> Error: object 'faithfuld' not found
```
