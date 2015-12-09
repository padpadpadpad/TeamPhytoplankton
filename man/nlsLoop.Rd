\name{nlsLoop}
\alias{nlsLoop}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Loops through a non-linear model on many different curves to find the best possible fit.
}
\description{
Fits the best possible model to each of a set of curves using non-linear least squares regression using nlsLM. The best fit is determined using AIC scores.

Returns a dataframe of the best estimated parameter fits for each level of id_col with asosciated AIC score.
}
\usage{
nlsLoop(data, model, tries, id_col, param_bds, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
Data that includes the rates
}
  \item{model}{
The formula that is usually fed into nlsLM. Make sure there is a y and an x (the column in your dataframe that is the explanatory variable)
eg. ln.resp.cor ~ schoolfield.high(ln.c, Ea, Eh, Th, temp=K, Tc = 25)
}
  \item{tries}{
Number of combinations of different starting parameters that are tried on each curve.
}
  \item{id_col}{
The column name that identifies each curve that is to be fitted. Needs to be in speech marks, ' '.
}

  \item{param_bds}{
Upper and lower boundaries for the start parameters. If missing these default to +/- 1e+09. Need to specified as a vector as : c(lower bound param 1, upper bound param 1, lower bound param 2, upper boung param 2 ...)

}
  \item{\dots}{
Extra arguments to pass to nlsLM if necessary.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a dataframe with the best parameter values for each curve.
}
\references{

}
\author{
Daniel Padfield
}
\note{
Useful additional arguments for nlsLM include:
na.action = na.omit,

lower/upper = c() where these represent upper and lower boundaries for parameter estimates
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
results <- nlsLoop(data,
                   model = rate ~ schoolfield.high(ln.c, Ea, Eh, Th,temp = K, Tc = 25),
                   tries = 1000,
                   id_col = 'id',
                   param_bds = c(0,2,0,2,2,8,300,330))
                   
}
