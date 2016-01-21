\name{SH.Tmin}
\alias{SH.Tmin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Empirically calculates the minimum temperature of a schoolfield.high model fit
}
\description{
Creates a temporary dataframe of a wide range of temperatures (at 0.1 degree increments) and predictions based on the parameters controlling the thermal response curve. The thermal minima is the maximum temperature where the rate is less than the threshold proportion of bTpeak below Topt.
}
\usage{
SH.Tmin(data, prop, Tc, K = "Y", id.col, range)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
The parameter data frame
}
  \item{prop}{
The proportion below bTpeak from which the thermal minima is to be calculated
}
  \item{Tc}{
The normalising temperature used in the original schoolfield.high fits
}
  \item{K}{
Whether or not Topt is in Kelvin. Defaults to 'Y'. To override default use 'N'.
}
  \item{id.col}{
The column that identifies each curve. Is equivalent to the id.col from nlsLoop.
}
  \item{range}{
The range of temperatures from which you want the Kelvin to be taken, is centred around the optimal temperature. For range = 500 and Topt = 30, the temperatures would be from 30 - 250 and 30 + 250.
}
}
\details{
This function has a few assumptions:
nlsLoop or something similar has compiled your dataframe of parameter estimates and that it is in a similar format.
That you have column names for each of your parameters and these include optimum temperature (Topt) and peak rate (bTpeak). They have to be the column names for the function to run.

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

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
