


is_theme_color <- function(color){
  # TODO NA is needed?
  theme_color_name <- c("background1", "text1", "background2", "text2", "accent", "accent2", "accent3", "accent4", "accent5", "accent6", NA)
  color %in% theme_color_name
}

is_rpr_shd_val <- function(shd){
  # TODO NA is needed?
  shd_val_list <- c("clear", "solid", "pct5", "pct10", "pct12", "pct15", "pct20", "pct25", "pct30", "pct35", "pct37", "pct40", "pct45", "pct50", "pct55", "pct60", "pct62", "pct65", "pct70", "pct75", "pct80", "pct85", "pct87", "pct90", "pct95", "horzStripe", "vertStripe", "reverseDiagStripe", "diagStripe", "diagCross", "diagCross", "thinHorzStripe", "thinVertStripe", "thinReverseDiagStripe", "thinDiagStripe", "thinHorzCross", "thinDiagCross", NA)
  shd %in% shd_val_list

}

is_theme_tint <- function(tt){
  theme_tint <- c(NA, "33", "66", "99", NA, NA)
  tt %in% theme_tint
}

is_theme_shade <- function(tt){
  theme_shade <- c(NA, NA, NA, NA, "BF", "80")
  tt %in% theme_shade
}

is_textbox_tightWrap <- function(tt){
  tl <- c("allLines", "firstAndLastLine", "firstLineOnly", "lastLineOnly", NA)
  tt %in% tl
}

is_widow_control <- function(tt){
  tl <- c("pageBreakBefore", "suppressLineNumbers", "suppressAutoHyphens", NA)
  tt %in% tl
}

is_text_alignment <- function(tt){
  tl <- c("top","center", "baseline", "bottom", NA)
  tt %in% tl
}

is_hex <- function(color_code){
  stringr::str_detect(color_code, "^[0-9AaBbCcDdEeFf]{6}$")
}

is_em_val <- function(em){
  em_val <- c("dot", NA)
  em %in% em_val
}

is_u_val <- function(u){
  # TODO add other options
  u_val <- c("words", "single", "double", "thick", "dotted", "dottedHeavy", "dash", "dashedHeavy", "dashLong", "dashLongHeavy", "dotDash", "dotDashHeavy", "dotDotDash", "dashDotDotHeavy", "wave", "wavyHeavy", "wavyDouble", NA)
  u %in% u_val
}

is_vert_align_val <- function(v){
  valign <- c("superscript", "subscript", NA)
  v %in% valign
}

is_spacing_linerule <- function(sp){
  ll = c("auto", NA)
  sp %in% ll
}


fontsize_to_pt <- function(sz){
  as.character(as.numeric(sz) / 2)
}

pt_to_fontsize <- function(pt){
  as.character(as.numeric(pt) * 2)
}


warn_if_not_valid_val <- function(val, node){
  if(is.null(is[[node]])){
    return(NULL)
  }

  if(!is[[node]](val)){
    warning(val, " is not a valid value for ", node)
  }
}




is <- new.env()
# is[["w:pPr/w:"]] <- is_theme_color
# is[["w:pPr/w:"]] <- is_rpr_shd_val
# is[["w:pPr/w:"]] <- is_theme_tint
# is[["w:pPr/w:"]] <- is_theme_shade
is[["w:pPr/w:textboxTightWrap"]] <- is_textbox_tightWrap
is[["w:pPr/w:widowControl"]] <- is_widow_control
# is[["w:pPr/w:"]] <- is_text_alignment
# is[["w:pPr/w:"]] <- is_hex
is[["w:rPr/w:em"]] <- is_em_val
# is[["w:pPr/w:"]] <- is_u_val
 is[["w:rPr/w:vertAlign"]] <- is_vert_align_val
# is[["w:pPr/w:"]] <- is_spacing_linerule



function(){

# color_code_to_rgb
# function(){
# c(r, g, b)
# }
#

# sz value in ooxml is x2 times of pt in Word.


misc <- c("center", "both", "around", "text", "dashSmallGap", "auto")
}
