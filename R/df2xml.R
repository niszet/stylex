#' update styles from given data.frame
#'
#' @param style_nodes `docx_styles` node object
#' @param d_df data.frame as update value list.
#' @param flags update/delete/create flags.
#'
#' @return updated stylex
#' @export
#'
update_styles_from_df <- function(style_nodes, d_df, flags = c("update", "delete", "create")){

  # TODO: solve warning...

  # get ids to specify each row.
  for (row_name in d_df[["style_id"]]) {
    node <- get_node_by_id(style_nodes, row_name)

    for(col_name in colnames(d_df)){

      # get value
      # 1x1 tibble ...
      val <- unlist(d_df[d_df["style_id"]==row_name, col_name])

      # print(is.na(val))

      # TODO "NA" is NA... ummm
      if(!is.na(val)){
        if(is.character(val)){
          if(val == "NA"){
            val <- NA
          }else if(val %in% c("T", "True", "TRUE")){
            val <- T
          }
        }
      }

      # colname to tag name
      tag <- TAGATTRDF[TAGATTRDF["name"]==col_name, "tag"]
      attr <- TAGATTRDF[TAGATTRDF["name"]==col_name, "attr"]

      set_node_tagattr(node=node, val=val, tag=tag, attr=attr)

    }

  }
  style_nodes
}

