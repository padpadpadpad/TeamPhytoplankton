######## creating a column for the inverse of temperature - centres temperature data to for running linear models



#' Inverse of temperature
#' 
#' Function for creating a temperature centred value of temperature. Useful for
#' creating a column for linear modelling of data to make the intercept
#' meaningful
#' 
#' Calculated as either:
#' 
#' (1/ Boltzmann's constant / mean temperature) - (1 / Boltzmann's constant/
#' Temperature)
#' 
#' (1/ Boltzmann's constant / Tc) - (1 / Boltzmann's constant/ Temperature)
#' 
#' %% ~~ If necessary, more details than the description above ~~
#' 
#' @param x temperature data, can be K or ºC. Default is for Kelvin.
#' @param K Whether or not the data is in degrees centigrade or Kelvin.
#' Defaults to K.
#' @param Tc The desired normialised temperature. Without specification will
#' default to the mean temperature.
#' @return %% ~Describe the value returned %% If it is a LIST, use %%
#' @note %% ~~further notes~~
#' @author Daniel Padfield
#' @seealso %% ~~objects to See Also as \code{\link{help}}, ~~~
#' @references %% ~put references to the literature/web site here ~
#' @examples
#' 
#' x <- seq(313, 330, 1)
#' 
#' inv.temp(x)
#' inv.temp(x, Tc = 50) 
#' 
#' y <- seq(1,30,1)
#' inv.temp(y, 'N')
#' inv.temp(y, 'N', Tc = 15)
#' 
#' 
#' @export inv.temp
inv.temp <- function(x, K = c('Y', 'N'), Tc){
  
  if(missing(Tc)){
    if(missing(K)) return((1/8.62e-05/mean(x, na.rm = TRUE)) - (1/8.62e-05/x))
    if(K == 'Y') return((1/8.62e-05/mean(x, na.rm = TRUE)) - (1/8.62e-05/x))
    if(K == 'N') return((1/8.62e-05/(mean(x, na.rm = TRUE) + 273.15)) - (1/8.62e-05/(x + 273.15)))
  }
  else {
    if(missing(K)) return((1/8.62e-05/(273.15+Tc)) - (1/8.62e-05/(x)))
    if(K == 'Y') return((1/8.62e-05/(273.15+Tc)) - (1/8.62e-05/(x)))
    if(K == 'N') return((1/8.62e-05/(Tc + 273.15)) - (1/8.62e-05/(x + 273.15)))
  }
  
}
