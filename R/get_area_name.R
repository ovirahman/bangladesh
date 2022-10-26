#' get area names in English, available in the shapefiles
#'
#' @return A data frame with area names in English
#' @examples
#' names <- get_area_names()
#'
#' @export

get_area_names <-
  function(){
    bangladesh::area_names
  }

