library(tidyverse)
library(readxl)
pop_division_2011 <- readxl::read_xlsx("bgd_pop_2011_bd.xlsx",3)

names(pop_division_2011)

pop_division_2011 %>% rename(
  "division" = "admin1Name_en",
  "population" = "P"
) %>% select(-c(admin0Name_en, admin0Pcode)) -> pop_division_2011


mapdata <- left_join(map_division, pop_division_2011, by = c("Division" = "division"))

library(tmap)

tm_shape(mapdata) +tm_polygons(col = "population", style = "cont")

usethis::use_data(pop_division_2011)

pop_district_2011 <- read_xlsx("bgd_pop_2011_bd.xlsx", 2)

pop_district_2011 %>% rename(
  "district" = "admin2Name_en",
  "division" = "admin1Name_en",
  "population" = "P"
) %>% select(-c(admin0Name_en, admin0Pcode, admin2RefName)) -> pop_district_2011

mapdata <- left_join(map_district, pop_district_2011, by = c("District" = "district"))

tm_shape(mapdata) +tm_polygons(col = "population", style = "cont")

usethis::use_data(pop_district_2011)


pop_upazila_2011 <- read_xlsx("bgd_pop_2011_bd.xlsx", 1)

pop_upazila_2011 %>% rename(
  "upazila" = "admin3Name_en",
  "district" = "admin2Name_en",
  "division" = "admin1Name_en",
  "population" = "P"
) %>% select(-c(admin0Name_en,admin3RefName,ADM0_PCODE)) ->pop_upazila_2011

data.frame(map = (map_upazila$Upazila %>% unique() %>% sort()),
           data = pop_upazila_2011$upazila %>% unique() %>% sort()) %>% mutate(
             match = map == data
           ) %>% pull(match) %>% table()

mapdata <- left_join(map_upazila, pop_upazila_2011, by = c("Upazila" = "upazila"))
tmap_mode("view")
tm_shape(mapdata) +tm_polygons(id = "Upazila",col = "population", style = "cont")


usethis::use_data(pop_upazila_2011)
