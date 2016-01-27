##################################################
#Schoolfield approximation - high temperature inactivation only
schoolfield <- function(ln.c,Ea,El,Tl,Eh,Th,temp,Tc) {
  
  #constants
  Tc <- 273.15 + Tc #standardization temperature (in K, arbitrary)
  k <- 8.62e-5 #Boltzmann's constant; units imply Ea, El, and Eh are in eV
  
  #ln.c normalisation constant (log scale)
  #Ea Apparent Activation energy
  #Eh High temperare De-Activation energy
  #Th T at which enzyme is 1/2 active and 1/2 High-T suppressed
  
  #expression for flux is the product of two terms below
  boltzmann.term <- ln.c + log(exp(Ea/k*(1/Tc - 1/temp)))  #Boltzmann term
  inactivation.term <- log(1/(1 + exp(-El/k*(1/Tl - 1/temp)) + exp(Eh/k*(1/Th - 1/temp)))) 
  
  #predicted flux (log scale)
  return(boltzmann.term + inactivation.term)
  
}

