# tag and attribute name list
TAGATTRLIST <- list(
  c(NA, "type"),
  c("w:name", "val"),
  c(NA, "styleId"),
  c(NA, "customStyle"),
  c(NA, "default"),
  c("w:link", "val"),
  c("w:basedOn", "val"),
  c("w:next", "val"),
  c("w:uiPriority", "val"),
  c("w:rsid", "val"),
  c("w:unhideWhenUsed", NA),
  c("w:qFormat",  NA),
  c("w:autoRedefine", NA),
  c("w:semiHidden", NA),

  c("w:pPr", NA),

  c("w:pPr/w:pBdr", NA),
  c("w:pPr/w:pBdr/w:top", NA),
  c("w:pPr/w:pBdr/w:top", "val"),
  c("w:pPr/w:pBdr/w:top", "sz"),
  c("w:pPr/w:pBdr/w:top", "space"),
  c("w:pPr/w:pBdr/w:top", "color"),
  c("w:pPr/w:pBdr/w:top", "themeColor"),
  c("w:pPr/w:pBdr/w:top", "themeTint"),
  c("w:pPr/w:pBdr/w:top", "themeShade"),

  c("w:pPr/w:pBdr/w:left", NA),
  c("w:pPr/w:pBdr/w:left", "val"),
  c("w:pPr/w:pBdr/w:left", "sz"),
  c("w:pPr/w:pBdr/w:left", "space"),
  c("w:pPr/w:pBdr/w:left", "color"),
  c("w:pPr/w:pBdr/w:left", "themeColor"),
  c("w:pPr/w:pBdr/w:left", "themeTint"),
  c("w:pPr/w:pBdr/w:left", "themeShade"),

  c("w:pPr/w:pBdr/w:right", NA),
  c("w:pPr/w:pBdr/w:right", "val"),
  c("w:pPr/w:pBdr/w:right", "sz"),
  c("w:pPr/w:pBdr/w:right", "space"),
  c("w:pPr/w:pBdr/w:right", "color"),
  c("w:pPr/w:pBdr/w:right", "themeColor"),
  c("w:pPr/w:pBdr/w:right", "themeTint"),
  c("w:pPr/w:pBdr/w:right", "themeShade"),

  c("w:pPr/w:pBdr/w:bottom", NA),
  c("w:pPr/w:pBdr/w:bottom", "val"),
  c("w:pPr/w:pBdr/w:bottom", "sz"),
  c("w:pPr/w:pBdr/w:bottom", "space"),
  c("w:pPr/w:pBdr/w:bottom", "color"),
  c("w:pPr/w:pBdr/w:bottom", "themeColor"),
  c("w:pPr/w:pBdr/w:bottom", "themeTint"),
  c("w:pPr/w:pBdr/w:bottom", "themeShade"),


  c("w:pPr/w:widowControl", "val"),
  c("w:pPr/w:textboxTightWrap", "val"),
  c("w:pPr/w:kinsoku", "val"),
  #  c("w:pPr/w:wordWrap", "val"), # duplicated...
  c("w:pPr/w:overflowPunct", "val"),
  c("w:pPr/w:topLinePunct", NA),
  c("w:pPr/w:autoSpaceDE", "val"),
  c("w:pPr/w:autoSpaceDN", "val"),
  c("w:pPr/w:textAlignment", "val"),

  c("w:pPr/w:shd", NA),
  c("w:pPr/w:shd", "val"),
  c("w:pPr/w:shd", "color"),
  c("w:pPr/w:shd", "themeColor"),
  c("w:pPr/w:shd", "themeTint"),
  c("w:pPr/w:shd", "fill"),
  c("w:pPr/w:shd", "themeFill"),
  c("w:pPr/w:shd", "themeFillTint"),
  c("w:pPr/w:shd", "themeFillShade"),

  c("w:pPr/w:spacing", NA),
  c("w:pPr/w:spacing", "beforeLines"),
  c("w:pPr/w:spacing", "before"),
  c("w:pPr/w:spacing", "after"),
  c("w:pPr/w:spacing", "afterLines"),
  c("w:pPr/w:spacing", "line"),
  c("w:pPr/w:spacing", "lineRule"),

  c("w:pPr/w:ind", NA),
  c("w:pPr/w:ind", "left"),
  c("w:pPr/w:ind", "leftChars"),
  c("w:pPr/w:ind", "right"),
  c("w:pPr/w:ind", "rightChars"),
  c("w:pPr/w:ind", "firstLine"),
  c("w:pPr/w:ind", "firstLineChars"),

  c("w:pPr/w:contextualSpacing", NA),

  c("w:pPr/w:jc", NA),
  c("w:pPr/w:jc", "val"),

  c("w:pPr/w:tabs", NA),
  # TODO: cannot get all tab tags under the tabs tag.
  # p_tabs_val_1 = "w:pPr/w:tabs")), , NA),
  # p_tabs_val = "w:pPr/w:tabs"), "val"),
  # p_ind_right = "w:pPr/w:tabs/w:tab"), "val"),
  #   <w:tab w:val="center" w:pos="4252" />
  #   <w:tab w:val="right" w:pos="8504" />
  c("w:pPr/w:snapToGrid", NA),

  c("w:pPr/w:framePr", NA),
  c("w:pPr/w:framePr", "wrap"),
  c("w:pPr/w:framePr", "vAnchor"),
  c("w:pPr/w:framePr", "hAnchor"),
  c("w:pPr/w:framePr", "y"),

  c("w:pPr/w:outlineLvl", NA),
  c("w:pPr/w:outlineLvl", "val"),

  c("w:pPr/w:keepNext", NA),
  c("w:pPr/w:keepLines", NA),

  c("w:pPr/w:wordWrap", NA),
  c("w:pPr/w:wordWrap", "val"),

  # ----- rpr
  c("w:rPr", NA),
  c("w:rPr/w:sz", "val"),
  c("w:rPr/w:szCs", "val"),

  c("w:rPr/w:shd", NA),
  c("w:rPr/w:shd", "val"),
  c("w:rPr/w:shd", "color"),
  c("w:rPr/w:shd", "fill"),

  c("w:rPr/w:vertAlign", "val"),

  c("w:rPr/w:color", "val"),
  c("w:rPr/w:color", "themeColor"),
  c("w:rPr/w:color", "themeTint"),

  c("w:rPr/w:bCs", NA),
  c("w:rPr/w:i", NA),
  c("w:rPr/w:iCs", NA),
  c("w:rPr/w:b", NA),

  c("w:rPr/w:caps", NA),
  c("w:rPr/w:strike", NA),
  c("w:rPr/w:emboss", NA),

  c("w:rPr/w:smallCaps", NA),
  c("w:rPr/w:dstrike", NA),
  c("w:rPr/w:imprint", NA),

  c("w:rPr/w:outline", NA),
  c("w:rPr/w:shadow", NA),
  c("w:rPr/w:vanish", NA),

  c("w:rPr/w:u", "val"),
  c("w:rPr/w:u", "color"),
  c("w:rPr/w:u", "themeColor"),
  c("w:rPr/w:u", "themeTint"),
  c("w:rPr/w:em", "val"),

  c("w:rPr/w:rFonts", NA),
  c("w:rPr/w:rFonts", "ascii"),
  c("w:rPr/w:rFonts", "hAnsi"),
  c("w:rPr/w:rFonts", "eastAsia"),
  c("w:rPr/w:rFonts", "cs"),

  c("w:rPr/w:rFonts", "asciiTheme"),
  c("w:rPr/w:rFonts", "eastAsiaTheme"),
  c("w:rPr/w:rFonts", "hAnsiTheme"),
  c("w:rPr/w:rFonts", "cstheme")
)


make_colname_from_tag_attr <- function(tag_attr){

  # this function is used in init(). DO NOT MOVE FROM HERE.
  discard_na <- function(x) x[!is.na(x)]

  # concat after removing "w:". And NA is ommited prior to concat.
  tag_attr <- discard_na(stringr::str_replace_all(tag_attr, "w:", ""))
  janitor::make_clean_names(stringr::str_c(tag_attr , collapse = "_"))
}

init <- function(){

  # make a colname by the list.
  cn <- unlist(purrr::map(TAGATTRLIST, make_colname_from_tag_attr))

  d <- data.frame(cn, t(data.frame(TAGATTRLIST)))
  rownames(d) <- NULL
  colnames(d) <- c("name","tag","attr")

  d
}

# tag and attribute as a data.frame. generated by init function.
TAGATTRDF <- init()
