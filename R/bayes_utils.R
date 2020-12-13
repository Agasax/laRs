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



#' Closed form solution for difference between two beta distribution
#'
#' @param event_a number of events in group a
#' @param n_a size group a
#' @param event_b number of events in group b
#' @param n_b size group b
#' @param prior prior for beta distribution, either 'uniform','jeffrey' or 'emprirical'
#' @param sample size of samples
#' @importFrom stats rbeta
#' @return
#' @export
#' @references exact solution function, based on https://www.evanmiller.org/bayesian-ab-testing.html#binary_ab
#' @examples beta_diff(10,11,1,11)
beta_diff <- function(event_a, n_a,
              event_b, n_b, prior=c("uniform","jeffrey","empirical","half_empirical"),sample=NULL) {
  if(is.character(prior)){
    prior <- match.arg(prior)
  }
  if (prior=="uniform") {
    alpha_a <- event_a+1
    beta_a <-n_a-event_a +1
    alpha_b <-event_b+1
    beta_b <-n_b-event_b +1
  } else if (prior=="jeffrey") {
    alpha_a <- event_a+.5
    beta_a <-n_a-event_a +.5
    alpha_b <-event_b+.5
    beta_b <-n_b-event_b +.5
  } else if (prior=="empirical") {
    p_alpha <- event_a+event_b
    p_beta <- n_a+n_b-event_a-event_b
    alpha_a <- event_a + p_alpha
    beta_a <-n_a-event_a + p_beta
    alpha_b <-event_b+p_alpha
    beta_b <-n_b-event_b +p_beta

  } else if (prior=="half_empirical") {
    p_alpha <- (event_a+event_b)/2
    p_beta <- (n_a+n_b-event_a-event_b)/2
    alpha_a <- event_a + p_alpha
    beta_a <-n_a-event_a + p_beta
    alpha_b <-event_b+p_alpha
    beta_b <-n_b-event_b +p_beta

  } else {

    alpha_a <- event_a
    beta_a <-n_a-event_a
    alpha_b <-event_b
    beta_b <-n_b-event_b
  }
  j <- seq.int(0, round(alpha_b) - 1)
  log_vals <-
    (
      lbeta(alpha_a + j, beta_a + beta_b) - log(beta_b + j) -
        lbeta(1 + j, beta_b) - lbeta(alpha_a, beta_a)
    )
  exact.prob<- 1 - sum(exp(log_vals))
  if (is.numeric(sample)) {
    post.samples <- rbeta(sample,alpha_a,beta_a)-rbeta(sample,alpha_b,beta_b)

  } else{posterior_diff <- NULL}
  return(structure(list(exact.prob=exact.prob,post.samples=post.samples),
                   class=c("laRs","beta_diff")))


}

