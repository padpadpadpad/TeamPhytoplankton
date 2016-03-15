#' Calculates Tmin for the Thomas TRC
#' 
#' Calculates the Tmin for the thermal response curve by subtracting w/2 onto
#' Topt.
#' 
#' %% ~~ If necessary, more details than the description above ~~
#' 
#' @param Topt The parameter Tmax
#' @param w The parameter w
#' @return returns the Tmin for the Thomas TRC. The lowest temperature at which
#' the rate is no longer positive.
#' @note %% ~~further notes~~
#' @author Daniel Padfield
#' @seealso %% ~~objects to See Also as \code{\link{help}}, ~~~
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
#' 
#' @export Thomas.Tmin
Thomas.Tmin <- function(Topt, w){
  return(Topt - w/2)
}
