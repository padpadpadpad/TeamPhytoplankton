#' Calculates the volume of stock solution needed when making up working
#' solutions.
#' 
#' Uses the equation:
#' 
#' StockSolVol = (NewSolConc * NewSolVol) / StockSolConc
#' 
#' To work out the volume of your original solution (stock solution) you need
#' to make up the desired concentration of your new solution (eg. for a working
#' solution)
#' 
#' 
#' @param StockSolConc The concentration of your stock solution
#' @param NewSolConc The desired concentration of your new solution
#' @param NewSolVol The total volume of your new solution
#' @author Daniel Padfield
#' @keywords ~kwd1 ~kwd2
#' @examples
#' 
#' StockConc <- 100
#' DesiredConc <- 10
#' DesiredVol <- 50
#' 
#' StockSolVol(StockConc, DesiredConc, DesiredVol)
#' 
#' 
#' @export StockSolVol
StockSolVol <- function(StockSolConc, NewSolConc, NewSolVol) {
  return((NewSolConc*NewSolVol)/StockSolConc)
}
