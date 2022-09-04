library(ggplot2)
library(viridis)
ggplot(map_district) + 
  geom_sf(aes(fill = Division), show.legend = FALSE) + 
  geom_sf_label(aes(label = District), size = 2.5) + 
  scale_fill_viridis(discrete = T) + theme_void()


ggplot(covid_dist) +geom_sf(aes(fill = Case), color = "grey90")+ 
    scale_fill_viridis(trans = "log10")  +
    ggtitle("Covid-19: District Wise Confirmed Cases")+
    theme(plot.title = element_text(size = 0.5)) +
    labs(fill = "Total Cases") +
    theme_minimal() ->g


plot_gg(g, zoom = 0.7, width = 5, height = 5)
render_depth(focallength=100,focus=0.72)
#render_movie("covid", frames = 75, fps = 15)