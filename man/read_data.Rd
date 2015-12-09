\name{read_data}
\alias{read_data}
\title{
Binds desired O2 view files together
}
\description{
Takes a list of files and binds them together at the desired number of seconds. If you have a load of files all starting at the same number of seconds (eg first light on at 180 seconds) the code will cut all the data at that point.

O2 view files unfortunately do not have continuous values in the Light column. Instead only the changes in light are recorded. This function completes the light column by taking the last value in the column and filling all the rows until the next value.

After running the code you are left with a four column data frame (O2, time, light, identifier)
}
\usage{
read_data(x, start.row)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A list of O2 view files
}
  \item{start.row}{
The row at which you want data to be collected from
}
}
\details{
identifier - the identifier is the name of each file without the extension added. So I cannot stress the importance of having logical names for each file!
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
Prerequisite packages:
  library(data.table)
  library(plyr)
	library(tools)
	library(zoo)
}


\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
Used with ldply, it takes each value of the list and does the function on that data, before combining it all into a single dataframe.

Example of use:

#Create list of files
list.of.files <- list(‘where the files are’, full = TRUE)

combined.data <- ldply(list.of.files, read_data, start.row = 180)

## The function is currently defined as
read_data <- function (x, start.row) 
{
    library(data.table)
    library(plyr)
    library(tools)
    library(zoo)
    file <- x
    data <- read.table(file, skip = 96, header = FALSE, fill = TRUE, 
        sep = ",")
    data <- data[, c(1, 2, 8)]
    row.n <- nrow(data) - 2
    data <- data[1:row.n, ]
    colnames(data) <- c("time", "O2", "light")
    data$time <- as.numeric(as.character(data$time))
    data <- data[!is.na(data$time), ]
    data <- data[data$time >= start.row, ]
    data$light <- as.character(data$light)
    data$light <- substr(data$light, 4, nchar(data$light))
    data$light[nrow(data)] <- ""
    data$light[grep("Off", data$light)] <- 0
    data$light[!data$light \%in\% ""] <- as.numeric(unlist(regmatches(data$light, 
        gregexpr("[[:digit:]]+", data$light))))
    data$light <- as.numeric(data$light)
    data$light <- na.locf(data$light)
    data$identifier <- file_path_sans_ext(file)
    return(data)
  }
  
compiled.data <- ldply(list.of.my.files, read_data)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
