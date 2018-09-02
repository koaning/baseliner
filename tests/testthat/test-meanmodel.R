context("test-meanmodel.R")

arr1 <- 1:10
arr2 <- c(arr1, NA)
arr3 <- c(-1, 1, 1, 1, 1, 1)
datasets <- list(arr1, arr2, arr3)

test_that("basic mean examples work", {
  for(arr in list(arr1, arr2, arr3)){
    for(frame in list(data.frame, data_frame, tibble)){
      dataf <- frame(arr = arr, x = 1:length(arr))
      mod <- dummy_regressor(arr ~ x, data=dataf, strategy = "mean")
      test_data <- data.frame(x = rep(0, 5))
      expected <- rep(mean(arr, na.rm = TRUE), 5)
      expect_equal(predict(mod, test_data), expected)
    }
  }
})

test_that("basic mean examples work with ~ . in the formula", {
  for(arr in list(arr1, arr2, arr3)){
    for(frame in list(data.frame, data_frame, tibble)){
      dataf <- frame(arr = arr, x = 1:length(arr))
      output <- mean(arr, na.rm = TRUE)
      mod <- dummy_regressor(arr ~ ., data=dataf, strategy = "mean")
      test_data <- data.frame(x = rep(0, 5))
      pred <- predict(mod, test_data)
      expect_equal(pred, rep(output, 5))
    }
  }
})
