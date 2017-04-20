#' add progress comment
#' 
#' adds a comment to the progress file of standard format
#' 
#' @param text comment to add to progress file
#' 
#' @export

add_progress_comment <- function(text){
  cat(paste('\n', text, Sys.time(), sep = ' '), file = progress_file, append = T)
}