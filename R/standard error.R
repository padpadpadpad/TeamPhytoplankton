##### standard error function
	
std.error <- function(x, na.action = c(FALSE, TRUE)){
  if(missing(na.action))
    na.action  <- FALSE
	sd(x, na.rm = na.action)/sqrt(length(na.omit(x)))
	}

##############################