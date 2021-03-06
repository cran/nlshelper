% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_nls.R
\name{plot_nls}
\alias{plot_loess}
\alias{plot_nls}
\title{Plot a non-linear or non-parametric regression model}
\usage{
plot_nls(object, col = NULL, band = TRUE, plotdata = TRUE,
  lines.col = palette(), points.col = palette(), ci.col = "#BEBEBEB3",
  lwd = 1, lty = 1, add = FALSE, xlab = NULL, ylab = NULL,
  coverage = 0.95, ...)

plot_loess(object, ...)
}
\arguments{
\item{object}{The object returned by \code{nls}, \code{nlsList} or \code{loess}}

\item{col}{Colour to be used for the data symbols and the fitted line, unless \code{lines.col} and \code{points.col} are provided}

\item{band}{For \code{plot_loess}, whether to add a confidence band. Not yet implemented for \code{plot_nls}}

\item{plotdata}{Logical. Whether to add the data points to the plot.}

\item{lines.col}{Colour(s) for the fitted lines. When plotting a \code{nlsList} object, can be a vector that represents colours for each group.}

\item{points.col}{Colour(s) for the data symbols. When plotting a \code{nlsList} object, can be a vector that represents colours for each group.}

\item{ci.col}{Colour of the confidence band, if plotted. Defaults to a transparent grey colour.}

\item{lwd}{Thickness of the line (see \code{\link{par}})}

\item{lty}{Line type (see \code{\link{par}})}

\item{add}{Logical. Whether to add to current plot (default FALSE).}

\item{xlab}{Label for x-axis}

\item{ylab}{Label for y-axis}

\item{coverage}{If confidence band to be plotted, the coverage (e.g. for 95\% confidence interval, use 0.95)}

\item{\dots}{Further arguments passed to \code{\link{plot}}}
}
\value{
Returns the predicted values used in plotting (invisibly), as a dataframe with columns 'predvar' (regularly spaced predictor values), and 'fit' (fitted values). For \code{plot_loess} also returns confidence intervals, standard error, and df of the residual.
}
\description{
Convenient function for adding curves to an existing plot, or to plot the data with the fitted curve.
For non-linear regression plotting (\code{plot_nls}), works for simple non-linear regression models fit with \code{\link{nls}}, and grouped non-linear regression (with \code{\link{nlsList}}), in which case one fitted curve for each group is drawn on the same plot.
For local regression models fitted with \code{loess}, use the \code{plot_loess} function which additionally adds a confidence interval around the fitted curve.
}
\examples{

# Plot an nls object
chick <- as.data.frame(ChickWeight)
fit0 <- nls(weight ~ a*Time^b, data=chick, start=list(a=10, b=1.1))
plot_nls(fit0)

# Plot a grouped nls object
library(nlme)
fit1 <- nlsList(weight ~ a*Time^b|Diet, data=chick, start=list(a=10, b=1.1))
plot_nls(fit1)

# Plot a local regression object, with confidence interval
l <- loess(wt ~ disp, data=mtcars)
plot_loess(l)

# To plot behind the data:
with(mtcars, plot(disp, wt, pch=19,
 panel.first=plot_loess(l, plotdata=FALSE)))

}

