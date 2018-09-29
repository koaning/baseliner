context("dummy_regressor_constant")

test_that("dummy_regressor constant example 1", {
  dataf <- data.frame(y = 1:10, x = 1:10, z = 1)
  mod <- dummy_regressor(y ~ x, data=dataf, strategy = "constant", constant = 1)
  test_data <- data.frame(x = 1:5, z= 1)
  expected <- rep(1, nrow(test_data))
  expect_equal(predict(mod, test_data), expected)
})

test_that("dummy_regressor constant example 2", {
  dataf <- data.frame(y = 1:10, x = 1:10, z = 1)
  mod <- dummy_regressor(x ~ y, data=dataf, strategy = "constant", constant = -1)
  test_data <- data.frame(x = 1:5, z= 1)
  expected <- rep(-1, nrow(test_data))
  expect_equal(predict(mod, test_data), expected)
})
