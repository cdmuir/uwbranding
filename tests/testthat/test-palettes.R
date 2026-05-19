test_that("uw_palette_discrete contains valid hex codes", {
  expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", uw_palette_discrete)))
})

test_that("uw_palette_dark contains valid hex codes", {
  expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", uw_palette_dark)))
})

test_that("uw_pal() returns n colors", {
  expect_length(uw_pal(3), 3)
  expect_length(uw_pal(7), 7)
})

test_that("uw_pal() warns when n exceeds palette size", {
  expect_snapshot(uw_pal(8))
})

test_that("uw_pal_dark() returns n colors", {
  expect_length(uw_pal_dark(3), 3)
})

test_that("uw_pal_dark() warns when n exceeds palette size", {
  expect_snapshot(uw_pal_dark(8))
})
