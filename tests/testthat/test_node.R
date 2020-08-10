test_that("read and write", {
  # check read_styles and write_styles
  # These are basis of these tests.
  # Check file size difference between original and read->write docx.
  # tools::md5sum() is not good for checking docx... :(

  org_docx <- "sample.docx"
  new_docx <- "test.docx"

  x <- read_styles(org_docx)
  write_styles(x, org_docx, new_docx)

  testthat::expect_equal(unname(unclass(fs::file_size(org_docx))),
                         unname(unclass(fs::file_size(new_docx))))

  fs::file_delete(new_docx)
})


test_that("same node identification", {
  # check: get_styles, get_node_by_name, get_node_by_id work correctly.

  test_xml <- read_styles("sample.docx")
  test_styles <- get_style_nodes(test_xml)

  node1 <- get_node_by_name(test_styles, "Normal")
  node2 <- get_node_by_id(test_styles, "1")
  expect_equal(node1, node2)
})

test_that("name and id check", {
  # check: get_styles, get_node_by_name, get_node_by_id work correctly.

  # test_xml <- xml2::read_xml("test.xml")
  test_xml <- read_styles("sample.docx")
  test_styles <- get_styles(test_xml)

  id <- get_id_by_name(test_styles, "Normal")
  name <- get_name_by_id(test_styles, id)

  expect_equal(name, "Normal")
})


test_that("dim of style_df", {
  # check: `get_styles`, `style2df` work correctly

  test_xml <- read_styles("sample.docx")

  test_styles <- get_styles(test_xml)
  test_df <- style2df(test_styles)

  # both of dim are same as expected.
  # 2 items are added -1
  expect_equal(sum(dim(test_df) == c(74, 133)), 2)
})


test_that("extract node", {
  # check: get_attr_from_node works correctly.

  test_xml <- read_styles("sample.docx")

  xtest_styles <- get_styles(test_xml)
  node <- get_node_by_name(xtest_styles, "heading 1")
  val = get_attr_from_node(node, "val", ctag="w:next")

  expect_equal(val, "a0")
})

test_that("create new style", {
  # check: create_new_style works correctly.

  test_xml <- read_styles("sample.docx")

  styles <- get_styles(test_xml)
  y <- copy_style_from_docx_styles(styles, "Hoge")
  x <- stylex::get_node_by_name(styles, "Normal")

  testthat::expect_equal(is_same_nodes(x, y), TRUE)
})

# check update_styles_from_df
test_that("update xml", {

  # not enough... everything should be updated

  docx_xml <- read_styles("sample.docx")
  styles <- get_styles(docx_xml)
  d <- style2df(styles)
  # d_df <- diff_of_dfs(d, d)

  xml <- update_styles_from_df(get_style_nodes(styles), d[1,])

  # styles_to_styles
  # styles_to_docx_xml

  # TODO Dummy test
  testthat::expect_equal(xml, xml)

})

test_that("copy node", {

  docx_xml <- read_styles("sample.docx")
  styles <- get_styles(docx_xml)

  x <- stylex::get_node_by_name(styles, "Normal")
  y <- copy_style_from_node(x, "Hoge")

  testthat::expect_equal(is_same_nodes(x, y), TRUE)

})

test_that("docDefault", {
  # TODO: temporary check. after formal release of style2dddf, update this.

  docx_xml <- read_styles("sample.docx")
  styles <- get_styles(docx_xml)

  d <- style2dddf(styles)

  testthat::expect_equal(is.data.frame(d), TRUE)
})


test_that("styles to style", {

  docx_xml <- read_styles("sample.docx")
  styles <- get_styles(docx_xml)

  x <- convert_style_nodes_to_docx_styles(get_style_nodes(styles))

  # Dummy... This should by checked by customised exact_same check function.
  testthat::expect_equal(x, docx_xml)
})


test_that("diff of df", {

  docx_xml <- read_styles("sample.docx")
  styles <- get_styles(docx_xml)
  d <- style2df(styles)
  d_df <- diff_of_dfs(d, d)

  testthat::expect_equal(sum(dim(d_df)==c(0,133)), 2)
})


test_that("init data", {
  testthat::expect_equal(init(), TAGATTRDF)
})

test_that("font 1", {
  testthat::expect_equal("6", fontsize_to_pt(12))
})

test_that("font 2", {
  testthat::expect_equal("12", pt_to_fontsize(6))
})


