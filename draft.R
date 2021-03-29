library(ggplot2)
library(viridis)
ggplot(map_district) + 
  geom_sf(aes(fill = Division), show.legend = FALSE) + 
  geom_sf_label(aes(label = District), size = 2.5) + 
  scale_fill_viridis(discrete = T) + theme_void()


ggplot(covid_dist) +geom_sf(aes(fill = Case))+ 
    scale_fill_viridis(trans = "log10") + 
    theme(title = element_text("Covid-19 Total Case by District")) ->g


plot_gg(g, zoom = 0.7)
#render_movie("covid", frames = 75, fps = 15)