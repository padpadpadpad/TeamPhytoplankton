\name{schoolfield}
\alias{schoolfield}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Performs the modified Sharpe-Schoolfield equation on thermal response data including both high and low temperature inactivation
}
\description{
Models the thermal performance curve for metabolism using a modified thermal performance curve which includes inactivation of the rate at both low and high temperatures.
}
\usage{
schoolfield(ln.c, Ea, El, Tl, Eh, Th, temp, Tc)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ln.c}{
The specific rate of metabolism (log scale)
}
  \item{Ea}{
Activation energy 
}
  \item{El}{
Low temperature deactivation energy
}
  \item{Tl}{
Temperature at which enzyme is 1/2 active and 1/2 low temperature suppressed
}
  \item{Eh}{
High temperature deactivation energy
}
  \item{Th}{
Temperature at which enzyme is 1/2 active and 1/2 high temperature suppressed
}
  \item{temp}{
Temperature in K
}
  \item{Tc}{
Standardisation temperature (in ºC, arbitrary)
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a value of metabolism b(T) across the range of temperatures set based on the parameter values 
}
\references{
Schoolfield, R.M., Sharpe, P.J. & Magnuson, C.E. (1981) Non-linear regression of biological temperature-dependent rate models based on absolute reaction-rate theory. Journal of theoretical biology, 88, 719–731.
}
\author{
Daniel Padfield
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{schoolfield.high}}

\code{\link{Topt}}
}
\examples{
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
