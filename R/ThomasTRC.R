###### Thomas TPC



#' Fits a thermal performance curve to data using the formula given by Thomas
#' et al. 2012.
#' 
#' Fits a thermal performance curve to data such as the following equation :
#' 
#' g(T) = a*[1 - ((Topt-T)/(w/2))^2]
#' 
#' where a is a scaling coefficient, Topt is the optimum temperature and w is
#' the range of temperatures over which the rate is positive.
#' 
#' Tmin and Tmax can be calculated by subtracting or adding w/2 to Topt
#' respectively. See \code{\link{Thomas.Tmax}} and \code{\link{Thomas.Tmin}}.
#' 
#' Rates need to be in raw form not logged as its important that negative rates
#' are actually negative rates to be able to correctly calculate w
#' 
#' @param a scaling parameter for the curve.
#' @param Topt controls the position of where the quadratic portion reaches its
#' maximum. So in essence z is the Topt.
#' @param w the breadth of thermal performance curve, the range over which the
#' dependent variable is postive
#' @param temp temperature, can be in degrees centigrade or Kelvin
#' @return returns the biological rate at a given temperature depending on the
#' parameters controlling the model.
#' @note %% ~~further notes~~
#' @author Daniel Padfield
#' @seealso \code{\link{schoolfield.high}} and \code{\link{schoolfield}} for
#' fitting alternative thermal response curves.
#' @references Thomas, M.K., Kremer, C.T., Klausmeier, C. a & Litchman, E.
#' (2012) A global pattern of thermal adaptation in marine phytoplankton.
#' Science, 338, 1085–8.
#' 
#' Thomas, M.K., Kremer, C.T. & Litchman, E. (2015) Environment and
#' evolutionary history determine the global biogeography of phytoplankton
#' temperature traits. Global Ecology and Biogeography, 25, 75-86.
#' @keywords ~kwd1 ~kwd2
#' @examples
#' 
#' temp <- seq(1,30,1)
#' plot(ThomasTRC(100, 20,20, temp = temp) ~ temp)
#' 
#' 
#' @export ThomasTRC
ThomasTRC <- function(a, Topt, w, temp) {
  rate <- a*exp(0*temp)*(1-((Topt-temp)/(w/2))^2)
  return(rate)
}
