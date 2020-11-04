#' Change the structure of cmdstan output to fit tidybayes
#'
#' @param df dataframe from cmdstanr to be tidyformed
#'
#'
#' @return data.frame
#' @export
#'
#' @examples
#' x <- 1
tidynamer <- function(df) {
  df %>% dplyr::rename_with(.cols = dplyr::matches("\\.\\d"), ~ paste0(gsub(".", "[", .x, fixed = TRUE), "]"))
}
