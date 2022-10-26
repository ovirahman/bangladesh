#' get partial maps for divisions
#' @param divisions character vector for division names. Can take multiple divisions.
#' @param level administrative level of bangladesh. Should be one of: "division", "district", "upazila","union'
#' @return shapefile for given administrative level
#' @examples
#' get_divisions(divisions = "Sylhet",level =  "upazila")
#' @export

get_divisions <-
  function(divisions, level = "division"){
    n <- c("Barisal", "Chittagong", "Dhaka", "Khulna", "Mymensingh", "Rajshahi", "Rangpur", "Sylhet")
    if(!all(divisions %in% n)){
      stop('Incorrect division name. Should match: "Barisal", "Chittagong", "Dhaka", "Khulna", "Mymensingh", "Rajshahi", "Rangpur", "Sylhet"')
    }

    level = tolower(level)

    switch (level,
            division = {
              return(bangladesh::map_division[bangladesh::map_division$Division %in% divisions,])
            },
            district = {
              return(bangladesh::map_district[bangladesh::map_district$Division %in% divisions,])
            },
            upazila = {
              return(bangladesh::map_upazila[bangladesh::map_upazila$Division %in% divisions,])
            },
            union = {
              return(bangladesh::map_union[bangladesh::map_union$Division %in% divisions,])
            },
            stop('Incorrect level name. Should be one of: "division", "district", "upazila","union')
    )
  }

