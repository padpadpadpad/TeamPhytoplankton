## compiling data from Oxylab



#' Binds desired O2 view files together
#' 
#' Takes a list of files and binds them together at the desired number of
#' seconds. If you have a load of files all starting at the same number of
#' seconds (eg first light on at 180 seconds) the code will cut all the data at
#' that point.
#' 
#' O2 view files unfortunately do not have continuous values in the Light
#' column. Instead only the changes in light are recorded. This function
#' completes the light column by taking the last value in the column and
#' filling all the rows until the next value.
#' 
#' After running the code you are left with a four column data frame (O2, time,
#' light, identifier)
#' 
#' identifier - the identifier is the name of each file without the extension
#' added. So I cannot stress the importance of having logical names for each
#' file!
#' 
#' @param x A list of O2 view files
#' @param start.row The row at which you want data to be collected from
#' @return %% ~Describe the value returned %% If it is a LIST, use %%
#' @note Prerequisite packages: library(data.table) library(plyr)
#' library(tools) library(zoo)
#' @author %% ~~who you are~~
#' @seealso %% ~~objects to See Also as \code{\link{help}}, ~~~
#' @references %% ~put references to the literature/web site here ~
#' @keywords ~kwd1 ~kwd2
#' @examples
#' 
#' Used with ldply, it takes each value of the list and does the function on that data, before combining it all into a single dataframe.
#' 
#' Example of use:
#' 
#' #Create list of files
#' list.of.files <- list(‘where the files are’, full = TRUE)
#' 
#' combined.data <- ldply(list.of.files, read_data, start.row = 180)
#' 
#' ## The function is currently defined as
#' read_data <- function (x, start.row) 
#' {
#'     library(data.table)
#'     library(plyr)
#'     library(tools)
#'     library(zoo)
#'     file <- x
#'     data <- read.table(file, skip = 96, header = FALSE, fill = TRUE, 
#'         sep = ",")
#'     data <- data[, c(1, 2, 8)]
#'     row.n <- nrow(data) - 2
#'     data <- data[1:row.n, ]
#'     colnames(data) <- c("time", "O2", "light")
#'     data$time <- as.numeric(as.character(data$time))
#'     data <- data[!is.na(data$time), ]
#'     data <- data[data$time >= start.row, ]
#'     data$light <- as.character(data$light)
#'     data$light <- substr(data$light, 4, nchar(data$light))
#'     data$light[nrow(data)] <- ""
#'     data$light[grep("Off", data$light)] <- 0
#'     data$light[!data$light %in% ""] <- as.numeric(unlist(regmatches(data$light, 
#'         gregexpr("[[:digit:]]+", data$light))))
#'     data$light <- as.numeric(data$light)
#'     data$light <- na.locf(data$light)
#'     data$identifier <- file_path_sans_ext(file)
#'     return(data)
#'   }
#'   
#' compiled.data <- ldply(list.of.my.files, read_data)
#' 
#' @export read_data
read_data <- function(x, start.row){
	
	# file name
	file <- x
	
	# load in data frame, always at row 97
	data <- read.table(file, skip = 96, header = FALSE, fill = TRUE, sep = ',')
	
	# select columns that are needed
	data <- data[,c(1, 2, 8)]
	
	# minus the last two rows
	row.n <- nrow(data) - 2
	data <- data[1:row.n,]
	
	# make column names
	colnames(data) <- c('time', 'O2', 'light')
	
	# make time and O2 numeric
	data$time <- as.numeric(as.character(data$time))
	
	# remove rows where time is NA
	data <- data[! is.na(data$time),]
	
	# remove rows at the beginning before the light goes on
	data <- data[data$time >= start.row,]
	
	# create light column
	data$light <- as.character(data$light)
	data$light <- substr(data$light, 4, nchar(data$light))
	data$light[nrow(data)] <- ''
	data$light[grep('Off', data$light)] <- 0
	data$light[! data$light %in% ''] <- as.numeric(unlist(regmatches(data$light, gregexpr('[[:digit:]]+', data$light))))
	data$light <- as.numeric(data$light)
	
	# make all the NAs the last logical value
	data <- data %>% tidyr::fill(light)
	
	# column for identifier
	data$identifier <- tools::file_path_sans_ext(file)
	
	return(data)
	
}

data <- data.frame(n = c(1,2,3,4,NA,5,6))

