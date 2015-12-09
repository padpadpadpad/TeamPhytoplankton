\name{quasi.rsq.nls}
\alias{quasi.rsq.nls}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
R squared statistic for non linear models
}
\description{
Calculates a quasi-rsquared value for non linear least squares regression models. The formula for calculating this is given in the paper in the references (Spiess 2010). 

Cautionary notes of whether its useful are provided in the stack overflow reference. A personal highlight of which is 'If someone asks for rope to hang themselves, its fine to give it to them (while performing due diligence by asking "are you sure you want to do this?")'

Calculated as :

1 - (n-1)/(n-param) * (1 - R^2)

where R^2 = 1 - RSS/TSS

RSS is the residual sum of squares given by deviance(mdl)

TSS is given by how much variance there is in the dependent variable:

(n - 1)*var(y)

}
\usage{
quasi.rsq.nls(mdl, y, param)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mdl}{
model object from which R^2 is desired. Used to calculate the residual sum of squares.
}
  \item{y}{
the dependent variable in the model.
}
  \item{param}{
the number of parameters of the non-linear model
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
Spiess, A.-N. & Neumeyer, N. (2010) An evaluation of R2 as an inadequate measure for nonlinear models in pharmacological and biochemical research: a Monte Carlo approach. BMC pharmacology, 10, 6.

http://stackoverflow.com/questions/14530770/calculating-r2-for-a-nonlinear-model

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
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (mdl, n, param) 
{
    adj <- (sum(!is.na(y)) - 1)/(sum(!is.na(y)) - param)
    sum.sq <- (sum(!is.na(y)) - 1) * var(y, na.rm = TRUE)
    rsq <- 1 - (adj * (deviance(mdl)/sum.sq))
    return(rsq)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
