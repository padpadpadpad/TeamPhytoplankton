\name{ThomasTRC}
\alias{ThomasTRC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Fits a thermal performance curve to data using the formula given by Thomas et al. 2012.
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ThomasTRC(a, z, w, temp)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{
scaling parameter for the curve.
}
  \item{z}{
controls the position of where the quadratic portion reaches its maximum. So in essence z is the Topt.
}
  \item{w}{
the breadth of thermal performance curve, the range over which the dependent variable is postive
}
  \item{temp}{
temperature, can be in degrees centigrade or Kelvin
}
}
\details{
Rates need to be in raw form not logged as its important that negative rates are actually negative rates to be able to correctly calculate w
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Daniel Padfield
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
temp <- seq(1,30,1)
plot(ThomasTRC(100, 20,20, temp = temp) ~ temp)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
