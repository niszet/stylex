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
  d = data.frame(
    stringsAsFactors = FALSE,
    type = xml2::xml_attr(style_xml, "type"),
    style_name_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:name"), "val"),
    styleId = xml2::xml_attr(style_xml, "styleId"),
    # custom_style = xml2::xml_attr(style_xml, "customStyle"),
    # default_style = xml2::xml_attr(style_xml, "default"),
    link_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:link"), "val"),
    basedOn_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:basedOn"), "val"),
    next_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:next"), "val"),
    uiPriority_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:uiPriority"), "val"),
    rsid_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:rsid"), "val"),
    unhideWhenUsed = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:unhideWhenUsed")), T, NA),
    qFormat = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:qFormat")), T, NA),
    autoRedefine = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:autoRedefine")), T, NA),

    semiHidden = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:semiHidden")), T, NA),

    pPr = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr")), T, NA),

    pPr_pBdr = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:pBdr")), T, NA),
    pPr_pBdr_top = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:top")), T, NA),
    pPr_pBdr_top_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:top"), "val"),
    pPr_pBdr_top_sz = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:top"), "sz"),
    pPr_pBdr_top_space = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:top"), "space"),
    pPr_pBdr_top_color = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:top"), "color"),
    pPr_pBdr_top_themeColor = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:top"), "themeColor"),
    pPr_pBdr_top_themeTint = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:top"), "themeTint"),
    pPr_pBdr_top_themeShade = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:top"), "themeShade"),

    pPr_pBdr_left = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:left")), T, NA),
    pPr_pBdr_left_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:left"), "val"),
    pPr_pBdr_left_sz = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:left"), "sz"),
    pPr_pBdr_left_space = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:left"), "space"),
    pPr_pBdr_left_color = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:left"), "color"),
    pPr_pBdr_left_themeColor = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:left"), "themeColor"),
    pPr_pBdr_left_themeTint = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:left"), "themeTint"),
    pPr_pBdr_left_themeShade = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:left"), "themeShade"),

    pPr_pBdr_right = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:right")), T, NA),
    pPr_pBdr_right_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:right"), "val"),
    pPr_pBdr_right_sz = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:right"), "sz"),
    pPr_pBdr_right_space = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:right"), "space"),
    pPr_pBdr_right_color = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:right"), "color"),
    pPr_pBdr_right_themeColor = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:right"), "themeColor"),
    pPr_pBdr_right_themeTint = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:right"), "themeTint"),
    pPr_pBdr_right_themeShade = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:right"), "themeShade"),

    pPr_pBdr_bottom = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:bottom")), T, NA),
    pPr_pBdr_bottom_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:bottom"), "val"),
    pPr_pBdr_bottom_sz = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:bottom"), "sz"),
    pPr_pBdr_bottom_space = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:bottom"), "space"),
    pPr_pBdr_bottom_color = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:bottom"), "color"),
    pPr_pBdr_bottom_themeColor = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:bottom"), "themeColor"),
    pPr_pBdr_bottom_themeTint = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:bottom"), "themeTint"),
    pPr_pBdr_bottom_themeShade = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:pBdr/w:bottom"), "themeShade"),

    p_shd = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:shd")), T, NA),
    p_shd_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:shd"), "val"),
    p_shd_color = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:shd"), "color"),
    p_shd_themeColor = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:shd"), "themeColor"),
    p_shd_themeTint = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:shd"), "themeTint"),
    p_shd_fill = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:shd"), "fill"),
    p_shd_themeFill = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:shd"), "themeFill"),
    p_shd_themeFillTint = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:shd"), "themeFillTint"),
    p_shd_themeFillShade = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:shd"), "themeFillShade"),

    p_spacing = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:spacing")), T, NA),
    p_spacing_beforeLines = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:spacing"), "beforeLines"),
    p_spacing_before = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:spacing"), "before"),
    p_spacing_after = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:spacing"), "after"),
    p_spacing_afterLines = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:spacing"), "afterLines"),
    p_spacing_line = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:spacing"), "line"),
    p_spacing_lineRule = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:spacing"), "lineRule"),

    p_ind = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:ind")), T, NA),
    p_ind_left = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:ind"), "left"),
    p_ind_leftChars = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:ind"), "leftChars"),
    p_ind_right = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:ind"), "right"),
    p_ind_rightChars = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:ind"), "rightChars"),
    p_ind_firstLine = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:ind"), "firstLine"),
    p_ind_firstLineChars = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:ind"), "firstLineChars"),

    p_contextualSpacing = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:contextualSpacing")), T, NA),

    p_jc = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:jc")), T, NA),
    p_jc_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:jc"), "val"),

    p_tabs = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:tabs")), T, NA),
    # TODO: cannot get all tab tags under the tabs tag.
    # p_tabs_val_1 = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:tabs")), , NA),
    # p_tabs_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:tabs"), "val"),
    # p_ind_right = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:tabs/w:tab"), "val"),
    #   <w:tab w:val="center" w:pos="4252" />
    #   <w:tab w:val="right" w:pos="8504" />
    p_snapToGrid = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:snapToGrid")), T, NA),

    p_frame = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:framePr")), T, NA),
    p_frame_wrap = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:framePr"), "wrap"),
    p_frame_vAnchor = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:framePr"), "vAnchor"),
    p_frame_hAnchor = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:framePr"), "hAnchor"),
    p_frame_y = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:framePr"), "y"),

    p_outlineLvl = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:outlineLvl")), T, NA),
    p_outlineLvl_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:outlineLvl"), "val"),

    p_keepNext = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:keepNext")), T, NA),
    p_keepLines = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:keepLines")), T, NA),

    p_wordWrap = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:pPr/w:wordWrap")), T, NA),
    p_wordWrap_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:pPr/w:wordWrap"), "val"),

    # ----- rpr
    rPr = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr")), T, NA),
    r_sz_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:sz"), "val"),
    r_szCs_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:szCs"), "val"),

    r_shd = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:shd")), T, NA),
    r_shd_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:shd"), "val"),
    r_shd_color = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:shd"), "color"),
    r_shd_fill = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:shd"), "fill"),

    r_vertAlign_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:vertAlign"), "val"),

    r_color_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:color"), "val"),
    r_color_themecolor = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:color"), "themeColor"),
    r_color_themeTint = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:color"), "themeTint"),

    r_bCs = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:bCs")), T, NA),
    r_i = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:i")), T, NA),
    r_iCs = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:iCs")), T, NA),
    r_b = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:b")), T, NA),

    r_caps = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:caps")), T, NA),
    r_strike = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:strike")), T, NA),
    r_emboss = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:emboss")), T, NA),

    r_smallCaps = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:smallCaps")), T, NA),
    r_dstrike = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:dstrike")), T, NA),
    r_imprint = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:imprint")), T, NA),

    r_outline = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:outline")), T, NA),
    r_shadow = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:shadow")), T, NA),
    r_vanish = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:vanish")), T, NA),

    r_u_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:u"), "val"),
    r_u_color = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:u"), "color"),
    r_em_val = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:em"), "val"),

    r_rFonts = dplyr::if_else(!is.na(xml2::xml_child(style_xml, "w:rPr/w:rFonts")), T, NA),
    r_rFonts_ascii = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:rFonts"), "ascii"),
    r_rFonts_hAnsi = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:rFonts"), "hAnsi"),
    r_rFonts_eastAsia = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:rFonts"), "eastAsia"),
    r_rFonts_cs = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:rFonts"), "cs"),


    r_rFonts_asciiTheme = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:rFonts"), "asciiTheme"),
    r_rFonts_eastAsiaTheme = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:rFonts"), "eastAsiaTheme"),
    r_rFonts_hAnsiTheme = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:rFonts"), "hAnsiTheme"),
    r_rFonts_cstheme = xml2::xml_attr(xml2::xml_child(style_xml, "w:rPr/w:rFonts"), "cstheme")
  )

  d <- janitor::clean_names(d)

  d
}
