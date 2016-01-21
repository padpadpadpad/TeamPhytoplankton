SH.Tmin <- function(data, prop, Tc, K = 'Y', id.col, range) {
  
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
      
      min2 <- max(temp$K[which(temp$pred < log(exp(data[, 'bTpeak'][data[,id.col] == id2[i]]) * prop) & temp$K < (data[, 'Topt'][data[,id.col]== id2[i]] + 273.15))]) - 273.15
    }
    
    if(K == 'Y'){
      temp <- data.frame(expand.grid(K = seq(data[, 'Topt'][data[,id.col] == id2[i]] - range/2, data[, 'Topt'][data[,id.col] == id2[i]] + range/2, 0.1), id = id2[i]))
      temp$pred <-  schoolfield.high(ln.c = data[, 'ln.c'][data[,id.col] == id2[i]],
                                     Ea = data[, 'Ea'][data[,id.col] == id2[i]],
                                     Eh = data[, 'Eh'][data[,id.col] == id2[i]],
                                     Th = data[, 'Th'][data[,id.col] == id2[i]],
                                     temp = temp$K,
                                     Tc = Tc)
      
      min2 <- max(temp$K[which(temp$pred < log(exp(data[, 'bTpeak'][data[,id.col] == id2[i]]) * prop) & temp$K < (data[, 'Topt'][data[,id.col]== id2[i]]))])
    }
    
    min <- rbind(min, min2)
    
  }
  
  return(as.vector(min))
  
}