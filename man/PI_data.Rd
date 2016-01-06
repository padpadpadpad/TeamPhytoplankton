\name{PI_data}
\alias{PI_data}
\docType{data}
\title{
Dataset of photosynthesis irradiance curves
}
\description{
Photosynthesis irradiance curves of Chlorella vulgaris taken at different assay temperatures. The culture was grown at 20ºC
}
\usage{data("PI_data")}
\format{
  A data frame with 68 observations on the following 3 variables.
  \describe{
    \item{\code{GPP}}{the rate of gross photosynthesis at each light level}
    \item{\code{light}}{the light intensity}
    \item{\code{temp}}{the assay temperature at which the rate was measured}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(PI_data)

library(ggplot2)
ggplot(PI_data) +
  geom_point(aes(light, GPP), shape = 21) +
  facet_wrap(~ temp) +
  theme_bw()

}
\keyword{datasets}
