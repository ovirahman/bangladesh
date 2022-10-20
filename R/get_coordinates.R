#' get centroids of administrative areas
#'
#' uses sf
#' @param  level administrative level of bangladesh. Should be one of: "country", "division", "district", "upazila","union'
#' @import sf
#' @export

get_coordinates <-
  function(level = "division"){

    level = tolower(level)
    switch (level,

            division = {

              n <- with(bangladesh::map_division, data.frame(Division))

              c <- data.frame(st_coordinates(st_centroid(bangladesh::map_division$geometry)))

              return(data.frame(n, lat = c[[2]], lon = c[[1]]))
            },
            district = {
              n <- with(bangladesh::map_district, data.frame(Division, District))

              c <- data.frame(st_coordinates(st_centroid(bangladesh::map_district$geometry)))

              return(data.frame(n, lat = c[[2]], lon = c[[1]]))
            },
            upazila = {

              n <- with(bangladesh::map_upazila, data.frame(Division, District, Upazila))

              c <- data.frame(st_coordinates(st_centroid(bangladesh::map_upazila$geometry)))

              return(data.frame(n, lat = c[[2]], lon = c[[1]]))

            },
            union = {

              n <- with(bangladesh::map_union, data.frame(Division, District, Upazila, Union))

              c <- data.frame(st_coordinates(st_centroid(bangladesh::map_union$geometry)))

              return(data.frame(n, lat = c[[2]], lon = c[[1]]))

            },
            stop('incorrect level name. should be one of: "division", "district", "upazila","union')
    )
  }

