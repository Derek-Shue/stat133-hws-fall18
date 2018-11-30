library(testthat)

context("Check device arguments")

test_that("check_sides with good vectors", {
  expect_true(check_sides(c(1,2)))
  expect_true(check_sides(c('heads', 'tails')))
})

test_that("check_sides fails with length < 2", {
  expect_error(check_sides(1))
})

test_that("check_sides fails with duplicated elements", {
  expect_error(check_sides(c(1,1)))
})

test_that("check_prob works with good vectors", {
  expect_true(check_prob(c(0.5, 0.5)))
  expect_true(check_prob(c(1, 0)))
  expect_true(check_prob(c(0, 1)))
  expect_true(check_prob(c(0.2, 0.8)))
  expect_true(check_prob(c(0.8, 0.2)))
  expect_true(check_prob(c(1/4, 3/4)))
})

test_that("check_prob fails with inproper class of input", {
  expect_error(check_prob(c(TRUE, FALSE)))
  expect_error(check_prob(c('a', 'b')))
})

test_that("check_prob fails with individual probabilities not between 0 and 1", {
  expect_error(check_prob(c(-1, 1, 1)))
  expect_error(check_prob(c(2, 0.5)))
})

test_that("check_prob fails when sum of probabilities isn't 1", {
  expect_error(check_prob(c(0.3, 0.3)))
  expect_error(check_prob(c(0.6, 0.6)))
})

test_that("device fails when sides and prob aren't the same length", {
  expect_error(device(sides = c(1,2), prob = rep(1/3, 3)))
  expect_error(device(sides = c(1,2,3), prob = c(0.5, 0.5)))
})
