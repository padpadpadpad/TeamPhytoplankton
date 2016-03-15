##### standard error function
	


#' Calculates the standard error
#' 
#' Calculates the standard error but takes into account whether NAs are present
#' or not
#' 
#' 
#' @param x vector of values to calculate standard error for (must be numeric)
#' @param na.action whether there are NAs in the data or not. Defaults to
#' FALSE. TRUE means that both the row including NA is excluded so both the
#' number of samples and the mean is affected
#' @return %% ~Describe the value returned %% If it is a LIST, use %%
#' \item{comp1 }{Description of 'comp1'} %% \item{comp2 }{Description of
#' 'comp2'} %% ...
#' @note %% ~~further notes~~
#' @author Daniel Padfield
#' @seealso %% ~~objects to See Also as \code{\link{help}}, ~~~
#' @references %% ~put references to the literature/web site here ~
#' @keywords ~kwd1 ~kwd2
#' @examples
#' 
#' y <- c(1,4,6,7,91,3,45,6,7,8,345,232,43423,5436, NA)
#' 
#' std.error(y)
#' NA
#' std.error(y, TRUE)
#' 3091.521
#' 
#' 
#' @export std.error
std.error <- function(x, na.action = c(FALSE, TRUE)){
  if(missing(na.action))
    na.action  <- FALSE
	sd(x, na.rm = na.action)/sqrt(length(na.omit(x)))
	}

##############################
