######## Function for deriving Topt #########################

Topt <- function(Eh, Th, Ea, K = c('Y', 'N')){
  if(missing(K)) return((Eh*Th)/(Eh + (8.62e-05 *Th*log((Eh/Ea) - 1))))
  if(K == 'Y') return((Eh*Th)/(Eh + (8.62e-05 *Th*log((Eh/Ea) - 1))))
  if(K =='N') return(((Eh*Th)/(Eh + (8.62e-05 *Th*log((Eh/Ea) - 1)))) - 273.15)
}

################ example

Topt(4, 315, 0.6)
