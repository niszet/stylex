function(){
shd_val_list <-  c("clear", "solid", "pct5", "pct10", "pct12", "pct15", "pct20", "pct25", "pct30", "pct35", "pct37", "pct40", "pct45", "pct50", "pct55", "pct60", "pct62", "pct65", "pct70", "pct75", "pct80", "pct85", "pct87", "pct90", "pct95", "horzStripe", "vertStripe", "reverseDiagStripe", "diagStripe", "diagCross", "diagCross", "thinHorzStripe", "thinVertStripe", "thinReverseDiagStripe", "thinDiagStripe", "thinHorzCross", "thinDiagCross")

theme_color_name <- c("background1", "text1", "background2", "text2", "accent", "accent2", "accent3", "accent4", "accent5", "accent6")

# theme_tint <- c(NA, "33", "66", "99", NA, NA)

# theme_shade <- c(NA, NA, NA, NA, "BF", "80")

em_val <- c("dot")

u_val <- c("double")

is_hex <- function(color_code){
  stringr::str_detect(color_code, "^[0-9AaBbCcDdEeFf]{6}$")
}

# color_code_to_rgb
# function(){
# c(r, g, b)
# }
#

# sz value in ooxml is x2 times of pt in Word.
fontsize_to_pt <- function(sz){
  as.character(as.numeric(sz) / 2)
}

pt_to_fontsize <- function(pt){
  as.character(as.numeric(pt) * 2)
}


misc <- c("center", "both", "around", "text", "dashSmallGap", "auto")
}
