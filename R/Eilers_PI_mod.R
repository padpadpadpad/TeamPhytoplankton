#' 
#' function
#' 
#' Eilers photosynthesis irradiance curve with varying y intercept
#' 
#' Uses the Eilers photosynthesis irradiance curve with an extra parameter allowing for a varying y-intercept. This allows for negative rates of photosynthesis to be modelled.
#' 
#' @param Pmax The photosynthetic maxima
#' @param Iopt The optimal light intensity
#' @param a The initial slope of the curve
#' @param I Light
#' @param c The y intercept controlling the height of the curve
#' @author Daniel Padfield
#' @seealso \code{\link{Eilers_PI}} for fitting the photosynthesis
#' irradiance model without a varying y intercept
#' @references Eilers, P.H.. & Peeters, J.C.. (1988) A model for the
#' relationship between light intensity and the rate of photosynthesis in
#' phytoplankton. Ecological Modelling, 42, 199–215.
#' @examples
#' data <- data.frame(light = seq(10, 1000, 10))
#' data$c0 <- Eilers_PI_mod(1000, 600, 50, data$light, 0)
#' plot(c0 ~ light, data)
#'
#' @export Eilers_PI_mod 

Eilers_PI_mod <- function(Pmax, Iopt, a, I, c){
  pi <- (((Pmax - c)*I)/(((Pmax - c)/(a*Iopt^2))*I^2 + ((1 - (2*(Pmax - c))/(a*Iopt))*I) + ((Pmax - c)/a))) + c
  return(pi)
}

