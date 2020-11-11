#' Given mu and value, solve for SD so that the tail area of the normal distribution beyond value is prob
#'
#' @param mu mean value
#' @param value value for tail area
#' @param prob probability of tail area
#'
#' @return
#' @export
#' @references http://hbiostat.org/doc/bbr.pdf
#' @examples norm_logit_solve(qlogis(0.05), qlogis(0.2), 0.1) # qlogis is R logit ()
norm_logit_solve <- function(mu, value, prob) {
  SD=(value - mu) / stats::qnorm(1 - prob)

  return( SD)
}
#' Beta distribution parameters from normal distribution mu and variance
#'
#' @param mu Mean for normal distribution
#' @param sd Standard deviation of normal distribution
#'
#' @return list of alpha and beta parameters for beta distribution
#' @export
#'
#' @examples normalbeta(0,1)
normalbeta <- function(mu, sd) {
  alpha0 <- ((1 - mu) / sd ^ 2 - 1 / mu) * mu ^ 2
  beta0 <- alpha0 * (1 / mu - 1)
  list(alpha0 = alpha0, beta0 = beta0)
}
