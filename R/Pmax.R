# function for deriving pmax from the Platt photosynthesis irradiance curve

Pmax <- function(ps, alpha, beta){
  return(ps/(((alpha + beta)/alpha)*(beta/(alpha + beta))^(-beta/alpha)))
  
}