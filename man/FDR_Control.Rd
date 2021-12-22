\name{FDR_Control}
\alias{FDR_Control}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Threshold for FDR-controlling
}
\description{
We develop a false discovery rate (FDR) control approach based on a large-scale association testing procedure with theoretical guarantees for FDR control under flexible correlation structures
}
\usage{
FDR_Control(pv,alpha0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pv}{numberic: numeric vector of p-values.}
  \item{alpha0}{numberic: significance level, defalut value is 0.05.}
}
\examples{
set.seed(123)
x <- rnorm(50, mean = c(rep(0, 25), rep(3, 25)))
p <- 2*pnorm(sort(-abs(x)))
## Calculate threshold for FDR-controlling
t=FDR_Control(pv=p,alpha0=0.05)
}
