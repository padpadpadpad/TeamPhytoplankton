# function for modelling the photosynthesis irradiance curve according to Platt (1990)

Platt_PI <- function(I,ps,alpha,beta){
  pi<-ps*(1-exp(-alpha*I/ps))*exp((-beta*I)/ps)
  return(pi)
}