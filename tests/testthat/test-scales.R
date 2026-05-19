test_that("discrete light scales return Scale objects", {
  expect_s3_class(scale_color_uw(), "ScaleDiscrete")
  expect_s3_class(scale_colour_uw(), "ScaleDiscrete")
  expect_s3_class(scale_fill_uw(), "ScaleDiscrete")
})

test_that("continuous light scales return Scale objects", {
  expect_s3_class(scale_color_uw_c(), "ScaleContinuous")
  expect_s3_class(scale_colour_uw_c(), "ScaleContinuous")
  expect_s3_class(scale_fill_uw_c(), "ScaleContinuous")
})

test_that("discrete dark scales return Scale objects", {
  expect_s3_class(scale_color_uw_dark(), "ScaleDiscrete")
  expect_s3_class(scale_colour_uw_dark(), "ScaleDiscrete")
  expect_s3_class(scale_fill_uw_dark(), "ScaleDiscrete")
})

test_that("continuous dark scales return Scale objects", {
  expect_s3_class(scale_color_uw_dark_c(), "ScaleContinuous")
  expect_s3_class(scale_colour_uw_dark_c(), "ScaleContinuous")
  expect_s3_class(scale_fill_uw_dark_c(), "ScaleContinuous")
})
