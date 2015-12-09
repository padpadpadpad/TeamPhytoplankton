######## creating a column for the inverse of temperature - centres temperature data to for running linear models

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