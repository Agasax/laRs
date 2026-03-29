


#' Unorder ordered factor
#'
#' @param x Ordered factor
#'
#' @return Unordered factor
#' @export
#'
#' @examples as.unordered(ordered(c("a","a","b","c")))
as.unordered <-function(x){
  factor(x,ordered=FALSE)
}
