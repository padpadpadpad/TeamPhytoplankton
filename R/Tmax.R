#' Calculates Tmax for the Thomas TRC
#' 
#' Calculates the Tmax for the thermal response curve by adding w/2 onto Topt.
#' 
#' 
#' @param Topt The parameter Tmax
#' @param w The parameter w
#' @return returns the Tmax for the Thomas TRC. The highest temperature at
#' which the rate is no longer positive.
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
#' 
#' @export Thomas.Tmax
Thomas.Tmax <- function(Topt, w){
  return(Topt + w/2)
}
