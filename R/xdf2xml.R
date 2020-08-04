
update_xml <- function(style_tags, d_df, flags = c("update", "delete", "create")){

  # get ids to specify each row.
  for (row_name in d_df[["style_id"]]) {
    node <- get_node_by_id(style_tags, row_name)

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
      #if(!is.na(as.logical(val))){
      #  val <- as.logical(val)
      #}

      # colname to tag name
      tag <- ddd[ddd["name"]==col_name, "tag"]
      attr <- ddd[ddd["name"]==col_name, "attr"]

      # TODO: use dd

      # print(tag)
      # print(attr)
      set_node_x(node=node, val=val, tag=tag, attr=attr)
      #if(!is.null(h[[col_name]])){
      #  h[[col_name]](node, val)
      #}
    }

  }
  style_tags
}


diff_of_dfs <- function(ref_df, new_df){
  d_df <- dplyr::setdiff(new_df, ref_df)
  d_df
}
