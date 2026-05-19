test_that("uw_colors is a named character vector with expected entries", {
  expect_type(uw_colors, "character")
  expect_named(uw_colors)
  expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", uw_colors)))
  expect_identical(unname(uw_colors["badger_red"]), "#C5050C")
  expect_identical(unname(uw_colors["dark_red"]), "#9B0000")
  expect_identical(unname(uw_colors["light_gray"]), "#E1E5E7")
  expect_identical(unname(uw_colors["black"]), "#121212")
})

test_that("uw_color() returns named hex codes", {
  result <- uw_color("badger_red")
  expect_identical(result, c(badger_red = "#C5050C"))
})

test_that("uw_color() accepts multiple names", {
  result <- uw_color("badger_red", "dark_red")
  expect_length(result, 2)
  expect_named(result, c("badger_red", "dark_red"))
})

test_that("uw_color() returns all colors when called with no arguments", {
  expect_identical(uw_color(), uw_colors)
})

test_that("uw_color() errors on unknown color names", {
  expect_snapshot(uw_color("not_a_color"), error = TRUE)
})
