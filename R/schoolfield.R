##################################################
#Schoolfield approximation - high temperature inactivation only


#' Performs the modified Sharpe-Schoolfield equation on thermal response data
#' including both high and low temperature inactivation
#' 
#' Models the thermal performance curve for metabolism using a modified thermal
#' performance curve which includes inactivation of the rate at both low and
#' high temperatures.
#' 
#' %% ~~ If necessary, more details than the description above ~~
#' 
#' @param ln.c The specific rate of metabolism (log scale)
#' @param Ea Activation energy
#' @param El Low temperature deactivation energy
#' @param Tl Temperature at which enzyme is 1/2 active and 1/2 low temperature
#' suppressed
#' @param Eh High temperature deactivation energy
#' @param Th Temperature at which enzyme is 1/2 active and 1/2 high temperature
#' suppressed
#' @param temp Temperature in K
#' @param Tc Standardisation temperature (in ºC, arbitrary)
#' @return Returns a value of metabolism b(T) across the range of temperatures
#' set based on the parameter values
#' @note %% ~~further notes~~
#' @author Daniel Padfield
#' @seealso \code{\link{schoolfield.high}} for applying the high temperature
#' inactivation only modification of the Sharpe-Schoolfield model.
#' 
#' \code{\link{Topt}} for calculating the optimum temperature of the
#' Sharpe-Schoolfield model.
#' @references Schoolfield, R.M., Sharpe, P.J. & Magnuson, C.E. (1981)
#' Non-linear regression of biological temperature-dependent rate models based
#' on absolute reaction-rate theory. Journal of theoretical biology, 88,
#' 719–731.
#' @keywords ~kwd1 ~kwd2
#' @examples
#' 
#' 
#' @export schoolfield
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

