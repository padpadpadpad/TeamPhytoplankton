\name{Tmin}
\alias{Tmin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculates Tmin for the Thomas TRC
}
\description{
Calculates the Tmin for the thermal response curve by subtracting w/2 onto Topt.
}
\usage{
Tmin(Topt, w)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Topt}{
The parameter Tmax
}
  \item{w}{
The parameter w
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
returns the Tmin for the Thomas TRC. The lowest temperature at which the rate is no longer positive.
}
\references{
Thomas, M.K., Kremer, C.T., Klausmeier, C. a & Litchman, E. (2012) A global pattern of thermal adaptation in marine phytoplankton. Science, 338, 1085–8.

Thomas, M.K., Kremer, C.T. & Litchman, E. (2015) Environment and evolutionary history determine the global biogeography of phytoplankton temperature traits. Global Ecology and Biogeography, 25, 75-86.
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
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
