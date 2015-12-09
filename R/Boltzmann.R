######################################################################
###### traditional boltzmann function

boltzmann <- function(ln.c, Ea, temp, Tc, log = c('Y', 'N')){
  
  #constants
  Tc <- 273.15 + Tc   #standardization temperature (in K, arbitrary)
  k <- 8.62e-5 #Boltzmann's constant; units imply Ea, El, and Eh are in eV
  
  # ln.c - normalisation constant
  # Ea - activation energy
  
  boltzmann.term <- ln.c + log(exp(Ea/k*(1/Tc - 1/temp)))
  exp.boltzmann.term <- ln.c*exp(Ea/k*(1/Tc - 1/temp))
  if(missing(log)) return(boltzmann.term)
  if(log == 'Y') return(boltzmann.term)
  if(log == 'N') return(exp.boltzmann.term)
 
}