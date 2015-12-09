\name{Pmax}
\alias{Pmax}
\title{
Calculating the photosynthetic maximum
}
\description{
Calculates the photosynthetic maximum from the parameters of the Platt_PI curve
}
\usage{
Pmax(ps, alpha, beta)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ps}{
the scaling coefficient
}
  \item{alpha}{
The steepness of the initial gradient of the curve - is a measure of photosynthetic efficiency
}
  \item{beta}{
The steepness and extent of photoinhibition as light levels increase past the optimum
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
Platt_PI()
}
\examples{
## The function is currently defined as
function (ps, alpha, beta) 
{
    return(ps/(((alpha + beta)/alpha) * (beta/(alpha + beta))^(-beta/alpha)))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
