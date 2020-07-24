#' Utility functions realted to xml nodes.
#'
#' To get specific node by name, id and so on.
#'
#' @param style_xml
#' @param node_id
#'
#' @return
#' @export
#'
#' @examples
#'
#'
get_node_by_id <- function(style_xml, node_id){
  style_xml[xml2::xml_attr(style_xml, "styleId")==node_id]
}

get_node_by_name <- function(style_xml, name){
  style_xml[xml2::xml_attr(xml2::xml_child(style_xml, "w:name"), "val")==name]
}

get_name_by_id <- function(style_xml, style_id){
  xml2::xml_attr(xml2::xml_child(style_xml[xml2::xml_attr(style_xml, "styleId")==style_id], "w:name"), "val")
}

get_id_by_name <- function(style_xml, name){
  xml2::xml_attr(style_xml[xml2::xml_attr(xml2::xml_child(style_xml, "w:name"), "val")==name], "styleId")
}

