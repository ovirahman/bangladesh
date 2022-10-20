#' sample function for plotting map of different administrative levels
#'
#' uses tmap
#' @param level administrative level of bangladesh. Should be one of: "country", "division", "district", "upazila","union'
#' @param type  Plotting mode: "static" or "interactive"
#' @import tmap
#' @export

bd_plot <-
  function(level = "country", type = "static"){
    level = tolower(level)
    switch (type,
      static = {tmap_mode("plot")},
      interactive = {tmap_mode("view")},
      stop('incorrect plotting mode. should be one of: "static", "interactive"')
    )

    switch (level,
      country = {
        tm_shape(bangladesh::map_country) + tm_polygons(col = "Country", id = "Country", legend.show = FALSE)
      },
      division = {
        tm_shape(bangladesh::map_division) + tm_polygons(col = "Division",
                                                         id = "Division", legend.show = FALSE)+
          tm_text("Division")
      },
      district = {
        tm_shape(bangladesh::map_district) + tm_polygons(col = "Division", id = "District")
      },
      upazila = {
        tm_shape(bangladesh::map_upazila) + tm_polygons(col = "Division", id = "Upazila")
        },
      union = {
        tm_shape(bangladesh::map_union) + tm_polygons(col = "Division", id = "Union")
      },
      stop('Incorrect level name. Should be one of: "country", "division", "district", "upazila","union')
    )
  }

