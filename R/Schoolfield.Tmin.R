#' Empirically calculates the minimum temperature of a schoolfield.high model
#' fit
#' 
#' Creates a temporary dataframe of a wide range of temperatures (at 0.1 degree
#' increments) and predictions based on the parameters controlling the thermal
#' response curve. The thermal minima is the maximum temperature where the rate
#' is less than the threshold proportion of bTpeak below Topt.
#' 
#' This function has a few assumptions: nlsLoop or something similar has
#' compiled your dataframe of parameter estimates and that it is in a similar
#' format. That you have column names for each of your parameters and these
#' include optimum temperature (Topt) and peak rate (bTpeak). They have to be
#' the column names for the function to run.
#' 
#' @param data The parameter data frame
#' @param prop The proportion below bTpeak from which the thermal minima is to
#' be calculated
#' @param Tc The normalising temperature used in the original schoolfield.high
#' fits
#' @param K Whether or not Topt is in Kelvin. Defaults to 'Y'. To override
#' default use 'N'.
#' @param bTopt Name of the column for maximal rate.
#' @param id.col The column that identifies each curve. Is equivalent to the
#' id.col from nlsLoop.
#' @param range The range of temperatures from which you want the Kelvin to be
#' taken, is centred around the optimal temperature. For range = 500 and Topt =
#' 30, the temperatures would be from 30 - 250 and 30 + 250.
#' @return %% ~Describe the value returned %% If it is a LIST, use %%
#' @note %% ~~further notes~~
#' @author Daniel Padfield
#' @seealso %% ~~objects to See Also as \code{\link{help}}, ~~~
#' @references %% ~put references to the literature/web site here ~
#' @keywords ~kwd1 ~kwd2
#' @examples
#' 
#' 
#' @export SH.Tmin
SH.Tmin <- function(data, prop, Tc, K = 'Y', bTopt, id.col, range) {
  
  id2 <- unique(data[, id.col])
  
  min <- NULL
  
  for(i in 1:length(id2)){
    if(K == 'N'){
      temp <- data.frame(expand.grid(K = seq(data[, 'Topt'][data[,id.col] == id2[i]] - range/2 + 273.15, data[, 'Topt'][data[,id.col] == id2[i]] + range/2 + 273.15, 0.1), id = id2[i]))
      temp$pred <-  schoolfield.high(ln.c = data[, 'ln.c'][data[,id.col] == id2[i]],
                                     Ea = data[, 'Ea'][data[,id.col] == id2[i]],
                                     Eh = data[, 'Eh'][data[,id.col] == id2[i]],
                                     Th = data[, 'Th'][data[,id.col] == id2[i]],
                                     temp = temp$K,
                                     Tc = Tc)
      
      min2 <- max(temp$K[which(temp$pred < log(exp(data[, bTopt][data[,id.col] == id2[i]]) * prop) & temp$K < (data[, 'Topt'][data[,id.col]== id2[i]] + 273.15))]) - 273.15
    }
    
    if(K == 'Y'){
      temp <- data.frame(expand.grid(K = seq(data[, 'Topt'][data[,id.col] == id2[i]] - range/2, data[, 'Topt'][data[,id.col] == id2[i]] + range/2, 0.1), id = id2[i]))
      temp$pred <-  schoolfield.high(ln.c = data[, 'ln.c'][data[,id.col] == id2[i]],
                                     Ea = data[, 'Ea'][data[,id.col] == id2[i]],
                                     Eh = data[, 'Eh'][data[,id.col] == id2[i]],
                                     Th = data[, 'Th'][data[,id.col] == id2[i]],
                                     temp = temp$K,
                                     Tc = Tc)
      
      min2 <- max(temp$K[which(temp$pred < log(exp(data[, bTopt][data[,id.col] == id2[i]]) * prop) & temp$K < (data[, 'Topt'][data[,id.col]== id2[i]]))])
    }
    
    min <- rbind(min, min2)
    
  }
  
  return(as.vector(min))
  
}
