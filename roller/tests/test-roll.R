library(testthat)

context("Check roll arguments")

test_that("check_times works with good vectors", {
  expect_true(check_times(1))
  expect_true(check_times(2))
  expect_true(check_times(100))
})

test_that("check_times fails with invalid roll argument", {
  expect_false(check_times(0))
  expect_false(check_times(-1))
  expect_false(check_times(1.5))
})
