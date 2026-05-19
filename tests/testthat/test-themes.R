test_that("theme_uw() returns a ggplot2 theme", {
  t <- theme_uw()
  expect_s3_class(t, "theme")
})

test_that("theme_uw() grid argument is validated", {
  expect_s3_class(theme_uw(grid = "both"), "theme")
  expect_s3_class(theme_uw(grid = "x"), "theme")
  expect_s3_class(theme_uw(grid = "y"), "theme")
  expect_s3_class(theme_uw(grid = "none"), "theme")
  expect_snapshot(theme_uw(grid = "diagonal"), error = TRUE)
})

test_that("theme_uw() accepts raw hex for title_color", {
  expect_s3_class(theme_uw(title_color = "#FF0000"), "theme")
})

test_that("theme_uw_dark() returns a ggplot2 theme", {
  expect_s3_class(theme_uw_dark(), "theme")
  expect_s3_class(theme_uw_dark(style = "red"), "theme")
})

test_that("theme_uw_dark() style argument is validated", {
  expect_snapshot(theme_uw_dark(style = "pink"), error = TRUE)
})
