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
<<<<<<< HEAD


#' Exact solution for difference between two beta distribution
#'
#' @param alpha_a
#' @param beta_a
#' @param alpha_b
#' @param beta_b
#'
#' @return
#' @export
#' @references exact solution function, based on "Introduction to empirical Bayes", Robinson
#' @examples
h <- function(alpha_a, beta_a,
              alpha_b, beta_b) {
  j <- seq.int(0, round(alpha_b) - 1)
  log_vals <-
    (
      lbeta(alpha_a + j, beta_a + beta_b) - log(beta_b + j) -
        lbeta(1 + j, beta_b) - lbeta(alpha_a, beta_a)
    )
  1 - sum(exp(log_vals))
}
=======
>>>>>>> f5032a54627174b25a35e2152a8a8bff62a492e5
