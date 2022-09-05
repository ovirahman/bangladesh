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



########
map_country <- bangladesh::map_country
names(map_country)
class(map_country)
plot(map_country)
library(tidyverse)

map_country <- map_country %>% select(-c("ADM0_REF",  "ADM0ALT1EN", "ADM0ALT2EN", "date", "validOn", "validTo"))

plot(map_country)

class(map_country)
usethis::use_data(map_country, overwrite = T)


map_division <- bangladesh::map_division
names(map_division)

map_division <- map_division %>% select(-c("ADM1_REF", "ADM1ALT1EN", "ADM1ALT2EN", "date", "validOn", "validTo"))

plot(map_division)

usethis::use_data(map_division, overwrite = T)



map_district <- bangladesh::map_district
names(map_district)


map_district <- map_district %>% select(-c("ADM2_REF",  "ADM2ALT1EN", "ADM2ALT2EN", "date" , "validOn", "ValidTo"))

plot(map_district)


usethis::use_data(map_district, overwrite = T)



map_upazila <- bangladesh::map_upazila

names(map_upazila)


map_upazila <- map_upazila %>% select(-c("ADM3_REF", "ADM3ALT1EN", "ADM3ALT2EN", "date" , "validOn", "validTo" ))


plot(map_upazila)

usethis::use_data(map_upazila, overwrite = T)


map_union <- bangladesh::map_union

names(map_union)

map_union <- map_union %>% select(-c("ADM4_REF","ADM4ALT1EN", "ADM4ALT2EN", "date" , "validOn", "validTo"))


plot(map_union)


usethis::use_data(map_union, overwrite = T)


