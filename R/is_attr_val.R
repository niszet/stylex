
is_theme_color <- function(val){
  theme_color_name <- c("background1", "text1", "background2", "text2", "accent", "accent2", "accent3", "accent4", "accent5", "accent6", NA)
  val %in% theme_color_name
}

is_rpr_shd_val <- function(val){
  shd_val_list <- c("clear", "solid", "pct5", "pct10", "pct12", "pct15", "pct20", "pct25", "pct30", "pct35", "pct37", "pct40", "pct45", "pct50", "pct55", "pct60", "pct62", "pct65", "pct70", "pct75", "pct80", "pct85", "pct87", "pct90", "pct95", "horzStripe", "vertStripe", "reverseDiagStripe", "diagStripe", "diagCross", "diagCross", "thinHorzStripe", "thinVertStripe", "thinReverseDiagStripe", "thinDiagStripe", "thinHorzCross", "thinDiagCross", NA)
  val %in% shd_val_list
}

is_theme_tint <- function(val){
  theme_tint <- c(NA, "33", "66", "99", NA, NA)
  val %in% theme_tint
}

is_theme_shade <- function(val){
  theme_shade <- c(NA, NA, NA, NA, "BF", "80")
  val %in% theme_shade
}

is_textbox_tightWrap <- function(val){
  tl <- c("allLines", "firstAndLastLine", "firstLineOnly", "lastLineOnly", NA)
  val %in% tl
}

is_widow_control <- function(val){
  tl <- c("pageBreakBefore", "suppressLineNumbers", "suppressAutoHyphens", NA)
  val %in% tl
}

is_text_alignment <- function(val){
  tl <- c("top","center", "baseline", "bottom", NA)
  val %in% tl
}

is_hex <- function(color_code){
  stringr::str_detect(color_code, "^[0-9AaBbCcDdEeFf]{6}$")
}

is_em_val <- function(val){
  em_val <- c("dot", NA)
  val %in% em_val
}

is_u_val <- function(val){
  # TODO add other options
  u_val <- c("words", "single", "double", "thick", "dotted", "dottedHeavy", "dash", "dashedHeavy", "dashLong", "dashLongHeavy", "dotDash", "dotDashHeavy", "dotDotDash", "dashDotDotHeavy", "wave", "wavyHeavy", "wavyDouble", NA)
  val %in% u_val
}

is_vert_align_val <- function(val){
  valign <- c("superscript", "subscript", NA)
  val %in% valign
}

is_spacing_linerule <- function(val){
  ll = c("auto", NA)
  val %in% ll
}

warn_if_not_valid_val <- function(val, node, attr){

  # print(stringr::str_c(node, "/", attr))
  if(is.null(is[[stringr::str_c(node, "/", attr)]])){
    return(NULL)
  }

  if(!is[[stringr::str_c(node, "/", attr)]](val)){
    warning(val, " is not a valid value for ", node)
  }
}




is <- new.env()
#is[["w:rPr/w:color"]] <- is_theme_color
is[["w:rPr/w:shd/val"]] <- is_rpr_shd_val
# is[["w:pPr/w:"]] <- is_theme_tint
# is[["w:pPr/w:"]] <- is_theme_shade
is[["w:pPr/w:textboxTightWrap/val"]] <- is_textbox_tightWrap
is[["w:pPr/w:widowControl/val"]] <- is_widow_control
is[["w:pPr/w:textAlignment/val"]] <- is_text_alignment
# is[["w:pPr/w:"]] <- is_hex
is[["w:rPr/w:em/val"]] <- is_em_val
is[["w:rPr/w:u/val"]] <- is_u_val
is[["w:rPr/w:vertAlign/val"]] <- is_vert_align_val
is[["w:pPr/w:spacing/lineRule"]] <- is_spacing_linerule



function(){

# color_code_to_rgb
# function(){
# c(r, g, b)
# }
#

# sz value in ooxml is x2 times of pt in Word.


misc <- c("center", "both", "around", "text", "dashSmallGap", "auto")
}
