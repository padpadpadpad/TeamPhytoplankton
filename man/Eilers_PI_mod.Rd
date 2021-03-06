% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Eilers_PI_mod.R
\name{Eilers_PI_mod}
\alias{Eilers_PI_mod}
\title{Eilers photosynthesis irradiance curve with varying y intercept}
\usage{
Eilers_PI_mod(Pmax, Iopt, a, I, c)
}
\arguments{
\item{Pmax}{The photosynthetic maxima}

\item{Iopt}{The optimal light intensity}

\item{a}{The initial slope of the curve}

\item{I}{Light}

\item{c}{The y intercept controlling the height of the curve}
}
\description{
Uses the Eilers photosynthesis irradiance curve with an extra parameter allowing for a varying y-intercept. This allows for negative rates of photosynthesis to be modelled.
}
\examples{
data <- data.frame(light = seq(10, 1000, 10))
data$c0 <- Eilers_PI_mod(1000, 600, 50, data$light, 0)
plot(c0 ~ light, data)

}
\references{
Eilers, P.H.. & Peeters, J.C.. (1988) A model for the
relationship between light intensity and the rate of photosynthesis in
phytoplankton. Ecological Modelling, 42, 199–215.
}
\seealso{
\code{\link{Eilers_PI}} for fitting the photosynthesis
irradiance model without a varying y intercept
}
\author{
Daniel Padfield
}
