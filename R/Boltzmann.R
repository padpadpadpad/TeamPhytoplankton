######################################################################
###### traditional boltzmann function



#' Fits the traditional temperature centred Boltzmann function to data
#' 
#' Fits the traditional temperature centred Boltzmann function to data. If no
#' high temperature inactivation is present then this allows for modelling of
#' that data. Has a term in for whether the data is log transformed or not
#' 
#' 
#' @param ln.c Specific rate (of metabolism) at Tc
#' @param Ea Activation energy
#' @param temp Temperature in K
#' @param Tc #standardization temperature (in ºC, arbitrary)
#' @param log Whether or not the data is log transformed (potential values are
#' "Y" or "N"). Defaults to "Y".
#' @author Daniel Padfield
#' @examples
#' 
#' ## The function is currently defined as
#' function (ln.c, Ea, temp, Tc, log = c("Y", "N")) 
#' {
#'     Tc <- 273.15 + Tc
#'     k <- 8.62e-05
#'     boltzmann.term <- ln.c + log(exp(Ea/k * (1/Tc - 1/temp)))
#'     exp.boltzmann.term <- ln.c * exp(Ea/k * (1/Tc - 1/temp))
#'     if (missing(log)) 
#'         return(boltzmann.term)
#'     if (log == "Y") 
#'         return(boltzmann.term)
#'     if (log == "N") 
#'         return(exp.boltzmann.term)
#'   }
#' 
#' @export boltzmann
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
