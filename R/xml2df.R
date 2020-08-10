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


#' Convert `docx_styles` object to data.frame
#'
#' Conversion from `docx_styles` to data.frame for modification usability.
#'
#'
#' @param docx_styles docx_styles object.
#'
#' @return data.frame converted from input xml.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' style2df(docx_styles)
#' }
#'
style2df <- function(docx_styles){

  style_xml <- get_style_nodes(docx_styles)

  cn <- TAGATTRDF[[1]]

  # support partial function
  f <- function(x) get_node_x(style_xml = style_xml, x)

  d <- as.data.frame(purrr::map(TAGATTRLIST, f))
  colnames(d) <- cn

  d <- purrr::map_df(d, as.character)

  d

}
