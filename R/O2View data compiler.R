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
#' @param file.list A list of O2 view files
#' @param start.time The row at which you want data to be collected from
#' @return a dataframe of the combined Oxylab files with a column identifying each file
#' @author Daniel Padfield
#' @examples
#' 
#' Used with ldply, it takes each value of the list and does the function on that data, before combining it all into a single dataframe.
#' 
#' compiled.data <- ldply(list.of.my.files, read_data_Oxylab, start.time = 120)
#' 
#' @export read_data_Oxylab

read_data_Oxylab <- function(file.list, start.time){
  
  # file name
  file <- x
  
  # look for where the dataframe starts
  lines <- readLines(file)
  start <- grep('RECORDED DATA', lines)
  to_skip <- which(startsWith(lines, as.character(start.time)) == TRUE)
  to_skip <- to_skip[to_skip > start][1]
  
  # load in data frame, always at the row where the data starts
  data <- read.table(file, skip = start + 2, header = FALSE, fill = TRUE, sep = ',')
  row.start <- to_skip - 2 - start
  data <- data[row.start:nrow(data),]
  
  # minus the last three rows
  row.n <- nrow(data) - 3
  data <- data[1:row.n,]
  
  # select columns that are needed - depending on software used with Oxylab, this can be 1, 2, 8 or 1, 2, 7 - always the last column?
  data <- data[,c(1, 2, ncol(data))]
  
  # make column names
  colnames(data) <- c('Time', 'O2', 'lightlevel')
  
  # make time and O2 numeric
  data$Time <- as.numeric(as.character(data$Time))
  
  # remove rows where time is NA
  data <- data[! is.na(data$Time),]
  
  # create light column
  data$lightlevel <- as.character(data$lightlevel)
  
  # make lights off 0
  data$lightlevel[grep('Off', data$lightlevel)] <- 0
  
  # extract numbers from column - should be in the first row
  for(i in 1:length(nrow(data))){
    temp <- gregexpr("[0-9]+", data$lightlevel[i]) 
    try(
      data$lightlevel[i] <- tail(as.numeric(unique(unlist(regmatches(data$lightlevel[i], temp)))),1)
      , silent = T)
  }
  
  # make all lightlevels that are "", NA
  data$lightlevel[data$lightlevel == ''] <- NA
  
  # make all the NAs the last logical value
  data$lightlevel <- zoo::na.locf(data$lightlevel)
  
  # column for identifier
  data$identifier <- basename(file)
  
  return(data)
  
}
