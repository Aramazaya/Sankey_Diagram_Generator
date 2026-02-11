test_that("prepare_sankey_data creates correct node structure", {
  data <- data.frame(
    source = c("A", "A", "B"),
    target = c("B", "C", "C"),
    value = c(10, 5, 8)
  )
  
  result <- prepare_sankey_data(data)
  
  expect_true(is.list(result))
  expect_true("nodes" %in% names(result))
  expect_true("links" %in% names(result))
  expect_equal(nrow(result$nodes), 3)
  expect_equal(nrow(result$links), 3)
})

test_that("prepare_sankey_data validates input", {
  invalid_data <- data.frame(
    from = c("A", "B"),
    to = c("C", "D"),
    amount = c(10, 20)
  )
  
  expect_error(prepare_sankey_data(invalid_data))
})

test_that("load_data_from_csv handles missing file", {
  expect_error(load_data_from_csv("nonexistent.csv"))
})
