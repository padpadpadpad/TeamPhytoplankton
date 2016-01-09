###### Thomas TPC

ThomasTRC <- function(a, Topt, w, temp) {
  rate <- a*exp(0*temp)*(1-((Topt-temp)/(w/2))^2)
  return(rate)
}
