\name{Platt_PI}
\alias{Platt_PI}
\title{
Fitting a photosynthesis-irradiance curve
}
\description{
Uses the Platt PI model with photoinhibition (Platt 1990) to fit a model to photosynthesis data across many light levels typically taken using the Oxylab system
}
\usage{
Platt_PI(I, ps, alpha, beta)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{I}{
The value of light, either a vector or a single, numeric value.
}
  \item{ps}{
Scaling coefficient for the curve
}
  \item{alpha}{
The steepness of the initial gradient of the curve - is a measure of photosynthetic efficiency
}
  \item{beta}{
The steepness and extent of photoinhibition as light levels increase past the optimum
}
}
\details{
When using nlsLoop, set the parameters lower limits to 0 as the equation has two solutions and with equivalent AIC scores so could return some unwanted negative values for some parameters.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Platt, T., Sathyendranath, S. & Ravindran, P. (1990) Primary production by phytoplankton : analytic solutions for daily rates per unit area of water surface. Proceedings: Biological Sciences, 241, 101–111.
}
\author{
Daniel Padfield
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Eilers_PI}} for fitting an alternative photosynthesis irradiance curve.
}
\examples{

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
