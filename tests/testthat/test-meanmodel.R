context("test-meanmodel.R")

test_that("basic mean example works", {
  dataf <- data.frame(val = 1:100, x = 1:100)
  mod <- mean_model(val ~ x, data=dataf)
  test_data <- data.frame(x = rep(0, 5))
  pred <- predict(mod, test_data)
  expect_equal(pred, rep(50.5, 5))
})


test_that("formula with dot works", {
  dataf <- data.frame(val = 1:100, x = 1:100)
  mod <- mean_model(val ~ ., data=dataf)
  test_data <- data.frame(x = rep(0, 5))
  pred <- predict(mod, test_data)
  expect_equal(pred, rep(50.5, 5))
})
