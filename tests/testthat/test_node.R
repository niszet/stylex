test_that("same node identification", {
  node1 <- get_node_by_name(test_styles, "Normal")
  node2 <- get_node_by_id(test_styles, "1")
  expect_equal(node1, node2)
})


test_that("file out", {
  # xml2::write_xml(test_xml, "out.xml")

  xtest_xml <- xml2::read_xml("test.xml")
  xtest_styles <- get_style_tags(xtest_xml)
  node <- get_node_by_name(xtest_styles, "heading 1")
  val = xml2::xml_attr(xml2::xml_child(node, "w:next"), "val")

  expect_equal(val, "a0")
})


