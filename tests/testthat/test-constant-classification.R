context("dummy_classifier_constant")

test_that("dummy_classifier_constant constant example", {
  dataf <- data.frame(y = c("a", "b", "b"), x = 1:3, z = 1)
  mod <- dummy_classifier(y ~ x, data=dataf, strategy = "constant", constant = "a")
  test_data <- data.frame(x = 1:5)
  expected <- rep("a", nrow(test_data))
  predictions <- predict(mod, test_data)
  expect_equal(predictions, expected)
})

test_that("error should be raised when wrong constant is passed", {
  dataf <- data.frame(y = c("a", "b", "b"), x = 1:3, z = 1)
  expect_error(dummy_classifier(y ~ x, data=dataf, strategy = "constant", constant = "c"))
})
