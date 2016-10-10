x <- c(1, 2, 3, 4, 5)
y <- c(1, 2, 3, 4, NA)
z <- c(TRUE, FALSE, TRUE)
w <- letters[1:5]

source("../functions/range-value.R")
source("../functions/missing-values.R")

context("Test for range value")
test_that("range works as expected", {
	expect_equal(range_value(x), 4)
	expect_length(range_value(x), 1)
	expect_type(range_value(x), "double")
})

test_that("range works for NA values", {
	expect_length(range_value(y), 1)
	expect_true(is.na(range_value(y)))
	expect_length(range_value(y, TRUE), 1)
	expect_false(is.na(range_value(y, TRUE)))
})

test_that("range works for logical values", {
	expect_length(range_value(z), 1)
	expect_type(range_value(z), "integer")
	expect_identical(range_value(z), 1L)
})

test_that("range doesn't work for character values", {
	expect_error(range_value(w))
})

context("Test for missing values function")
test_that("output is of length one",{
	expect_length(missing_values(x), 1)
	expect_length(missing_values(y), 1)
	expect_length(missing_values(z), 1)
	expect_length(missing_values(w), 1)
})

test_that("output is of type double", {
	expect_type(missing_values(x), "integer")
	expect_type(missing_values(y), "integer")
	expect_type(missing_values(z), "integer")
	expect_type(missing_values(w), "integer")
})

test_that("output is greater than or equal to zero", {
	expect_true(missing_values(x) >= 0)
	expect_true(missing_values(y) >= 0)
	expect_true(missing_values(z) >= 0)
	expect_true(missing_values(w) >= 0)
})

