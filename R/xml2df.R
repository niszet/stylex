#' Style_xml to data.frame for docDefaults part.
#'
#' `docDefaults` part in the docx file are separated from main function.
#'
#' @param style_xml xml_nodeset of docx which contains only style tags.
#'
#' @return data.frame contains docDefaults parts.
#'
style2dddf <- function(style_xml){

  style_xml <- xml2::xml_find_all(style_xml, "w:style")

  d = data.frame(
    stringsAsFactors = FALSE,
    docDefaults = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:docDefaults")), T, NA),
    rPrDefault = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:docDefaults/w:rPrDefault")), T, NA),
    rPrDefault_rPr = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:docDefaults/w:rPrDefault/w:rPr")), T, NA),

    rPrDefault_rPr_rFonts_asciiTheme =
      xml2::xml_attr(xml2::xml_child(
        style_xml, "w:docDefaults/w:rPrDefault/w:rPr/w:rFonts"), "asciiTheme"),
    rPrDefault_rPr_rFonts_eastAsiaTheme =
      xml2::xml_attr(xml2::xml_child(
        style_xml, "w:docDefaults/w:rPrDefault/w:rPr/w:rFonts"), "eastAsiaTheme"),
    rPrDefault_rPr_rFonts_hAnsiTheme =
      xml2::xml_attr(xml2::xml_child(
        style_xml, "w:docDefaults/w:rPrDefault/w:rPr/w:rFonts"), "hAnsiTheme"),
    rPrDefault_rPr_rFonts_cstheme =
      xml2::xml_attr(xml2::xml_child(
        style_xml, "w:docDefaults/w:rPrDefault/w:rPr/w:rFonts"), "cstheme"),
    rPrDefault_rPr_sz_val =
      xml2::xml_attr(xml2::xml_child(
        style_xml, "w:docDefaults/w:rPrDefault/w:rPr/w:sz"), "val"),
    rPrDefault_rPr_szCs_val =
      xml2::xml_attr(xml2::xml_child(
        style_xml, "w:docDefaults/w:rPrDefault/w:rPr/w:szCs"), "val"),
    rPrDefault_rPr_lang_val =
      xml2::xml_attr(xml2::xml_child(
        style_xml, "w:docDefaults/w:rPrDefault/w:rPr/w:lang"), "val"),
    rPrDefault_rPr_lang_val =
      xml2::xml_attr(xml2::xml_child(
        style_xml, "w:docDefaults/w:rPrDefault/w:rPr/w:lang"), "eastAsia"),
    rPrDefault_rPr_lang_val =
      xml2::xml_attr(xml2::xml_child(
        style_xml, "w:docDefaults/w:rPrDefault/w:rPr/w:lang"), "bidi"),

    pPrDefault =
      dplyr::if_else(!is.na(xml2::xml_child(
        style_xml, "w:docDefaults/w:pPrDefault")), T, NA),
    pPrDefault_pPr =
      dplyr::if_else(!is.na(xml2::xml_child(
        style_xml, "w:docDefaults/w:pPrDefault/w:pPr")), T, NA),
    pPrDefault_p_spacing =
      dplyr::if_else(!is.na(xml2::xml_child(
        style_xml, "w:docDefaults/w:pPrDefault/w:spacing")), T, NA),
    pPrDefault_p_spacing_after =
      xml2::xml_attr(xml2::xml_child(
        style_xml, "w:docDefaults/w:pPrDefault/w:spacing"), "after")
  )

  d <- janitor::clean_names(d)
  d
}


make_df_colname <- function(vals){

  discard_na <- function(x) x[!is.na(x)]
  discard_na(c(1, NA))

  # vals <- c("w:pPr/w:pBdr/w:top", "val")
  vals <- discard_na(stringr::str_replace_all(vals, "w:", ""))
  janitor::make_clean_names(stringr::str_c(vals , collapse = "_"))
}

dd <- list(
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

init <- function(){

  x <- stylex:::dd

  # make a colname by the list.
  cn <- unlist(purrr::map(x, make_df_colname))

  d <- data.frame(cn, t(data.frame(x)))
  rownames(d) <- NULL
  colnames(d) <- c("name","tag","attr")

  d
}


#' Convert xml object to data.frame
#'
#' Convertion from xml to data.frame for modification usability.
#'
#'
#' @param style_xml A node oject of xml2. It expexts output of `read_style_xml()`.
#'
#' @return data.frame converted from input xml.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' style2df(style_xml)
#' }
#'
style2df <- function(style_xml){

  style_xml <- xml2::xml_find_all(style_xml, "w:style")

  x <- stylex:::dd

  cn <- init()[[1]]

  f <- function(x) get_node_x(style_xml = style_xml, x)

  d <- as.data.frame(purrr::map(x, f))
  colnames(d) <- cn

  d <- purrr::map_df(d, as.character)

  d

}
