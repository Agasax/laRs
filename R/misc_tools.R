


#' Snip carbonate, pretty twitter code
#' https://twitter.com/jeremy_data/status/1371171913578520587
#' @return
#' @export
#'
#'
snip <- function() {snap <- purrr::compose(
  ~my_code$browse(),
  ~assign("my_code",carbonate::carbon$new(),pos=".GlobalEnv"),

)
snap()
}


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
