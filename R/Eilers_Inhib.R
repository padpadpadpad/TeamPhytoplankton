#'
#' Eilers PI curve inhibtion ratio
#' 
#' Gives the ratio of actual Pmax and the Pmax that would occur if no inhibition occurred.
#' 
#' @param Pmax The photosynthetic maxima
#' @param Iopt The optimal light intensity
#' @param a The initial slope of the curve
#' @author Daniel Padfield
#' @seealso \code{\link{Eilers_PI}} and \code{\link{Eilers_mod_PI}} for fitting the Eilers photosynthesis irradiance curve
#' @references Eilers, P.H.. & Peeters, J.C.. (1988) A model for the
#' relationship between light intensity and the rate of photosynthesis in
#' phytoplankton. Ecological Modelling, 42, 199–215.
#' 
#' @export Eilers_Inhib


Eilers_Inhib <- function(Pmax, Iopt, a){
  numerator <- (1/Pmax) - (2/(a * Iopt))
  denominator <- sqrt((1/(a*Iopt^2)) * (1/a))
  return((numerator/denominator)/((numerator/denominator) + 2))
}

