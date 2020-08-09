# TODO: rename to get_node. add document and export.
# this is NOT return a node. value of T/F or attribute.
get_node_x <- function(style_xml, tag_attr){
  tag <- tag_attr[1]
  attr <- tag_attr[2]

  if(is.na(attr)){
    # if(stringr::str_detect(tag, "/")) might not need.
    dplyr::if_else(!is.na(xml2::xml_child(style_xml, tag)), T, NA)
  }else{
    if(is.na(tag)){
      # style tag attr. type and so on
      xml2::xml_attr(style_xml, attr)
    }else{
      xml2::xml_attr(xml2::xml_child(style_xml, tag), attr)
    }
  }
}


#' Get style tags of xml_nodeset under style tag of xml_node object
#'
#' @param styles_xml xml_node object
#'
#' @return xml_nodeset object which contains style tags
get_style_nodes <- function(styles_xml){

  # TODO: should add docx_styles?
  if(any(class(styles_xml) %in% c("xml_node", "xml_document"))){
    xml2::xml_find_all(styles_xml, "w:style")
  }else{
    # TODO: should be NULL?
    styles_xml
  }

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
  # docx_styles and xml_document
  if(all(
        any(class(xml) %in% c("docx_styles")),
        any(class(xml) %in% c("xml_document"))
    )){
    xml2::xml_find_first(xml, "/w:styles")
  }else{
    xml
  }
}


#' To get specific node by style_id
#'
#' @param styles_xml xml2 node object of styles.
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
get_node_by_id <- function(styles_xml, node_id){

  styles_xml <- get_style_nodes(styles_xml)
  styles_xml[get_node_x(styles_xml, c(NA, "styleId"))==node_id]

}



#' To get specific node by style name
#'
#' @param styles_xml xml2 node object of styles.
#' @param name style name to get specific node.
#'
#' @return xml2 node object
#' @export
#'
#' @examples
#' \dontrun{
#'  get_node_by_name(xml, "Author")
#' }

get_node_by_name <- function(styles_xml, name){

  styles_xml <- get_style_nodes(styles_xml)
  styles_xml[get_node_x(styles_xml, c("w:name", "val"))==name]

}

#' Get style name from style id
#'
#' @param styles_xml xml2 node object of styles.
#' @param style_id style_id to get style name.
#'
#' @return style name
#' @export
#'
#' @examples
#' \dontrun{
#'  get_name_by_id(xml, "Author")
#' }
get_name_by_id <- function(styles_xml, style_id){

  styles_xml <- get_style_nodes(styles_xml)
  target_node <- get_node_by_id(styles_xml, style_id)

  get_node_x(target_node, c("w:name", "val"))

}

#' Get style id from style name
#'
#' @param styles_xml xml2 node object of styles.
#' @param name style name to get style_id.
#'
#' @return style_id
#' @export
#'
#' @examples
#' \dontrun{
#'  get_id_by_name(xml, "Author")
#' }
get_id_by_name <- function(styles_xml, name){

  styles_xml <- get_style_nodes(styles_xml)

  target_node <- get_node_by_name(styles_xml, name)
  xml2::xml_attr(target_node, "styleId")

}


#' Get attribution value from specified node
#'
#' @param node style tag as `xml_node`
#' @param attr attribution name as a character vector.
#' @param ctag child tag name as a character if needed.
#'
#' @return value of attribution
#' @export
#'
get_attr_from_node <- function(node, attr, ctag = NULL){

  if(!is.null(ctag)){
    node <- xml2::xml_child(node, ctag)
  }

  val = xml2::xml_attr(node, attr)
}


#' Check nodes are same except their id and name
#'
#' @param node1 xml_node which contains 1 style
#' @param node2 xml_node which contains 1 style
#'
#' @return True if same. Others False.
#' @export
is_same_nodes <- function(node1, node2){

  x <- dplyr::select(style2df(node1), -c("style_id", "name_val"))
  y <- dplyr::select(style2df(node2), -c("style_id", "name_val"))

  all.equal(y, y)

}


is_exact_same_node <- function(node1, node2){

  # same class
  #if(class(node1)!=class(node2)){
  #  return(F)
  #}

  # same attr

  # same children


}
