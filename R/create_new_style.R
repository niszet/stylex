#' Create a new style to reference style based on existing style
#'
#' @param styles_xml `xml_node` object with `styles` at the root.
#' @param style_name new style name as a `character` vector.
#' @param ref_name referenced style name in the `xml` as a `character` vector. Default is `NULL`. It means `"Normal"` style.
#' @param style_id new style id. Unique id in docx is required. By default, it has unique id.
#'
#' @export
#'
#' @return new style as a `xml_node` object.
#'
new_style_from_styles <- function(styles_xml, style_name, ref_name = NULL, style_id = "auto"){

  style_xml <- get_style_tags(styles_xml)
  df <- style2df(style_xml)

  if(is.null(ref_name)){
    ref_name = "Normal"
  }

  # TODO: auto only?
  if(style_id == "auto"){
    style_id = gen_unique_id(get_style_ids(df))
  }

  stopifnot(is_unique_style_id(df, style_id))
  stopifnot(is_unique_style_name(df, style_name))

  x <- create_styles_root()

  node <- get_node_by_name(style_xml, ref_name)[[1]]

  add_style_to_styles(x, node)
  # xml2::xml_add_child(x, node)

  xml2::xml_set_attr(xml2::xml_child(x, "w:style"), "w:styleId", style_id)
  xml2::xml_set_attr(xml2::xml_child(x, "w:style/w:name"), "w:val", style_name)

  x <- xml2::xml_child(x)
  y <- xml2::xml_attrs(x)

  xml2::xml_attrs(x) <- NULL

  # Remove namespace related attribute.
  # TODO add test about it. Dependency of xml2 behaviour.
  # xml2::xml_attrs(x) <- y[!names(y) %in% "xmlns:w"]
  xml2::xml_attrs(x) <- y[-which(names(y) %in% "xmlns:w")]

  # xml2::xml_add_sibling(style_xml, x)
  # xml2::xml_add_child(xml, x)

  # style_xml
  # xml
  x

}


#' Make a style node from reference node
#'
#' @param style_node reference style node of `xml_node`
#' @param style_name name for new style
#'
#' @return new style node of `xml_node`
#' @export
#'
copy_style_node <- function(style_node, style_name){

  df <- style2df(style_node)

  if(class(style_node)=="xml_nodeset"){
    style_node <- style_node[[1]]
  }

  style_id = gen_unique_id(get_style_ids(df))

  stopifnot(is_unique_style_id(df, style_id))
  stopifnot(is_unique_style_name(df, style_name))

  x <- create_styles_root()

  add_style_to_styles(x, style_node)
  # xml2::xml_add_child(x, style_node)

  xml2::xml_set_attr(x, "w:styleId", style_id)
  xml2::xml_set_attr(xml2::xml_child(x, "w:name"), "w:val", style_name)

  x <- xml2::xml_child(x)
  y <- xml2::xml_attrs(x)

  xml2::xml_attrs(x) <- NULL

  # Remove namespace related attribute.
  # TODO add test about it. Dependency of xml2 behaviour.
  # xml2::xml_attrs(x) <- y[!names(y) %in% "xmlns:w"]
  xml2::xml_attrs(x) <- y[-which(names(y) %in% "xmlns:w")]

  x
}


new_style_from_df <- function(df){
  # data.frame only contains styles?

}

delete_style_from_styles <- function(styles_xml, style_name){

}


styles_to_styles <- function(style_nodes){
  # must be tested
  x <- create_styles_root()
  for(style in style_nodes){
    xml2::xml_add_child(x, style)
  }

  x
}


#' Extract only style tags and its children
#'
#' Peel off the `styles` tag from input `xml_node` object. `style` tags are contained under the `styles` tag.
#'
#' @param xml `xml_node` object with `styles` tag as a root. See `read_docx`.
#'
#' @return `xml_nodeset` object which contains style tags.
#' @export
#'
#' @examples
#' \dontrun{
#' get_styles(xml)
#' }
get_styles <- function(xml){
  xml2::xml_find_first(xml, "/w:styles")
}


add_style_to_styles <- function(styles_xml, style_node){
  stopifnot("xml_node" %in% class(styles_xml))
  stopifnot(class(style_node)=="xml_node")
  xml2::xml_add_child(styles_xml, style_node)
}



#' Internal function for making xml_node with style at the top
#'
#' @return xml_node with styles root.
#'
create_styles_root <- function(){
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

  x
}


get_style_names <- function(df){
  df[["name_val"]]
}

#' style id vector
#'
#' @param df styles data.frame
#'
#' @return character vector of style id in df.
#'
get_style_ids <- function(df){
  df[["style_id"]]
}

is_unique_style_id <- function(df, style_id){
  !style_id %in% get_style_ids(df)
}

is_unique_style_name <- function(df, style_name){
  !style_name %in% get_style_names(df)
}


#' Title
#'
#' @param ids style id character vector
#'
#' @return character of style id
#'
gen_unique_id <- function(ids){
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

