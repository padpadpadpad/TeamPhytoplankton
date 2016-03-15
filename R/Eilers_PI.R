#################### Eilers and Peeters PI model ############################

############# modified from Edwards et al 2015 #####################



#' Fitting a photosynthesis-irradiance curve
#' 
#' Uses the Eilers & Peeters (1988) PI model to fit a model to photosynthesis
#' data across many light levels typically taken using the Oxylab system.
#' Benefits from modelling Pmax without any other derivatives so can test the
#' probability of the parameter.
#' 
#' When using nlsLoop, set the parameters lower limits to 0 as the equation has
#' two solutions and with equivalent AIC scores so could return some unwanted
#' negative values for some parameters.
#' 
#' @param Pmax The photosynthetic maxima
#' @param Iopt The optimal light intensity
#' @param a The initial slope of the curve
#' @param I Light
#' @return %% ~Describe the value returned %% If it is a LIST, use %%
#' \item{comp1 }{Description of 'comp1'} %% \item{comp2 }{Description of
#' 'comp2'} %% ...
#' @note %% ~~further notes~~
#' @author Daniel Padfield
#' @seealso \code{\link{Platt_PI}} for fitting an alternative photosynthesis
#' irradiance curve
#' @references Eilers, P.H.. & Peeters, J.C.. (1988) A model for the
#' relationship between light intensity and the rate of photosynthesis in
#' phytoplankton. Ecological Modelling, 42, 199–215.
#' @keywords ~kwd1 ~kwd2
#' @examples
#' 
#' 
#' 
#' @export Eilers_PI
Eilers_PI <- function(Pmax, Iopt, a, I){
  pi <- (Pmax*I)/((Pmax/(a*Iopt^2))*I^2 + ((1 - (2*Pmax)/(a*Iopt))*I) + (Pmax/a))
  return(pi)
}
