#' plot map
#'
#' uses ggplot2
#'
#' @import ggplot2
#' @export

bd_plot <-
  function(level = "country"){

    if(level %in% c("country", "division", "district", "upazilla")){
      ggplot2::ggplot(get(paste0("map_", level))) + ggplot2::geom_sf() + ggplot2::theme_void()
    }else {
      stop("incorrect level name")
    }
  }
