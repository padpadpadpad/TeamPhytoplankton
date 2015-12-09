#################### Eilers and Peeters PI model ############################

############# modified from Edwards et al 2015 #####################

Eilers_PI <- function(Pmax, Iopt, a, I){
  pi <- (Pmax*I)/((Pmax/(a*Iopt^2))*I^2 + ((1 - (2*Pmax)/(a*Iopt))*I) + (Pmax/a))
  return(pi)
}
