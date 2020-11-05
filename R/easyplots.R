
#' Distplot
#'
#' @param .data dataframe to plot
#' @param x value
#' @param y group
#' @param ul upper limit
#' @param ll lower limit
#' @param ... Additional parameters
#'
#' @return A grouped tidybayes halfeye plot coloured according to value
#' @export
#'
#' @examples
#' \donttest{
#' library(tidyverse)
#'
#' df <- tibble(a = rnorm(1e4, 0, 1), b = rnorm(1e4, 0.25, 1)) %>%
#'   pivot_longer(cols = everything(), names_to = "y", values_to = "x")
#' df %>% distplot(x = x, y = y, ul = 0.1, ll = -0.1)
#' }
distplot <- function(.data, x, y, ul = 0, ll = 0, ...) {
  .data %>% ggplot2::ggplot(ggplot2::aes(x = {{ x }}, y = {{ y }}, fill = ggplot2::after_stat(ifelse(x > ul, "over", ifelse(x < ll, "under", "no difference"))))) +
    tidybayes::stat_halfeye() +
    ggplot2::scale_fill_manual(values = c("over" = "skyblue", "no difference" = "lightgrey", "under" = "pink")) +
    tidybayes::theme_tidybayes() +
    ggplot2::theme(legend.position = "none")
}
