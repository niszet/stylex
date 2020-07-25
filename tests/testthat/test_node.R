test_that("same node identification", {
  node1 <- get_node_by_name(test_styles, "Normal")
  node2 <- get_node_by_id(test_styles, "1")
  expect_equal(node1, node2)
})



