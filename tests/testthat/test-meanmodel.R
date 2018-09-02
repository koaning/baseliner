context("test-meanmodel.R")

test_that("basic mean example works", {
  dataf <- data_frame(val = 1:100, x = 1:100)
  mod <- mean_model(val ~ x, data=dataf)
  test_data <- data_frame(x = rep(0, 5))
  pred <- predict(mod, test_data)
  expect_equal(pred, rep(50.5, 5))
})

test_that("example with doubles", {
  dataf <- data_frame(val = as.double(1:100), x = 1:100)
  mod <- mean_model(val ~ x, data=dataf)
  test_data <- data_frame(x = rep(0, 5))
  pred <- predict(mod, test_data)
  expect_equal(pred, rep(50.5, 5))
})

test_that("example with negatives", {
  dataf <- data_frame(val = -99:0, x = 1:100)
  mod <- mean_model(val ~ x, data=dataf)
  test_data <- data_frame(x = rep(0, 5))
  pred <- predict(mod, test_data)
  expect_equal(pred, rep(-49.5, 5))
})

test_that("example with negatives that are double", {
  dataf <- data_frame(val = as.double(-99:0), x = 1:100)
  mod <- mean_model(val ~ x, data=dataf)
  test_data <- data_frame(x = rep(0, 5))
  pred <- predict(mod, test_data)
  expect_equal(pred, rep(-49.5, 5))
})

test_that("example with NAs", {
  dataf <- data_frame(val = 1:100, x = 1:100)
  dataf[1:5,'val'] <- NA
  mod <- mean_model(val ~ x, data=dataf)
  test_data <- data_frame(x = rep(0, 5))
  pred <- predict(mod, test_data)
  expect_equal(pred, rep(mean(6:100), 5))
})

