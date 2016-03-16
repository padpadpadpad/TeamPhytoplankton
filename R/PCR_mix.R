#' PCR mix template
#' 
#' Produces a table of the amounts needed for a standard 10µl PCR mix with 1µl of DNA template.
#' 
#' @param reps the number of PCRs being run for a single primer set
#' @param extra the number of extras you want to calculate to account for pipetting error - defaults to 2
#' @author Daniel Padfield
#' @examples PCR_mix(14, 1)
#' PCR_mix(14,2)
#' PCR_mix(14)
#' 
#' @export PCR_mix



PCR_mix <- function(reps, extra = 2){
  PCR <- data.frame(Component = c('Master mix', 'F primer', 'R primer', 'Deionised water', 'Template DNA'), Vol_well_µl = c(5, 0.3, 0.3, 3.4, 1))
  PCR$Vol_total_run_µl <- PCR$Vol_well_µl * (reps + extra)
  print(PCR)
}