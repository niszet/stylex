
# prepare function table....
h <- new.env()
#h[["type"]] <- set_type
#h[["style_name_val"]] <- set_style_name_val
#h[["style_id"]] <- set_style_id
#h[["link_val"]] <- set_link_val
h[["based_on_val"]] <- set_based_on_val
h[["next_val"]] <- set_next_val
h[["ui_priority_val"]] <- set_ui_priority_val
h[["unhide_when_used"]] <- set_unhide_when_used
h[["q_format"]] <- set_q_format
h[["semi_hidden"]] <- set_semi_hidden
#h[["p_pr"]] <- set_p_pr

#h[["p_pr_p_bdr"]] <- set_p_pr_p_bdr
#h[["p_pr_p_bdr_top"]] <- set_p_pr_p_bdr_top
#h[["p_pr_p_bdr_top_val"]] <- set_p_pr_p_bdr_top_val
#h[["p_pr_p_bdr_top_sz"]] <- set_p_pr_p_bdr_top_sz
#h[["p_pr_p_bdr_top_space"]] <- set_p_pr_p_bdr_top_space
#h[["p_pr_p_bdr_top_color"]] <- set_p_pr_p_bdr_top_color
#h[["p_pr_p_bdr_top_theme_color"]] <- set_p_pr_p_bdr_top_theme_color
#h[["p_pr_p_bdr_top_theme_tint"]] <- set_p_pr_p_bdr_top_theme_tint
#h[["p_pr_p_bdr_top_theme_shade"]] <- set_p_pr_p_bdr_top_theme_shade
#h[["p_pr_p_bdr_left"]] <- set_p_pr_p_bdr_left
#h[["p_pr_p_bdr_left_val"]] <- set_p_pr_p_bdr_left_val
#h[["p_pr_p_bdr_left_sz"]] <- set_p_pr_p_bdr_left_sz
#h[["p_pr_p_bdr_left_space"]] <- set_p_pr_p_bdr_left_space
#h[["p_pr_p_bdr_left_color"]] <- set_p_pr_p_bdr_left_color
#h[["p_pr_p_bdr_left_theme_color"]] <- set_p_pr_p_bdr_left_theme_color
#h[["p_pr_p_bdr_left_theme_tint"]] <- set_p_pr_p_bdr_left_theme_tint
#h[["p_pr_p_bdr_left_theme_shade"]] <- set_p_pr_p_bdr_left_theme_shade
#h[["p_pr_p_bdr_right"]] <- set_p_pr_p_bdr_right
#h[["p_pr_p_bdr_right_val"]] <- set_p_pr_p_bdr_right_val
#h[["p_pr_p_bdr_right_sz"]] <- set_p_pr_p_bdr_right_sz
#h[["p_pr_p_bdr_right_space"]] <- set_p_pr_p_bdr_right_space
#h[["p_pr_p_bdr_right_color"]] <- set_p_pr_p_bdr_right_color
#h[["p_pr_p_bdr_right_theme_color"]] <- set_p_pr_p_bdr_right_theme_color
#h[["p_pr_p_bdr_right_theme_tint"]] <- set_p_pr_p_bdr_right_theme_tint
#h[["p_pr_p_bdr_right_theme_shade"]] <- set_p_pr_p_bdr_right_theme_shade
#h[["p_pr_p_bdr_bottom"]] <- set_p_pr_p_bdr_bottom
#h[["p_pr_p_bdr_bottom_val"]] <- set_p_pr_p_bdr_bottom_val
#h[["p_pr_p_bdr_bottom_sz"]] <- set_p_pr_p_bdr_bottom_sz
#h[["p_pr_p_bdr_bottom_space"]] <- set_p_pr_p_bdr_bottom_space
#h[["p_pr_p_bdr_bottom_color"]] <- set_p_pr_p_bdr_bottom_color
#h[["p_pr_p_bdr_bottom_theme_color"]] <- set_p_pr_p_bdr_bottom_theme_color
#h[["p_pr_p_bdr_bottom_theme_tint"]] <- set_p_pr_p_bdr_bottom_theme_tint
#h[["p_pr_p_bdr_bottom_theme_shade"]] <- set_p_pr_p_bdr_bottom_theme_shade

h[["p_shd"]] <- set_p_shd
h[["p_shd_val"]] <- set_p_shd_val
h[["p_shd_color"]] <- set_p_shd_color
h[["p_shd_theme_color"]] <- set_p_shd_theme_color
h[["p_shd_theme_tint"]] <- set_p_shd_theme_tint
h[["p_shd_fill"]] <- set_p_shd_fill
h[["p_shd_theme_fill"]] <- set_p_shd_theme_fill
h[["p_shd_theme_fill_tint"]] <- set_p_shd_theme_fill_tint
h[["p_shd_theme_fill_shade"]] <- set_p_shd_theme_fill_shade


h[["p_spacing"]] <- set_p_spacing
h[["p_spacing_before_lines"]] <- set_p_spacing_before_lines
h[["p_spacing_before"]] <- set_p_spacing_before
h[["p_spacing_after"]] <- set_p_spacing_after
h[["p_spacing_after_lines"]] <- set_p_spacing_after_lines
h[["p_spacing_line"]] <- set_p_spacing_line
h[["p_spacing_line_rule"]] <- set_p_spacing_line_rule
h[["p_ind"]] <- set_p_ind
h[["p_ind_left"]] <- set_p_ind_left
h[["p_ind_left_chars"]] <- set_p_ind_left_chars
h[["p_ind_right"]] <- set_p_ind_right
h[["p_ind_right_chars"]] <- set_p_ind_right_chars
h[["p_ind_first_line"]] <- set_p_ind_first_line
h[["p_ind_first_line_chars"]] <- set_p_ind_first_line_chars
h[["p_contextual_spacing"]] <- set_p_contextual_spacing

h[["p_jc"]] <- set_p_jc
h[["p_jc_val"]] <- set_p_jc_val
h[["p_tabs"]] <- set_p_tabs
h[["p_snap_to_grid"]] <- set_p_snap_to_grid
h[["p_frame"]] <- set_p_frame
h[["p_frame_wrap"]] <- set_p_frame_wrap
h[["p_frame_v_anchor"]] <- set_p_frame_v_anchor
h[["p_frame_h_anchor"]] <- set_p_frame_h_anchor
h[["p_frame_y"]] <- set_p_frame_y

h[["p_outline_lvl"]] <- set_p_outline_lvl
h[["p_outline_lvl_val"]] <- set_p_outline_lvl_val
h[["p_keep_next"]] <- set_p_keep_next
h[["p_keep_lines"]] <- set_p_keep_lines
h[["p_word_wrap"]] <- set_p_word_wrap
h[["p_word_wrap_val"]] <- set_p_word_wrap_val
h[["r_pr"]] <- set_r_pr
h[["r_sz_val"]] <- set_r_sz_val
h[["r_sz_cs_val"]] <- set_r_sz_cs_val

h[["r_shd"]] <- set_r_shd
h[["r_shd_val"]] <- set_r_shd_val
h[["r_shd_color"]] <- set_r_shd_color
h[["r_shd_fill"]] <- set_r_shd_fill
h[["r_vert_align_val"]] <- set_r_vert_align_val
h[["r_color_val"]] <- set_r_color_val
h[["r_color_themecolor"]] <- set_r_color_themecolor
h[["r_color_theme_tint"]] <- set_r_color_theme_tint
h[["r_b_cs"]] <- set_r_b_cs
h[["r_i"]] <- set_r_i
h[["r_i_cs"]] <- set_r_i_cs
h[["r_b"]] <- set_r_b
h[["r_caps"]] <- set_r_caps
h[["r_strike"]] <- set_r_strike
h[["r_emboss"]] <- set_r_emboss
h[["r_small_caps"]] <- set_r_small_caps
h[["r_dstrike"]] <- set_r_dstrike
h[["r_imprint"]] <- set_r_imprint
h[["r_outline"]] <- set_r_outline
h[["r_shadow"]] <- set_r_shadow
h[["r_vanish"]] <- set_r_vanish
h[["r_u_val"]] <- set_r_u_val
h[["r_u_color"]] <- set_r_u_color
h[["r_u_theme_color"]] <- set_r_u_theme_color
h[["r_u_theme_tint"]] <- set_r_u_theme_tint
h[["r_em_val"]] <- set_r_em_val

#h[["r_r_fonts"]] <- set_r_r_fonts
#h[["r_r_fonts_ascii"]] <- set_r_r_fonts_ascii
#h[["r_r_fonts_h_ansi"]] <- set_r_r_fonts_h_ansi
#h[["r_r_fonts_east_asia"]] <- set_r_r_fonts_east_asia
#h[["r_r_fonts_cs"]] <- set_r_r_fonts_cs
#h[["r_r_fonts_ascii_theme"]] <- set_r_r_fonts_ascii_theme
#h[["r_r_fonts_east_asia_theme"]] <- set_r_r_fonts_east_asia_theme
#h[["r_r_fonts_h_ansi_theme"]] <- set_r_r_fonts_h_ansi_theme
#h[["r_r_fonts_cstheme"]] <- set_r_r_fonts_cstheme


#' Update xml file based on reference.docx and data.frame.
#'
#' @param docx_file reference.docx file which has original styles.
#' @param df data.frame which contains updated value. Note that all updated values are updated.
#'
#' @return Updated style xml node object.
#' @export
#'
#' @examples
#' \dontrun{
#' update_xml("reference.docx", df)
#' }
#'
update_xml <- function(docx_file, df){
  xml <- read_style_xml(docx_file)
  style_xml <- get_style_tags(xml)
  org_df <- style2df(style_xml)
  d_df <- dplyr::setdiff(df, org_df)

  for (x in d_df[["style_id"]]) {
    node <- get_node_by_id(style_xml, x)
    for(col in colnames(d_df)){
      val <- d_df[d_df["style_id"]==x, col]
      # print(col)
      if(!is.null(h[[col]])){
        h[[col]](node, val)
      }
    }
  }
  xml
}
