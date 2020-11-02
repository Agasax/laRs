tidynamer <- function(df) {
  df %>% dplyr::rename_with(.cols = matches("\\.\\d"), ~ paste0(gsub(".", "[", .x, fixed = TRUE), "]"))
}
