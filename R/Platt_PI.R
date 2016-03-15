# function for modelling the photosynthesis irradiance curve according to Platt (1990)



#' Fitting a photosynthesis-irradiance curve
#' 
#' Uses the Platt PI model with photoinhibition (Platt 1990) to fit a model to
#' photosynthesis data across many light levels typically taken using the
#' Oxylab system
#' 
#' When using nlsLoop, set the parameters lower limits to 0 as the equation has
#' two solutions and with equivalent AIC scores so could return some unwanted
#' negative values for some parameters.
#' 
#' @param I The value of light, either a vector or a single, numeric value.
#' @param ps Scaling coefficient for the curve
#' @param alpha The steepness of the initial gradient of the curve - is a
#' measure of photosynthetic efficiency
#' @param beta The steepness and extent of photoinhibition as light levels
#' increase past the optimum
#' @return %% ~Describe the value returned %% If it is a LIST, use %%
#' \item{comp1 }{Description of 'comp1'} %% \item{comp2 }{Description of
#' 'comp2'} %% ...
#' @note %% ~~further notes~~
#' @author Daniel Padfield
#' @seealso \code{\link{Eilers_PI}} for fitting an alternative photosynthesis
#' irradiance curve. \code{\link{Pmax}} for getting the maximal photosynthetic
#' rate of the Platt fitted curve.
#' @references Platt, T., Sathyendranath, S. & Ravindran, P. (1990) Primary
#' production by phytoplankton : analytic solutions for daily rates per unit
#' area of water surface. Proceedings: Biological Sciences, 241, 101–111.
#' @keywords ~kwd1 ~kwd2
#' @examples
#' 
#' 
#' 
#' @export Platt_PI
Platt_PI <- function(I,ps,alpha,beta){
  pi<-ps*(1-exp(-alpha*I/ps))*exp((-beta*I)/ps)
  return(pi)
}
