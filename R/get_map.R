#' get shapefile for different administrative levels
#'
#' @param level administrative level of bangladesh. Should be one of: "country", "division", "district", "upazila","union'
#' @return shapefile for given administrative level
#' @examples
#' country <- get_map("country")
#' division <- get_map("division")
#' district <- get_map("district")
#' @export

get_map <-
  function(level = "country"){
    level = tolower(level)

    switch (level,
            country = {
              return(bangladesh::map_country)
            },
            division = {
              return(bangladesh::map_division)
            },
            district = {
              return(bangladesh::map_district)
            },
            upazila = {
              return(bangladesh::map_upazila)
            },
            union = {
              return(bangladesh::map_union)
            },
            stop('Incorrect level name. Should be one of: "country", "division", "district", "upazila","union')
    )
  }

