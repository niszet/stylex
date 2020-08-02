test_that("same node identification", {
  test_xml <- xml2::read_xml("test.xml")
  test_styles <- get_styles(test_xml)

  node1 <- get_node_by_name(test_styles, "Normal")
  node2 <- get_node_by_id(test_styles, "1")
  expect_equal(node1, node2)
})

test_that("dim of style_df", {
  test_xml <- xml2::read_xml("test.xml")
  test_styles <- get_styles(test_xml)
  test_df <- style2df(test_styles)

  # both of dim are same as expected.
  expect_equal(sum(dim(test_df) == c(74, 132)), 2)
})


test_that("extract node", {
  # xml2::write_xml(test_xml, "out.xml")

  xtest_xml <- xml2::read_xml("test.xml")
  xtest_styles <- get_styles(xtest_xml)
  node <- get_node_by_name(xtest_styles, "heading 1")
  val = xml2::xml_attr(xml2::xml_child(node, "w:next"), "val")

  expect_equal(val, "a0")
})

test_that("create new style", {
  # xml2::write_xml(test_xml, "out.xml")


  docx_xml <- xml2::read_xml("test.xml")
  styles <- get_styles(docx_xml)
  styles <- create_new_style(styles, "Hoge")
  x <- stylex::get_node_by_name(styles, "Normal")
  y <- stylex::get_node_by_name(styles, "Hoge")

  x <- dplyr::select(style2df(x), -c("style_id", "style_name_val"))
  y <- dplyr::select(style2df(y), -c("style_id", "style_name_val"))

  testthat::expect_equal(x, y)
})




