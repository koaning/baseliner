context("test-meanmodel.R")

test_that("basic mean example works", {
  dataf <- data_frame(val = 1:100, x = 1:100)
  mod <- mean_model(val ~ x, data=dataf)
  test_data <- data_frame(x = rep(0, 5))
  pred <- predict(mod, test_data)
  expect_equal(pred, rep(50.5, 5))
})

test_that("another mean example", {
  dataf <- data_frame(val = 1:50, x = 1:50)
  mod <- mean_model(val ~ x, data=dataf)
  test_data <- data_frame(x = 1:10)
  pred <- predict(mod, test_data)
  expect_equal(pred, rep(25.5, 10))
})
