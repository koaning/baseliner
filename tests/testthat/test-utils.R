context("utils")

test_that("basic col_to_predict examples", {
  expect_equal(col_to_predict(y ~ x), "y")
  expect_equal(col_to_predict(y ~ x + y), "y")
  expect_equal(col_to_predict(y ~ x + y + 1), "y")
  expect_equal(col_to_predict(y ~ .), "y")
})
