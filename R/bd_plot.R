#' plot map
#'
#' uses ggplot2
#'
#' @import tmap
#' @export

bd_plot <-
  function(level = "country", type = "static"){

    switch (type,
      static = {tmap_mode("plot")},
      interactive = {tmap_mode("view")},
      stop('incorrect plotting mode. should be one of: "static", "interactive"')
    )

    switch (level,
      country = {
        tm_shape(map_country) + tm_polygons(col = "Country", id = "Country")
      },
      division = {
        tm_shape(map_division) + tm_polygons(col = "Division", id = "Division")
      },
      district = {
        tm_shape(map_district) + tm_polygons(col = "Division", id = "District")
      },
      upazilla = {
        tm_shape(map_upazilla) + tm_polygons(col = "Division", id = "Upazilla")
        },
      stop('incorrect level name. should be one of: "country", "division", "district", "upazilla"')
    )
  }



# bd_plot <-
#   function(level = "country"){
#
#     if(level %in% c("country", "division", "district", "upazilla")){
#       ggplot2::ggplot(get(paste0("map_", level))) + ggplot2::geom_sf() + ggplot2::theme_void()
#     }else {
#       stop("incorrect level name")
#     }
#   }
