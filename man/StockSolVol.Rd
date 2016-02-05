\name{StockSolVol}
\alias{StockSolVol}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculates the volume of stock solution needed when making up working solutions.
}
\description{
Uses the equation:

StockSolVol = (NewSolConc * NewSolVol) / StockSolConc

To work out the volume of your original solution (stock solution) you need to make up the desired concentration of your new solution (eg. for a working solution)

}
\usage{
StockSolVol(StockSolConc, NewSolConc, NewSolVol)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{StockSolConc}{
The concentration of your stock solution
}
  \item{NewSolConc}{
The desired concentration of your new solution
}
  \item{NewSolVol}{
The total volume of your new solution
}
}
\details{
}
\value{
}
\references{
}
\author{
Daniel Padfield
}
\note{
}


\seealso{
}
\examples{
StockConc <- 100
DesiredConc <- 10
DesiredVol <- 50

StockSolVol(StockConc, DesiredConc, DesiredVol)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
