#' get center coordinates
#'
#' uses sf
#'
#' @import sf
#' @export

bd_search <-
    function(searchFor, level = "division", as.is = F, coordinates = F){
        
        level = tolower(level)
        if(as.is){
            searchFor <- paste0("^", searchFor, "$")
        }
        switch (level,
                
                division = {
                    
                    i <- with(bangladesh::area_names, grepl(searchFor, paste(Division), ignore.case = T))
                    r <- bangladesh::area_names[i,]
                    if(nrow(r) == 0){warning("No Result Found")}
                    if(!coordinates){
                        return(r) 
                    }
                    else {
                        m <- merge(bangladesh::map_union,r)
                        c <- suppressWarnings(data.frame(st_coordinates(st_centroid(m))))
                        r <- with(m, data.frame(Division,District,Upazila, Union, lat = c[[2]], lon = c[[1]]))
                        return(r)
                    }
                },
                district = {
                    i <- with(bangladesh::area_names, grepl(searchFor, paste(District), ignore.case = T))
                    r <- bangladesh::area_names[i,]
                    if(nrow(r) == 0){warning("No Result Found")}
                    if(!coordinates){
                        return(r) 
                    }
                    else {
                        m <- merge(bangladesh::map_union,r)
                        c <- suppressWarnings(data.frame(st_coordinates(st_centroid(m))))
                        r <- with(m, data.frame(Division,District,Upazila, Union, lat = c[[2]], lon = c[[1]]))
                        return(r)
                    }
                },
                upazila = {
                    i <- with(bangladesh::area_names, grepl(searchFor, paste(Upazila), ignore.case = T))
                    r <- bangladesh::area_names[i,]
                    if(nrow(r) == 0){warning("No Result Found")}
                    if(!coordinates){
                        return(r) 
                    }
                    else {
                        m <- merge(bangladesh::map_union,r)
                        c <- suppressWarnings(data.frame(st_coordinates(st_centroid(m))))
                        r <- with(m, data.frame(Division,District,Upazila, Union, lat = c[[2]], lon = c[[1]]))
                        return(r)
                    }
                },
                union = {
                    i <- with(bangladesh::area_names, grepl(searchFor, paste(Union), ignore.case = T))
                    r <- bangladesh::area_names[i,]
                    if(nrow(r) == 0){warning("No Result Found")}
                    
                    if(!coordinates){
                        return(r) 
                    }
                    else {
                        m <- merge(bangladesh::map_union,r)
                        c <- suppressWarnings(data.frame(st_coordinates(st_centroid(m))))
                        r <- with(m, data.frame(Division,District,Upazila, Union, lat = c[[2]], lon = c[[1]]))
                        return(r)
                    }
                },
                all = {
                    i <- with(bangladesh::area_names, grepl(searchFor, paste(Division,District,Upazila, Union),
                                                            ignore.case = T))
                    r <- bangladesh::area_names[i,]
                    if(nrow(r) == 0){warning("No Result Found")}
                    if(!coordinates){
                        return(r) 
                    }
                    else {
                        m <- merge(bangladesh::map_union,r)
                        c <- suppressWarnings(data.frame(st_coordinates(st_centroid(m))))
                        r <- with(m, data.frame(Division,District,Upazila, Union, lat = c[[2]], lon = c[[1]]))
                        return(r)
                    }
                },
                stop('incorrect level name. should be one of: "all", "division", "district", "upazila","union')
        )
    }


