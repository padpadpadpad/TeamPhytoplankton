\name{Eilers_PI}
\alias{Eilers_PI}
\title{
Fitting a photosynthesis-irradiance curve
}
\description{
Uses the Eilers & Peeters (1988) PI model to fit a model to photosynthesis data across many light levels typically taken using the Oxylab system. Benefits from modelling Pmax without any other derivatives so can test the probability of the parameter.
}
\usage{
Eilers_PI(Pmax, Iopt, a, I)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Pmax}{
The photosynthetic maxima
}
  \item{Iopt}{
The optimal light intensity
}
  \item{a}{
The initial slope of the curve
}
  \item{I}{
Light
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
Eilers, P.H.. & Peeters, J.C.. (1988) A model for the relationship between light intensity and the rate of photosynthesis in phytoplankton. Ecological Modelling, 42, 199–215.
}
\author{
Daniel Padfield
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Platt_PI}} for fitting an alternative photosynthesis irradiance curve
}
\examples{

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
