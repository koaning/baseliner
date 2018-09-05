context("dummy_regressor_constant")

test_that("basic constant example", {
  dataf <- data.frame(y = 1:10, x = 1:10, z = 1)
  mod <- dummy_regressor(formula, data=dataf, strategy = "constant", constant = 1)
  test_data <- data.frame(x = 1:5, z= 1)
  expected <- rep(1, nrow(test_data))
  expect_equal(predict(mod, test_data), expected)
})
