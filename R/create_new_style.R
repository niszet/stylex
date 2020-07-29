#' Create new style from reference style
#'
#' @param df style data.frame
#' @param style_name style name
#' @param ref_style_name  reference style's name
#' @param style_id new style id.
#'
#' @return new style by column?
#'
create_new_style <- function(df, style_name, ref_style_name = NULL, style_id = "auto"){

  if(is.null(ref_style_name)){
    ref_style_name = "Normal"
  }

  # TODO: auto only?
  if(style_id == "auto"){
    style_id = gen_unique_id(get_style_ids(df))
  }

  stopifnot(is_unique_style_id(df, style_id))
  stopifnot(is_unique_style_name(df, style_name))

  # TODO: return what?

}

get_style_names <- function(df){
  df[["style_name_val"]]
}

get_style_ids <- function(df){
  df[["style_id"]]
}

is_unique_style_id <- function(df, style_id){
  !style_id %in% get_style_ids(df)
}

is_unique_style_name <- function(df, style_name){
  !style_name %in% get_style_names(df)
}


gen_unique_id <- function(ids){
  # z\d+ is a naming rule
  x <- readr::parse_number(utils::tail(sort(ids[stringr::str_detect(ids, "z\\d+")]), n=1))
  # x + 1
  stringr::str_c("z", x+1)
}

