#' Cohen's kappa
#'
#' @param x An n*n matrix/contingency table
#' @param weights A character string specifying "linear" or "quadratic" weights, or a numeric matrix of n*n weights.
#'
#' @return An object of type "kappa"
#' @export
#'
#' @examples
#' x <- matrix(c(106, 10,4,22,28, 10,2, 12,  6),ncol=3,byrow=TRUE)
#' kappa(x,weights="quadratic")
#'
#'
cohenkappa <- function(x,weights=c("linear","quadratic")) {
  cl <- match.call()
  if (!is.matrix(x)||(ncol(x)!=nrow(x))) stop("Require n*n matrix")

  if(is.character(weights)) {
    weights <- match.arg(weights)
  }
  OA <- diag(x)
  n <- sum(x)
  Po <- sum(OA)/n
  nc <- ncol(x)
  colFrq <- colSums(x)/n
  rowFrq <- rowSums(x)/n
  Pe <- crossprod(colFrq,rowFrq)[1]

  W <- if (is.matrix(weights)){weights}
  else if (weights=="linear")  {1 - abs(outer(1:nc, 1:nc, "-"))/(nc - 1)}
  else if (weights=="quadratic")  {1 - (abs(outer(1:nc, 1:nc, "-"))/(nc - 1))^2}
  else {stop('Valid arguments for Weight are "linear", "quadratic" or an n*n matrix of weights')}
  Pow <- sum(W*x)/n
  Pew <- sum(W*colFrq%o%rowFrq)

  kappa  <- function(Po,Pe) {(Po-Pe)/(1-Pe)

  }
  max_kappa <- function(x) {
    sum(pmin(rowSums(x)/n,colSums(x)/n))
  }

  k <- kappa(Po,Pe)
  kmax <- max_kappa(x)
  kr <- k/kmax
  kw <- kappa(Pow,Pew)
  kw_max <- max_kappa(W*x)
  kwr <- kw/kw_max

  y=structure(list(unweighted=c(kappa=k,kappa_max=kmax,kappa_ratio=kr),weighted=c(kappa=kw,kappa_max=kw_max,kappa_ratio=kwr),Weights=W,n=n,Call=cl), class=c("laRs","cohenkappa"))
  return(y)

}
