
set_node_x <- function(node, val, tag, attr){
  if(is.na(attr)){
    set_exist_tag(node, val, tag)
  }else{
    set_attr_val(node, val, tag, attr)
  }
}

# TODO check correct???
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
    warning(tag, " : parent tag is missing")
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
  attr_wo_w <- stringr::str_replace(
    string = attr, pattern = "w:", replacement = "")

  if(!ext_parent_tag(node, tag)){
    warning(tag, " : parent tag is missing")
    return(NULL) # TODO: NULL is OK?
  }

  warn_if_not_valid_val(val, tag, attr)

  if(is.na(xml2::xml_child(node, tag))){
    warning(stringr::str_c(tag, " is missing. ", val, "is not set to ", attr))
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


# --------
# followings will be removed.

set_based_on_val <- function(node, val){
  tag = "w:basedOn"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_next_val <- function(node, val){
  tag = "w:next"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_ui_priority_val <- function(node, val){
  tag = "w:uiPriority"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_unhide_when_used <- function(node, val){
  tag = "w:unhideWhenUsed"
  set_exist_tag(node, val, tag)
}

set_q_format <- function(node, val){
  tag = "w:qFormat"
  set_exist_tag(node, val, tag)
}

# w:autoRedefine

set_semi_hidden <- function(node, val){
  tag = "w:semiHidden"
  set_exist_tag(node, val, tag)
}

set_p_shd <- function(node, val){
  tag = "w:pPr/w:shd"
  set_exist_tag(node, val, tag)
}

set_p_shd_val <- function(node, val){
  tag = "w:pPr/w:shd"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_p_shd_color <- function(node, val){
  tag = "w:pPr/w:shd"
  attr = "w:color"
  set_attr_val(node, val, tag, attr)
}

set_p_shd_theme_color <- function(node, val){
  tag = "w:pPr/w:shd"
  attr = "w:themeColor"
  set_attr_val(node, val, tag, attr)
}

set_p_shd_theme_tint <- function(node, val){
  tag = "w:pPr/w:shd"
  attr = "w:themeTint"
  set_attr_val(node, val, tag, attr)
}

set_p_shd_fill <- function(node, val){
  tag = "w:pPr/w:shd"
  attr = "w:fill"
  set_attr_val(node, val, tag, attr)
}

set_p_shd_theme_fill <- function(node, val){
  tag = "w:pPr/w:shd"
  attr = "w:themeFill"
  set_attr_val(node, val, tag, attr)
}

set_p_shd_theme_fill_tint <- function(node, val){

  tag = "w:pPr/w:shd"
  attr = "w:themeFillTint"
  set_attr_val(node, val, tag, attr)
}

set_p_shd_theme_fill_shade <- function(node, val){
  tag = "w:pPr/w:shd"
  attr = "w:themeFillShade"
  set_attr_val(node, val, tag, attr)
}


set_p_spacing <- function(node, val){
  tag = "w:pPr/w:spacing"
  set_exist_tag(node, val, tag)
}

set_p_spacing_before_lines <- function(node, val){
  tag = "w:pPr/w:spacing"
  attr = "w:beforeLines"
  set_attr_val(node, val, tag, attr)
}

set_p_spacing_before <- function(node, val){
  tag = "w:pPr/w:spacing"
  attr = "w:before"
  set_attr_val(node, val, tag, attr)
}

set_p_spacing_after <- function(node, val){
  tag = "w:pPr/w:spacing"
  attr = "w:after"
  set_attr_val(node, val, tag, attr)
}

set_p_spacing_after_lines <- function(node, val){
  tag = "w:pPr/w:spacing"
  attr = "w:afterLines"
  set_attr_val(node, val, tag, attr)
}

set_p_spacing_line <- function(node, val){
  tag = "w:pPr/w:spacing"
  attr = "w:line"
  set_attr_val(node, val, tag, attr)
}

set_p_spacing_line_rule <- function(node, val){
  tag = "w:pPr/w:spacing"
  attr = "w:lineRule"
  set_attr_val(node, val, tag, attr)
}


set_p_ind <- function(node, val){
  tag = "w:pPr/w:ind"
  set_exist_tag(node, val, tag)
}

set_p_ind_left <- function(node, val){
  tag = "w:pPr/w:ind"
  attr = "w:left"
  set_attr_val(node, val, tag, attr)
}

set_p_ind_left_chars <- function(node, val){
  tag = "w:pPr/w:ind"
  attr = "w:leftChars"
  set_attr_val(node, val, tag, attr)
}

set_p_ind_right <- function(node, val){
  tag = "w:pPr/w:ind"
  attr = "w:right"
  set_attr_val(node, val, tag, attr)
}

set_p_ind_right_chars <- function(node, val){
  tag = "w:pPr/w:ind"
  attr = "w:rightChars"
  set_attr_val(node, val, tag, attr)
}

set_p_ind_first_line <- function(node, val){
  tag = "w:pPr/w:ind"
  attr = "w:firstLine"
  set_attr_val(node, val, tag, attr)
}

set_p_ind_first_line_chars <- function(node, val){
  tag = "w:pPr/w:ind"
  attr = "w:firstLineChars"
  set_attr_val(node, val, tag, attr)
}

set_p_contextual_spacing <- function(node, val){
  tag = "w:pPr/w:contextualSpacing"
  set_exist_tag(node, val, tag)
}

set_p_jc <- function(node, val){
  tag = "w:pPr/w:jc"
  set_exist_tag(node, val, tag)
}

set_p_jc_val <- function(node, val){
  tag = "w:pPr/w:jc"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_p_tabs <- function(node, val){
  tag = "w:pPr/w:tabs"
  set_exist_tag(node, val, tag)
}

set_p_snap_to_grid <- function(node, val){
  tag = "w:pPr/w:snapToGrid"
  set_exist_tag(node, val, tag)
}

set_p_frame <- function(node, val){
  tag = "w:pPr/w:framePr"
  set_exist_tag(node, val, tag)
}

set_p_frame_wrap <- function(node, val){
  tag = "w:pPr/w:framePr"
  attr = "w:wrap"
  set_attr_val(node, val, tag, attr)
}

set_p_frame_v_anchor <- function(node, val){
  tag = "w:pPr/w:framePr"
  attr = "w:vAnchor"
  set_attr_val(node, val, tag, attr)
}

set_p_frame_h_anchor <- function(node, val){
  tag = "w:pPr/w:framePr"
  attr = "w:hAnchor"
  set_attr_val(node, val, tag, attr)
}

set_p_frame_y <- function(node, val){
  tag = "w:pPr/w:framePr"
  attr = "w:y"
  set_attr_val(node, val, tag, attr)
}

set_p_outline_lvl <- function(node, val){
  tag = "w:pPr/w:outlineLvl"
  set_exist_tag(node, val, tag)
}

set_p_outline_lvl_val <- function(node, val){
  tag = "w:pPr/w:outlineLvl"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_p_keep_next <- function(node, val){
  tag = "w:pPr/w:keepNext"
  set_exist_tag(node, val, tag)
}

set_p_keep_lines <- function(node, val){
  tag = "w:pPr/w:keepLines"
  set_exist_tag(node, val, tag)
}

set_p_word_wrap <- function(node, val){
  tag = "w:pPr/w:wordWrap"
  set_exist_tag(node, val, tag)
}

set_p_word_wrap_val <- function(node, val){
  tag = "w:pPr/w:wordWrap"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_p_widow_control_val <- function(node, val){
  tag = "w:pPr/w:widowControl"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}


set_p_textbox_tight_wrap_val <- function(node, val){
  tag = "w:pPr/w:textboxTightWrap"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_p_kinsoku_val <- function(node, val){
  tag = "w:pPr/w:kinsoku"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_p_word_wrap_val <- function(node, val){
  tag = "w:pPr/w:wordWrap"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_p_overflow_punct_val <- function(node, val){
  tag = "w:pPr/w:overflowPunct"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_p_top_line_punct <- function(node, val){
  tag = "w:pPr/w:topLinePunct"
  set_exist_tag(node, val, tag)
}

set_p_auto_space_de_val <- function(node, val){
  tag = "w:pPr/w:autoSpaceDE"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_p_auto_space_dn_val <- function(node, val){
  tag = "w:pPr/w:autoSpaceDN"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_p_text_alignment_val <- function(node, val){
  tag = "w:pPr/w:textAlignment"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}


# --- rPr ---
set_r_pr <- function(node, val){
  tag = "w:pPr/w:keepLines"
  set_exist_tag(node, val, tag)
}

set_r_sz_val <- function(node, val){
  tag = "w:rPr/w:sz"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_r_sz_cs_val <- function(node, val){
  tag = "w:rPr/w:szCs"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_r_shd <- function(node, val){
  tag = "w:rPr/w:shd"
  set_exist_tag(node, val, tag)
}

set_r_shd_val <- function(node, val){
  tag = "w:rPr/w:shd"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_r_shd_color <- function(node, val){
  tag = "w:rPr/w:shd"
  attr = "w:color"
  set_attr_val(node, val, tag, attr)
}

set_r_shd_fill <- function(node, val){
  tag = "w:rPr/w:shd"
  attr = "w:fill"
  set_attr_val(node, val, tag, attr)
}



set_r_color_val <- function(node, val){
  tag = "w:rPr/w:color"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_r_color_themecolor <- function(node, val){
  tag = "w:rPr/w:color"
  attr = "w:themeColor"
  set_attr_val(node, val, tag, attr)
}

set_r_color_theme_tint <- function(node, val){
  tag = "w:rPr/w:color"
  attr = "w:themeTint"
  set_attr_val(node, val, tag, attr)
}

# ---

set_r_b <- function(node, val){
  tag = "w:rPr/w:b"
  set_exist_tag(node, val, tag)
}

set_r_i <- function(node, val){
  tag = "w:rPr/w:i"
  set_exist_tag(node, val, tag)
}

set_r_i_cs <- function(node, val){
  tag = "w:rPr/w:iCs"
  set_exist_tag(node, val, tag)
}

set_r_b_cs <- function(node, val){
  tag = "w:rPr/w:bCs"
  set_exist_tag(node, val, tag)
}

set_r_caps <- function(node, val){
  tag = "w:rPr/w:caps"
  set_exist_tag(node, val, tag)
}

set_r_strike <- function(node, val){
  tag = "w:rPr/w:strike"
  set_exist_tag(node, val, tag)
}

set_r_emboss <- function(node, val){
  tag = "w:rPr/w:emboss"
  set_exist_tag(node, val, tag)
}

set_r_small_caps <- function(node, val){
  tag = "w:rPr/w:smallCaps"
  set_exist_tag(node, val, tag)
}

set_r_dstrike <- function(node, val){
  tag = "w:rPr/w:dstrike"
  set_exist_tag(node, val, tag)
}

set_r_imprint <- function(node, val){
  tag = "w:rPr/w:imprint"
  set_exist_tag(node, val, tag)
}

set_r_outline <- function(node, val){
  tag = "w:rPr/w:outline"
  set_exist_tag(node, val, tag)
}

set_r_shadow <- function(node, val){
  tag = "w:rPr/w:shadow"
  set_exist_tag(node, val, tag)
}

set_r_vanish <- function(node, val){
  tag = "w:rPr/w:vanish"
  set_exist_tag(node, val, tag)
}

set_r_u_val <- function(node, val){
  tag = "w:rPr/w:u"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_r_u_color <- function(node, val){
  tag = "w:rPr/w:u"
  attr = "w:color"
  set_attr_val(node, val, tag, attr)
}

set_r_u_theme_color <- function(node, val){
  tag = "w:rPr/w:u"
  attr = "w:themeColor"
  set_attr_val(node, val, tag, attr)
}

set_r_u_theme_tint <- function(node, val){
  tag = "w:rPr/w:u"
  attr = "w:themeTint"
  set_attr_val(node, val, tag, attr)
}

set_r_em_val <- function(node, val){
  tag = "w:rPr/w:em"
  attr = "w:val"
  set_attr_val(node, val, tag, attr)
}

set_r_vert_align_val <- function(node, val){
  tag = "w:rPr/w:vertAlign"
  attr = "w:val"

  set_attr_val(node, val, tag, attr)
}

