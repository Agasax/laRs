% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/survival.R
\name{weibull_mu_to_scale}
\alias{weibull_mu_to_scale}
\title{Weibull mean and scale to shape}
\usage{
weibull_mu_to_scale(mu, shape)
}
\arguments{
\item{mu}{Mean survival time (outcome parameter in brms)}

\item{shape}{The shape parameter for the Weibull distribution}
}
\value{
scale for the weibull distribution
}
\description{
Weibull mean and scale to shape
}
\examples{
weibull_mu_to_scale(1200, 0.5)
}
