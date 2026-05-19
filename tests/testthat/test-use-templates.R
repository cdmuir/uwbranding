test_that("use_uw_pdf() copies expected files", {
  tmp <- withr::local_tempdir()
  use_uw_pdf(path = tmp)
  files <- list.files(tmp)
  expect_true("uw-brand.tex" %in% files)
  expect_true("_quarto.yml" %in% files)
  expect_true("template.qmd" %in% files)
})

test_that("use_uw_revealjs() copies expected files", {
  tmp <- withr::local_tempdir()
  use_uw_revealjs(path = tmp)
  files <- list.files(tmp)
  expect_true("_uw-light.scss" %in% files)
  expect_true("_uw-dark.scss" %in% files)
  expect_true("template.qmd" %in% files)
})

test_that("use_uw_beamer() copies expected files", {
  tmp <- withr::local_tempdir()
  use_uw_beamer(path = tmp)
  files <- list.files(tmp)
  expect_true("_uw-beamer-preamble.tex" %in% files)
  expect_true("title.tex" %in% files)
  expect_true("template.qmd" %in% files)
})

test_that("use_uw_pdf() skips existing files when overwrite = FALSE", {
  tmp <- withr::local_tempdir()
  use_uw_pdf(path = tmp)
  # second call should message about skipping, not error
  expect_message(use_uw_pdf(path = tmp, overwrite = FALSE), "Skipping")
})

test_that("use_uw_pdf() overwrites when overwrite = TRUE", {
  tmp <- withr::local_tempdir()
  use_uw_pdf(path = tmp)
  # second call with overwrite = TRUE should succeed silently
  expect_no_error(use_uw_pdf(path = tmp, overwrite = TRUE))
})
