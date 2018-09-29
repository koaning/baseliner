context("dummy_classifier_frequent")

test_that("dummy_classifier_frequent basic example", {
  dataf <- data.frame(y = c("a", "b", "b"), x = 1:3, z = 1)
  mod <- dummy_classifier(y ~ x, data=dataf, strategy = "most_frequent")
  test_data <- data.frame(x = 1:5)
  expected <- rep("b", nrow(test_data)) %>% factor(levels=c("a", "b"))
  predictions <- predict(mod, test_data)
  expect_equal(predictions, expected)
})
