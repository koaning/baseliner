context("utils")

test_that("basic col_to_predict examples", {
  expect_equal(col_to_predict(y ~ x), "y")
  expect_equal(col_to_predict(y ~ x + y), "y")
  expect_equal(col_to_predict(y ~ x + y + 1), "y")
  expect_equal(col_to_predict(y ~ .), "y")
})

test_that("extra basic col_to_predict examples", {
  expect_equal(col_to_predict(foo ~ x), "foo")
  expect_equal(col_to_predict(buzz ~ x + y), "buzz")
  expect_equal(col_to_predict(blah ~ x + y + 1), "blah")
  expect_equal(col_to_predict(moongo ~ .), "moongo")
})
