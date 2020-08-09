#' Make a new style copied from referenced style in docx_styles
#'
#' @param docx_styles `docx_styles` object with `styles` at its root.
#' @param new_style_name new style name as a `character` vector.
#' @param ref_style_name referenced style name in the `xml` as a `character` vector. Default is `NULL`. It means `"Normal"` style.
#' @param style_id new style id. Unique id in docx is required. By default, it is set by unique id.
#'
#' @export
#'
#' @return new style as a `xml_node` object.
#'
copy_style_from_docx_styles <-
  function(docx_styles, new_style_name,
           ref_style_name = NULL, style_id = "auto"){

  style_nodes <- get_style_nodes(docx_styles)

  df <- style2df(style_nodes)
  stopifnot(is_unique_style_id(df, style_id))
  stopifnot(is_unique_style_name(df, new_style_name))

  if(is.null(ref_style_name)){
    ref_style_name = "Normal"
  }

  # TODO: auto only?
  if(style_id == "auto"){
    style_id = create_unique_id(get_style_ids(df))
  }

  node <- get_node_by_name(style_nodes, ref_style_name)[[1]]

  return(copy_style_from_node(node, new_style_name))

}


#' Make a style node from reference node
#'
#' @param style_node reference style node of `xml_node`
#' @param new_style_name name for new style
#'
#' @return new style node of `xml_node`
#' @export
#'
copy_style_from_node <- function(style_node, new_style_name){

  df <- style2df(style_node)

  if(class(style_node)=="xml_nodeset"){
    style_node <- style_node[[1]]
  }

  style_id = create_unique_id(get_style_ids(df))

  stopifnot(is_unique_style_id(df, style_id))
  stopifnot(is_unique_style_name(df, new_style_name))

  x <- create_docx_styles_root()

  add_style_to_styles(x, style_node)

  # ???
  xml2::xml_set_attr(x, "w:styleId", style_id)
  xml2::xml_set_attr(xml2::xml_child(x, "w:name"), "w:val",
                     new_style_name)

  x <- xml2::xml_child(x)
  y <- xml2::xml_attrs(x)

  xml2::xml_attrs(x) <- NULL

  # Remove namespace related attribute.
  # TODO add test about it. Dependency of xml2 behaviour.
  xml2::xml_attrs(x) <- y[!names(y) %in% "xmlns:w"]

  x
}

delete_style_from_styles <- function(styles_xml, style_name){

}

# convert_style_tags_to_styles_tag
# to docx_styles ?
convert_style_nodes_to_docx_styles <- function(style_nodes){
  # must be tested
  x <- create_docx_styles_root()
  for(style in style_nodes){
    xml2::xml_add_child(x, style)
  }

  x
}

#' Add style_node to docx_styles as a child node
#'
#' @param docx_styles `docx_styles` object. (both `xml_node` and `xml_document` are OK)
#' @param style_node `xml_node` of style.
#'
#' @return `docx_styles` updated by argument style_node as its child.
#' @export
#'
add_style_to_styles <- function(docx_styles, style_node){
  stopifnot("docx_styles" %in% class(docx_styles))
  stopifnot(class(style_node)=="xml_node")
  xml2::xml_add_child(docx_styles, style_node)
}


#' Create root of `docx_styles` object.
#'
#' @export
#' @return `docx_styles` object which has `styles` as a root.
#'
create_docx_styles_root <- function(){
  x <- xml2::xml_new_root(
    "styles",
    "Ignorable"="w14 w15 w16se w16cid w16 w16cex",
    "xmlns:mc"="http://schemas.openxmlformats.org/markup-compatibility/2006",
    "xmlns:r"="http://schemas.openxmlformats.org/officeDocument/2006/relationships",
    "xmlns:w"="http://schemas.openxmlformats.org/wordprocessingml/2006/main",
    "xmlns:w14"="http://schemas.microsoft.com/office/word/2010/wordml",
    "xmlns:w15"="http://schemas.microsoft.com/office/word/2012/wordml",
    "xmlns:w16cex"="http://schemas.microsoft.com/office/word/2018/wordml/cex",
    "xmlns:w16cid"="http://schemas.microsoft.com/office/word/2016/wordml/cid",
    "xmlns:w16"="http://schemas.microsoft.com/office/word/2018/wordml",
    "xmlns:w16se"="http://schemas.microsoft.com/office/word/2015/wordml/symex"
  )

  class(x) <- c("docx_styles", class(x))

  x
}


#' Generate unique style id
#'
#' @param ids style IDs as a character vector
#'
#' @return character value of style id
#'
create_unique_id <- function(ids){
  # z\d+ is a naming rule
  x <- readr::parse_number(
    utils::tail(
      sort(ids[stringr::str_detect(ids, "z\\d*")]),
      n=1))

  # x + 1
  if(length(x)==0 || is.na(x) || is.null(x)){
    x = 0
  }
  stringr::str_c("z", x+1)
}

