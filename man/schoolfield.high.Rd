\name{schoolfield.high}
\alias{schoolfield.high}
\title{
Performs the modified Sharpe-Schoolfield equation for high temperature inactivation
}
\description{
Models the thermal performance curve for metabolism using a modified thermal performance curve.
}
\usage{
schoolfield.high(ln.c, Ea, Eh, Th, temp, Tc)
}
\arguments{
  \item{ln.c}{
The specific rate of metabolism (log scale)
}
  \item{Ea}{
Activation energy 
}
  \item{Eh}{
High temperare De-Activation energy
}
  \item{Th}{
T at which enzyme is 1/2 active and 1/2 High-T suppressed
}
  \item{temp}{
temperature in K
}
  \item{Tc}{
standardisation temperature (in ºC, arbitrary)
}
}

\author{
Daniel Padfield
}

\seealso{

\code{\link{schoolfield}} for applying the high and low temperature inactivation modification of the Sharpe-Schoolfield model.

\code{\link{Topt}} for calculating the optimum temperature of the Sharpe-Schoolfield model

\code{\link{SH.Tmin}} and \code{\link{SH.Tmax}} for empirically calculating the thermal minima and maxima.

}

\examples{

}
}
