# function for deriving pmax from the Platt photosynthesis irradiance curve



#' Calculating the photosynthetic maximum
#' 
#' Calculates the photosynthetic maximum from the parameters of the Platt_PI
#' curve
#' 
#' %% ~~ If necessary, more details than the description above ~~
#' 
#' @param ps the scaling coefficient
#' @param alpha The steepness of the initial gradient of the curve - is a
#' measure of photosynthetic efficiency
#' @param beta The steepness and extent of photoinhibition as light levels
#' increase past the optimum
#' @return %% ~Describe the value returned %% If it is a LIST, use %%
#' @note %% ~~further notes~~
#' @author Daniel Padfield
#' @seealso \code{\link{Platt_PI}} for the original model fit.
#' @references Platt, T., Sathyendranath, S. & Ravindran, P. (1990) Primary
#' production by phytoplankton : analytic solutions for daily rates per unit
#' area of water surface. Proceedings: Biological Sciences, 241, 101–111.
#' @keywords ~kwd1 ~kwd2
#' @examples
#' 
#' 
#' 
#' @export Pmax
Pmax <- function(ps, alpha, beta){
  return(ps/(((alpha + beta)/alpha)*(beta/(alpha + beta))^(-beta/alpha)))
  
}
