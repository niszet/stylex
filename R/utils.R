


fontsize_to_pt <- function(sz){
  as.character(as.numeric(sz) / 2)
}

pt_to_fontsize <- function(pt){
  as.character(as.numeric(pt) * 2)
}

diff_of_dfs <- function(ref_df, new_df){
  d_df <- dplyr::setdiff(new_df, ref_df)
  d_df
}
