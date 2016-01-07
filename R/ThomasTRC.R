###### Thomas TPC

ThomasTRC <- function(a, z, w, temp) {
  rate <- a*exp(0*temp)*(1-((z-temp)/(w/2))^2)
  return(rate)
}
