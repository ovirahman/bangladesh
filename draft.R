library(ggplot2)
library(viridis)
ggplot(map_district) + 
  geom_sf(aes(fill = Division), show.legend = FALSE) + 
  geom_sf_label(aes(label = District), size = 2.5) + 
  scale_fill_viridis(discrete = T) + theme_void()