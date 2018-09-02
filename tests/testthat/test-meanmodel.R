context("test-meanmodel.R")

arr1 <- 1:10
arr2 <- c(arr1, NA)
arr3 <- c(-1, 1, 1, 1, 1, 1)
datasets <- list(arr1, arr2, arr3)
frame_types <- list(data.frame, data_frame, tibble)
formulas <- list(y ~ x, y ~ x + z, y ~ .)

test_that("basic mean examples work", {
  for(arr in datasets){
    for(frame in frame_types){
      for(formula in formulas){
        dataf <- frame(y = arr, x = 1:length(arr), z = 1)
        mod <- dummy_regressor(formula, data=dataf, strategy = "mean")
        test_data <- frame(x = 1:5, z= 1)
        expected <- rep(mean(arr, na.rm = TRUE), nrow(test_data))
        expect_equal(predict(mod, test_data), expected)
      }
    }
  }
})
