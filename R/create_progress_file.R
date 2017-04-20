#' Progress file creator
#' 
#' Creates a progress file in a desired location
#' 
#' @param path path within which the file is created
#' @param name name of file. Defaults to date_time_progress.txt
#' @author Daniel Padfield
#' @details Creates a progress file in a desired location and loads the name of the file into the global environment. Allows for the progress of long scripts to be tracked by adding updates into the file.
#' @export

create_progress_file <- function(path, name = NULL){
  if(is.null(name)){name <- paste(format(Sys.time(), '%Y%m%d_%H:%M_'), 'progress.txt', sep = '')}
  file.create(file.path(path, name))
  assign('progress_file', file.path(path, name), envir = globalenv())
  cat(paste('Run started at ', Sys.time()), file = progress_file)
}
