source("../fibonacci.R")
# テストケース
test_that("fibonacci function works correctly", {
  expect_equal(fibonacci(0), 0)
  expect_equal(fibonacci(1), 1)
  expect_equal(fibonacci(2), 1)
  expect_equal(fibonacci(3), 2)
  expect_equal(fibonacci(10), 55)
  expect_error(fibonacci(-1), "n must be non-negative")
})
