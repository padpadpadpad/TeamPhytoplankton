\name{inv.temp}
\alias{inv.temp}
\title{
Inverse of temperature
}
\description{
Function for creating a temperature centred value of temperature. Useful for creating a column for linear modelling of data to make the intercept meaningful

Calculated as either:

(1/ Boltzmann's constant / mean temperature) - (1 / Boltzmann's constant/ Temperature)

(1/ Boltzmann's constant / Tc) - (1 / Boltzmann's constant/ Temperature)

}
\usage{
inv.temp(x, K = c("Y", "N"), Tc)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
temperature data, can be K or ºC. Default is for Kelvin.
}
  \item{K}{
Whether or not the data is in degrees centigrade or Kelvin. Defaults to K.
}
  \item{Tc}{
The desired normialised temperature. Without specification will default to the mean temperature.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
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
x <- seq(313, 330, 1)

inv.temp(x)
inv.temp(x, Tc = 50) 

y <- seq(1,30,1)
inv.temp(y, 'N')
inv.temp(y, 'N', Tc = 15)

