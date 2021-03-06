#' Print methods
#'
#' @param x An object of type cohenkappa
#' @param digits Rounding
#' @param ... Additional arguemnts for print
#'
#'
#' @export
#'
#'
print.laRs<- function(x, digits=2, ...){
  if(length(class(x))>1) {value <- class(x)[2]}
  switch(value,
         cohenkappa={
           k <- rbind(x$unweighted,x$weighted)
           rownames(k) <- c('Unweighted','Weighted')
           print(x$Call)
           cat("\nCohen's Kappa and weighted Kappa for categorical agreement \n\n")
           print(k,digits=digits)
           cat(paste0("\n\nNumber of observations: ",x$n,"\n"))
           cat(paste0("Weights: ",x$wt))


         },
         beta_diff={cat("Probability of lower eventrate in a than b is: \n")
           cat(round(x$exact.prob,digits = digits))

         })
}
