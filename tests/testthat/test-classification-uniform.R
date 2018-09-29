context("dummy_classifier_uniform")

test_that("dummy_classifier_uniform basic example", {
  dataf <- data.frame(y = c("a", "b", "b"), x = 1:3, z = 1)
  mod <- dummy_classifier(y ~ x, data=dataf, strategy = "uniform")
  expect_equal(mod$prob_df$p, c(0.5, 0.5))
  test_data <- data.frame(x = 1:5)
  predictions <- predict(mod, test_data)
})
