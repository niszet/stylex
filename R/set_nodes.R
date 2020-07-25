#' set existence to target tag
#'
#' @param node xml single style node
#' @param val set value. non-NA or NA.
#' @param ptag parent tag
#' @param ctag child tag
#'
#' @return xml style node object after modification
#'
set_exist_tag <- function(node, val, ptag, ctag){
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
    xml2::xml_add_child(node, tag)
  }else{
    xml2::xml_remove(node, tag)
  }
}


set_next_val <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:next"), "val", val)
}

set_ui_priority_val <- function(node, val){
  xml2::xml_attr(xml2::xml_child(node, "w:uiPriority"), "val", val)
}

set_unhide_when_used <- function(node, val){
  tag = "w:unhideWhenUsed"
  set_exist_tag_wo_ctag(node, val, tag)
}

set_q_format <- function(node, val){
  tag = "w:qFormat"
  set_exist_tag_wo_ctag(node, val, tag)
}

# w:autoRedefine

set_semi_hidden <- function(node, val){
  tag = "w:semiHidden"
  set_exist_tag_wo_ctag(node, val, tag)
}

set_based_on_val <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:basedOn"), "val", val)
}





set_r_sz_val <- function(node, val){
  sz <- xml2::xml_child(node, "w:rPr/w:sz")
  xml2::xml_set_attr(sz, "w:val", val)
}

set_r_color_themecolor <- function(node, val){
  color <- xml2::xml_child(node, "w:rPr/w:color")
  xml2::xml_set_attr(color, "w:themeColor", val)
}

set_r_color_val <- function(node, val){
  color <- xml2::xml_child(node, "w:rPr/w:color")
  xml2::xml_set_attr(color, "w:val", val)
}

set_r_b <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:b"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_i <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:i"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_i_cs <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:iCs"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_b_cs <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:bCs"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_caps <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:caps"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_strike <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:strike"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_emboss <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:emboss"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_small_caps <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:smallCaps"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_dstrike <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:dstrike"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_imprint <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:imprint"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_outline <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:outline"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_shadow <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:shadow"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_vanish <- function(node, val){
  ptag = "w:rPr"
  ctag = "w:vanish"
  set_exist_tag(node, val, ptag, ctag)
}

set_r_vert_align_val <- function(node, val){
  # add check?
  xml2::xml_set_attr(xml2::xml_child(node, "w:rPr/w:vertAlign"), "val", val)
}

set_p_ind <- function(node, val){
  # p_ind = dplyr::if_else(!is.na(xml2::xml_child(style_all, "w:pPr/w:ind")), T, NA),
}

set_p_ind_left <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:ind"), "left", val)
}

set_p_ind_left_chars <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:ind"), "leftChars", val)
}

set_p_ind_right <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:ind"), "right", val)
}

set_p_ind_right_chars <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:ind"), "rightChars", val)
}

set_p_ind_first_line <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:ind"), "firstLine", val)
}

set_p_ind_first_line_chars <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:ind"), "firstLineChars", val)
}

set_p_shd <- function(node, val){
  # TBD
}

set_p_shd_val <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:shd"), "val", val)
}

set_p_shd_color <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:shd"), "color", val)
}

set_p_shd_theme_color <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:shd"), "themeColor", val)
}

set_p_shd_theme_tint <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:shd"), "themeTint", val)
}

set_p_shd_fill <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:shd"), "fill", val)
}

set_p_shd_theme_fill <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:shd"), "themeFill", val)
}

set_p_shd_theme_fill_tint <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:shd"), "themeFillTint", val)
}

set_p_shd_theme_fill_shade <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:shd"), "themeFillShade", val)
}


set_p_spacing <- function(node, val){
  # TBD
  # p_spacing = dplyr::if_else(!is.na(xml2::xml_child(style_all, "w:pPr/w:spacing")), T, NA),
}

set_p_spacing_before_lines <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:spacing"), "beforeLines", val)
}

set_p_spacing_before <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:spacing"), "w:before", val)
}

set_p_spacing_after <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:spacing"), "w:after", val)
}

set_p_spacing_after_lines <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:spacing"), "afterLines", val)
}

set_p_spacing_line <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:spacing"), "line", val)
}

set_p_spacing_line_rule <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:pPr/w:spacing"), "lineRule", val)
}


# --- rPr ---

set_r_shd <- function(node, val){
  # TBD
  # r_shd = dplyr::if_else(!is.na(xml2::xml_child(style_all, "w:rPr/w:shd")), T, NA),
}

set_r_shd_val <- function(node, val){
  xml2::xml_attr(xml2::xml_child(node, "w:rPr/w:shd"), "val", val)
}

set_r_shd_color <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:rPr/w:shd"), "color", val)
}

set_r_shd_fill <- function(node, val){
  xml2::xml_set_attr(xml2::xml_child(node, "w:rPr/w:shd"), "fill", val)
}
