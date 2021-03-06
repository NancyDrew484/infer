% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate.R
\name{calculate}
\alias{calculate}
\title{Calculate summary statistics}
\usage{
calculate(x, stat, order = NULL, ...)
}
\arguments{
\item{x}{the output from \code{\link{generate}} for computation-based 
inference or the output from \code{\link{hypothesize}}
piped in to here for theory-based inference.}

\item{stat}{a string giving the type of the statistic to calculate. Current
options include "mean", "median", "sd", "prop", "diff in means",
"diff in medians", "diff in props", "Chisq", "F", "t", "z", and "slope".}

\item{order}{a string vector of specifying the order in which the levels of
the explanatory variable should be ordered for subtraction, where
\code{order = c("first", "second")} means \code{("first" - "second")}
Needed for inference on difference in means, medians, or proportions.}

\item{...}{to pass options like \code{na.rm = TRUE} into functions like
mean, sd, etc.}
}
\value{
A tibble containing a \code{stat} column of calculated statistics
}
\description{
Calculate summary statistics
}
\examples{
# Permutation test for two binary variables
  mtcars \%>\%
    dplyr::mutate(am = factor(am), vs = factor(vs)) \%>\%
    specify(am ~ vs, success = "1") \%>\%
    hypothesize(null = "independence") \%>\%
    generate(reps = 100, type = "permute") \%>\%
    calculate(stat = "diff in props", order = c("1", "0"))
}
