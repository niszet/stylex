test_that("same node identification", {
  # check: get_styles, get_node_by_name, get_node_by_id work correctly.

  test_xml <- xml2::read_xml("test.xml")
  test_styles <- get_styles(test_xml)

  node1 <- get_node_by_name(test_styles, "Normal")
  node2 <- get_node_by_id(test_styles, "1")
  expect_equal(node1, node2)
})

test_that("name and id check", {
  # check: get_styles, get_node_by_name, get_node_by_id work correctly.

  test_xml <- xml2::read_xml("test.xml")
  test_styles <- get_styles(test_xml)

  # node1 <- get_node_by_name(test_styles, "Normal")
  id <- get_id_by_name(test_styles, "Normal")
  name <- get_name_by_id(test_styles, id)

  expect_equal(name, "Normal")
})


test_that("dim of style_df", {
  # check: `get_styles`, `style2df` work correctly

  test_xml <- xml2::read_xml("test.xml")
  test_styles <- get_styles(test_xml)
  test_df <- style2df(test_styles)

  # both of dim are same as expected.
  expect_equal(sum(dim(test_df) == c(74, 132)), 2)
})


test_that("extract node", {
  # check: get_attr_from_node works correctly.

  xtest_xml <- xml2::read_xml("test.xml")
  xtest_styles <- get_styles(xtest_xml)
  node <- get_node_by_name(xtest_styles, "heading 1")
  # val = xml2::xml_attr(xml2::xml_child(node, "w:next"), "val")
  val = get_attr_from_node(node, "val", ctag="w:next")

  expect_equal(val, "a0")
})

test_that("create new style", {
  # check: create_new_style works correctly.

  docx_xml <- xml2::read_xml("test.xml")
  styles <- get_styles(docx_xml)
  y <- create_new_style(styles, "Hoge")
  x <- stylex::get_node_by_name(styles, "Normal")

  testthat::expect_equal(is_same_nodes(x, y), TRUE)
})

# check write_docx
# xml2::write_xml(test_xml, "out.xml")

# check update_xml

