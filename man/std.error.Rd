\name{std.error}
\alias{std.error}
\title{
Calculates the standard error
}
\description{
Calculates the standard error but takes into account whether NAs are present or not
}
\usage{
std.error(x, na.action = c(FALSE, TRUE))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
vector of values to calculate standard error for (must be numeric)
}
  \item{na.action}{
whether there are NAs in the data or not. Defaults to FALSE. TRUE means that both the row including NA is excluded so both the number of samples and the mean is affected
}
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
y <- c(1,4,6,7,91,3,45,6,7,8,345,232,43423,5436, NA)

std.error(y)
NA
std.error(y, TRUE)
3091.521

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
