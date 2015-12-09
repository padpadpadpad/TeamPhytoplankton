\name{Topt}
\alias{Topt}
\title{
Calculates the optimum temperature
}
\description{
Calculates the optimum temperature from the parameters of the modified Sharpe-Schoolfield equation. Used in tandem with schoolfield.high
}
\usage{
Topt(Eh, Th, Ea, K = c("Y", "N"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Eh}{
The value of the deactivation energy
}
  \item{Th}{
The value of Th being the temperature at which the substrate is half high temperature suppressed (in K)
  }
  \item{Ea}{
The activation energy
}
  \item{K}{
Whether or not you want the results in K or in degrees centigrade. Defaults to K. 'Y' gives K and 'N' gives degrees celsius
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

## example

Topt(4, 315, 0.6)
312.6682

Topt(4, 315, 0.6, 'N')
39.51823

312.6682 - 273.15 = 39.5182


###############################################################################
## The function is currently defined as
function (Eh, Th, Ea, K = c("Y", "N")) 
{
    if (missing(K)) 
        return(Eh * (1/((Eh/Th) + (8.62e-05 * log(Eh - Ea/Ea)))))
    if (K == "Y") 
        return(Eh * (1/((Eh/Th) + (8.62e-05 * log(Eh - Ea/Ea)))))
    if (K == "N") 
        return((Eh * (1/((Eh/Th) + (8.62e-05 * log(Eh - Ea/Ea))))) - 
            273.15)
  }
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
