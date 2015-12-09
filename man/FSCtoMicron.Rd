\name{FSCtoMicron}
\alias{FSCtoMicron}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Converts FSC.H to micrometres
}
\description{
Uses the results of a linear regression to convert values of FSC.H on the ESI BD Accuri C6 to values of micrometres
}
\usage{
FSCtoMicron(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
vector of values of FSC.H to convert
}
}
\details{
Uses an equation of µm = (FSC.H - 75087.02)/104292.56

Uses raw values of FSC.H before it has been log transformed.

The graph of this regression is in the shared Dropbox and has an r squared value of 0.91. So it isn't perfect but a very good approximate.
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
data <- data.frame(length = c(1,  2,  4, 6, 10, 15), FSC.H = c(58127.95,   72891.38,  339312.54,  619733.87, 1096084.37, 1767728.37))

FSCtoMicron(data$FSC.H)

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
