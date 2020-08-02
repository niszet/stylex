
get_style_tags <- function(styles){
  xml2::xml_find_all(styles, "w:style")
}

#' To get specific node by style_id
#'
#' @param style_xml xml2 node object of styles.
#' @param node_id style_id to get specific node.
#'
#' @return xml2 node object
#' @export
#'
#' @examples
#' \dontrun{
#'  get_node_by_id(xml, "Author")
#' }
#'
get_node_by_id <- function(style_xml, node_id){

  if(class(style_xml)=="xml_node"){
    style_xml <- get_style_tags(style_xml)
  }
  style_xml[xml2::xml_attr(style_xml, "styleId")==node_id]
}



#' To get specific node by style name
#'
#' @param style_xml xml2 node object of styles.
#' @param name style name to get specific node.
#'
#' @return xml2 node object
#' @export
#'
#' @examples
#' \dontrun{
#'  get_node_by_name(xml, "Author")
#' }

get_node_by_name <- function(style_xml, name){

  if(class(style_xml)=="xml_node"){
    style_xml <- get_style_tags(style_xml)
  }

  style_xml[xml2::xml_attr(xml2::xml_child(style_xml, "w:name"), "val")==name]
}

#' Get style name from style id
#'
#' @param style_xml xml2 node object of styles.
#' @param style_id style_id to get style name.
#'
#' @return style name
#' @export
#'
#' @examples
#' \dontrun{
#'  get_name_by_id(xml, "Author")
#' }
get_name_by_id <- function(style_xml, style_id){

  if(class(style_xml)=="xml_node"){
    style_xml <- get_style_tags(style_xml)
  }

  target_node <- style_xml[xml2::xml_attr(style_xml, "styleId")==style_id]
  xml2::xml_attr(xml2::xml_child(target_node, "w:name"), "val")
}

#' Get style id from style name
#'
#' @param style_xml xml2 node object of styles.
#' @param name style name to get style_id.
#'
#' @return style_id
#' @export
#'
#' @examples
#' \dontrun{
#'  get_id_by_name(xml, "Author")
#' }
get_id_by_name <- function(style_xml, name){

  if(class(style_xml)=="xml_node"){
    style_xml <- get_style_tags(style_xml)
  }

  xml2::xml_attr(style_xml[xml2::xml_attr(xml2::xml_child(style_xml, "w:name"), "val")==name], "styleId")
}
