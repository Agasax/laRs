#' Change the structure of cmdstan output to fit tidybayes
#'
#' @param df dataframe from cmdstanr to be tidyformed
#'
#'
#' @return data.frame
#' @export
#'
#' @examples
#' data(posterior)
#' posterior %>% tidynamer()
tidynamer <- function(df) {
  df %>% dplyr::rename_with(.cols = dplyr::matches("\\.\\d"), ~ paste0(gsub(".", "[", .x, fixed = TRUE), "]"))
}
