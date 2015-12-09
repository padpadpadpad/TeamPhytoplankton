## compiling data from Oxylab

read_data <- function(x, start.row){
	
	# load in required packages
	library(data.table)
	library(plyr)
	library(tools)
	library(tidyr)
	
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
	data <- data %>% fill(light)
	
	# column for identifier
	data$identifier <- file_path_sans_ext(file)
	
	return(data)
	
}

data <- data.frame(n = c(1,2,3,4,NA,5,6))

