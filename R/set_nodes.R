# TODO: add flags of create/delete/update
# good word for attr/val...?
set_node_x <- function(node, val, tag, attr){

  if(is.na(attr)){
    set_exist_tag(node, val, tag)
  }else{
    set_attr_val(node, val, tag, attr)
  }
}


#' set existence to target tag
#'
#' @param node xml single style node
#' @param val set value. non-NA or NA.
#' @param ptag parent tag
#' @param ctag child tag
#'
#' @return xml style node object after modification
#'
set_exist_tag_pc <- function(node, val, ptag, ctag){
  sep <- "/"

  if(!is.na(xml2::xml_child(node, stringr::str_c(ptag, sep, ctag)))){
    if(is.na(val)){
      xml2::xml_remove(xml2::xml_child(node, stringr::str_c(ptag, sep, ctag)))
    }
  }else{
    if(!is.na(val)){
      xml2::xml_add_child(xml2::xml_child(node, ptag), ctag)
    }
  }
}

#' set existence to target tag w/o child tag.
#'
#' @param node xml single style node
#' @param val set value. NA or non-NA.
#' @param tag target tag
#'
#' @return updated single xml style tag.
#'
set_exist_tag_wo_ctag <- function(node, val, tag){
  if(!is.na(val)){
    if(is.na(xml2::xml_child(node, tag))){
      xml2::xml_add_child(node, tag)
    }
  }else{
    if(!is.na(xml2::xml_child(node, tag))){
      xml2::xml_remove(xml2::xml_child(node, tag))
    }
  }
}



set_exist_tag <- function(node, val, tag){

  # TODO actually needed??
  if(!ext_parent_tag(node, tag)){
    ## warning(tag, " : parent tag is missing")
    return(NULL) # NULL is OK?
  }

  if(stringr::str_detect(tag, "/")){
    tags <- stringr::str_split(tag, "/")[[1]]
    set_exist_tag_pc(node, val, tags[1], tags[2])
  }else{
    set_exist_tag_wo_ctag(node, val, tag)
  }

}


#' Common function to update attr by val
#'
#' @param node xml2 node style object.
#' @param val value for update.
#' @param tag tag under the node.
#' @param attr attribute name with "w:" prefix.
#'
#' @return None
#'
set_attr_val <- function(node, val, tag, attr){
  # xml2 needs w: in xml_set_attr. but not need in xml_attr...

  if(is.na(tag)){
    return(xml2::xml_set_attr(node, attr, val))
  }

  attr_wo_w <- stringr::str_replace(
    string = attr, pattern = "w:", replacement = "")

  if(!ext_parent_tag(node, tag)){
    ## warning(tag, " : parent tag is missing")
    return(NULL) # TODO: NULL is OK?
  }

  warn_if_not_valid_val(val, tag, attr)

  if(is.na(xml2::xml_child(node, tag))){
    ## warning(stringr::str_c(tag, " is missing. ", val, "is not set to ", attr))
  }else{
    if(!is.na(xml2::xml_attr(xml2::xml_child(node, tag), attr_wo_w))){
      message(stringr::str_c(
        attr, " has already a value ",
        xml2::xml_attr(xml2::xml_child(node, tag), attr_wo_w),
        " and will be overwitten."))
    }
    xml2::xml_set_attr(xml2::xml_child(node, tag), attr, val)
  }
}

#' Existence check of parent of tag
#'
#' @param node xml node/node_set object of style
#' @param tag tag under the node
#'
#' @return
#' TRUE : if parent tag exist or no parent tag.
#' FALSE : if parent tag does not exist.
ext_parent_tag <- function(node, tag){
  # TODO: pattern should be precise? (like \S+/\S+ ?)
  if(stringr::str_detect(string = tag, pattern = "/")){
    tags <- stringr::str_split(tag, "/")[[1]]
    !is.na(xml2::xml_child(node, tags[1]))
  }else{
    TRUE
  }
}

