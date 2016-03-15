

#' Dataset of photosynthesis irradiance curves
#' 
#' Photosynthesis irradiance curves of Chlorella vulgaris taken at different
#' assay temperatures. The culture was grown at 20ºC
#' 
#' %% ~~ If necessary, more details than the __description__ above ~~
#' 
#' @name PI_data
#' @docType data
#' @format A data frame with 68 observations on the following 3 variables.
#' \describe{ \item{list("GPP")}{the rate of gross photosynthesis at each light
#' level} \item{list("light")}{the light intensity} \item{list("temp")}{the
#' assay temperature at which the rate was measured} }
#' @references %% ~~ possibly secondary sources and usages ~~
#' @source %% ~~ reference to a publication or URL from which the data were
#' obtained ~~
#' @keywords datasets
#' @examples
#' 
#' data(PI_data)
#' 
#' library(ggplot2)
#' 
#' ggplot(PI_data) +
#'   geom_point(aes(light, GPP), shape = 21) +
#'   facet_wrap(~ temp) +
#'   theme_bw()
#' 
#' 
NULL





#' Team Phytoplankton Functions
#' 
#' A place for all Team Phytoplankton functions to make our lives a little
#' easier
#' 
#' Just thought I would put all the functions Team Phytoplankton use regularly
#' into a fancy little package. Is a work in progress but currently the
#' functions included are:
#' 
#' boltzmann()
#' 
#' schoolfield.high()
#' 
#' std.error()
#' 
#' read_data() - for O2 view files
#' 
#' Pmax()
#' 
#' Platt_PI()
#' 
#' Topt()
#' 
#' FSCtoMicron()
#' 
#' inv.temp()
#' 
#' quasi.rsq.nls()
#' 
#' Eilers_PI()
#' 
#' nlsLoop()
#' 
#' @name TeamPhytoplankton
#' @aliases TeamPhytoplankton TeamPhytoplankton
#' @docType package
#' @author Daniel Padfield
#' 
#' Maintainer: Daniel Padfield - d.padfieldscfc@@gmail.com
#' @seealso GitHub link - https://github.com/padpadpadpad/TeamPhytoplankton
#' @references
#' @keywords package
#' @examples
#' 
#' ~~ simple examples of the most important functions ~~
#' 
NULL



