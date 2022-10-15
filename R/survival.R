

#' Weibull mean
#'
#' @param scale The scale parameter for the Weibull distribution
#' @param shape The shape parameter for the Weibull distribution
#'
#' @return Mean for the weibull distribution
#' @export
#'
#' @examples
#' weibull_mean(1200,0.5)
#'
weibull_mean <- function(scale,shape) { scale*gamma(1+1/shape)

}

#' Weibull median
#'
#' @param scale The scale parameter for the Weibull distribution
#' @param shape The shape parameter for the Weibull distribution
#'
#' @return Median for the Weibull distribution
#' @export
#'
#' @examples
#' weibull_median(1200, 0.5)
weibull_median  <-  function(scale, shape) {
  (log(2) ^ (1 / shape)) * scale
}

#' Weibull mean and scale to shape
#'
#' @param mu Mean survival time (outcome parameter in brms)
#' @param shape The shape parameter for the Weibull distribution
#'
#' @return scale for the weibull distribution
#' @export
#'
#' @examples
#' weibull_mu_to_scale(1200, 0.5)
weibull_mu_to_scale <-   function(mu, shape) {
  mu / gamma(1 + 1 / shape)
}


#' Weibull survival function
#'
#' @param scale The scale parameter for the Weibull distribution
#' @param shape The shape parameter for the Weibull distribution
#' @param time Time point or sequence
#'
#' @return survival probabilities
#' @export
#'
#' @examples
#' weibull_survival(50,0.5,1:100)
weibull_survival <-
  function(scale, shape, time) {
    exp(-(time / scale) ^ shape)
  }


#' Weibull hazard function
#'
#' @param scale The scale parameter for the Weibull distribution
#' @param shape The shape parameter for the Weibull distribution
#' @param time Time point or sequence
#'
#' @return hazard
#' @export
#'
#' @examples
#' weibull_hazard(50,0.5,1:100)
weibull_hazard <-
  function(scale, shape, time) {
    (shape / scale) * (time / scale) ^ (shape - 1)
  }
