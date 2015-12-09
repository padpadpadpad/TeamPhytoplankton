############################## quasi r-squared nls ###############################

quasi.rsq.nls <- function(mdl, y, param){
  adj <- (sum(!is.na(y)) - 1)/(sum(!is.na(y)) - param)
  sum.sq <- (sum(!is.na(y)) - 1)*var(y, na.rm = TRUE)
  rsq <- 1 - (deviance(mdl)/sum.sq)
  rsq.adj <- 1 - adj*(1 - rsq)
  return(rsq.adj)  
  
}