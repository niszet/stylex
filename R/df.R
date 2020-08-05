

get_style_names <- function(df){
  df[["name_val"]]
}

#' style id vector
#'
#' @param df styles data.frame
#'
#' @return character vector of style id in df.
#'
get_style_ids <- function(df){
  df[["style_id"]]
}

is_unique_style_id <- function(df, style_id){
  !style_id %in% get_style_ids(df)
}

is_unique_style_name <- function(df, style_name){
  !style_name %in% get_style_names(df)
}


new_style_from_df <- function(df){
  # data.frame only contains styles?

}
