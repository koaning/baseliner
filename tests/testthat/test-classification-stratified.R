context("dummy_classifier_stratisfied")

test_that("dummy_classifier_stratisfied basic example 1", {
  dataf <- data.frame(y = c("a", "b", "b"), x = 1:3, z = 1)
  mod <- dummy_classifier(y ~ x, data=dataf, strategy = "stratified")
  expect_equal(mod$strategy, "stratified")
  expect_equal(mod$prob_df$p, c(0.66667, 0.33333), tolerance=0.001)
  test_data <- data.frame(x = 1:5)
  predictions <- predict(mod, test_data)
})

test_that("dummy_classifier_stratisfied basic example 2", {
  dataf <- data.frame(y = c("a", "b"), x = 1:2, z = 1)
  mod <- dummy_classifier(y ~ x, data=dataf, strategy = "stratified")
  expect_equal(mod$strategy, "stratified")
  expect_equal(mod$prob_df$p, c(0.5, 0.5), tolerance=0.001)
  test_data <- data.frame(x = 1:5)
  predictions <- predict(mod, test_data)
})
