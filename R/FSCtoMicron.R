############# FSC to µm ##############



#' Converts FSC.H to micrometres
#' 
#' Uses the results of a linear regression to convert values of FSC.H on the
#' ESI BD Accuri C6 to values of micrometres
#' 
#' Uses an equation of µm = 1.036827e-05*FSC.H + 1.041811
#' 
#' Uses raw values of FSC.H before it has been log transformed.
#' 
#' The graph of this regression is in the shared Dropbox and has an r squared
#' value of 0.78. So it isn't perfect but a very good approximate.
#' 
#' @param x vector of values of FSC.H to convert
#' @return %% ~Describe the value returned %% If it is a LIST, use %%
#' @author Daniel Padfield
#' @seealso %% ~~objects to See Also as \code{\link{help}}, ~~~
#' @references %% ~put references to the literature/web site here ~
#' @examples
#' 
#' data <- data.frame(length = c(1,  2,  4, 6, 10, 15), FSC.H = c(58127.95,   72891.38,  339312.54,  619733.87, 1096084.37, 1767728.37))
#' 
#' FSCtoMicron(data$FSC.H)
#' 
#' 
#' @export FSCtoMicron
FSCtoMicron <- function(x){
  return(1.036827e-05*x + 1.041811)
}
