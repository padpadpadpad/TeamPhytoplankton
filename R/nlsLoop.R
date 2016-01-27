#########################################################
################### nlsLoop



# function
nlsLoop <- function(data, model, tries, id_col, param_bds, r2 = 'N', supp.errors = 'N', ...){
  
  # load prerequisites
  library(minpack.lm)
  
  formula <- as.formula(model)
  
  # set up dataframe for parameter bounds
  # set up dataframe for parameter bounds
  params_bds1 <- all.vars(formula[[3]])
  params_bds <- params_bds1[! params_bds1 %in% colnames(data)]
  params <- unique(params_bds)
  params_bds <- data.frame(param = params_bds, stringsAsFactors = FALSE)

  params_bds$low.bds <- NA
  params_bds$high.bds <- NA
  
  if(missing(param_bds)){
    cat('No boundaries specified for the sought parameters. \n',
        'Default values of +/- 1e+10 will be used. This is likely to slow the process of finding the best model. \n')
    r <- readline("Continue with default values [y/n]? ")
    if(tolower(r) == "y") {
      params_bds$low.bds <- 10^-10
      params_bds$high.bds <- 10^10
    }
    if(tolower(r) == "n"){
      stop('Please enter upper and lower parameter boundaries as param_bds in function argument.')
    }
    
  }
  
  else {
    
    for(i in 1:nrow(params_bds)){
      params_bds$low.bds[i] <- param_bds[(2*i)-1]
      params_bds$high.bds[i] <- param_bds[2*i]
    }
    
  }
  
  # nlsLM controls - this can stay the same, potential to be overridden
  cont.nlsLM <-nls.lm.control(maxiter = 1000, ftol = .Machine$double.eps, ptol = .Machine$double.eps) 
  
  # create a unique id vector
  id <- unique(data[,id_col])
  
  # create a dataframe for to output your results of the model into
  res <- data.frame(id_col = id)
  res[,2:(nrow(params_bds) + 1)] <- 0
  colnames(res) <- c(id_col, params_bds$param)
  res$AIC <- 0
  res$quasi.r2 <- 0

  
  strt <- NULL
  
  for(i in 1:length(params)){
    strt_values <- data.frame(param = rep(params[i], times = tries), 
                              value = runif(tries, min = params_bds$low.bds[params_bds$param == params[i]], max = params_bds$high.bds[params_bds$param == params[i]]))
    strt <- rbind(strt, strt_values)
    
  }
  
  # fit nls model using LM optimisation and using shotgun approach to get starting values
  for (i in 1:length(id)){
    cat('\n', i, 'of', length(id), ':', id[i], '\n')
    fit <- NULL
    # subset the dataframe to fit the model for each unique curve by id
    data.fit <- data[data[,id_col] == id[i],]
    for (j in 1:tries){
      if((j/10) %% 1 == 0){cat(j, ' ')}
      # create start list
      start.vals <- list()
      for(k in 1:length(params)){
        start.vals[[params[k]]] <- strt[strt$param == params[k],]$value[j]
      }
      # try and fit the model for every set of searching parameters
      if(supp.errors == 'Y'){
        try(fit <- minpack.lm::nlsLM(formula, 
                       start=start.vals,
                       control = cont.nlsLM,
                       data=data.fit, ...),
          silent = TRUE)}
      if(supp.errors != 'Y'){
          try(fit <- nlsLM(formula, 
                       start=start.vals,
                       control = cont.nlsLM,
                       data=data.fit, ...))}
      
      # if it is the first fit of the model, output the results of the model in the dataframe
      # if the AIC score of the next fit model is < the AIC of the fit in the dataframe, replace
      # the output to ensure the best model is selected
      if(!is.null(fit) && res[i, 'AIC'] == 0 | !is.null(fit) && res[i, 'AIC'] > AIC(fit)){
        
        res[i, 'AIC'] <- AIC(fit)
        if(r2 == 'Y') {res[i, 'quasi.r2'] <- quasi.rsq.nls(mdl = fit, y = data.fit[colnames(data.fit) == formula[[2]]], param = length(params))}
        for(k in 1:length(params)){
          res[i, params[k]] <- as.numeric(coef(fit)[k])
        }
      }
    }
  }
  
  if(r2 == 'N') {res <- res[,-grep('quasi.r2', colnames(res))]}
  if(supp.errors == 'Y'){cat('\nWarning - Errors have been suppressed from nlsLM().\n')}
  if(r2 == 'Y'){cat('Warning - R squared values for non-linear models should be used with caution. See references in ?quasi.r2 for details.\n')}
  
  return(res)

}