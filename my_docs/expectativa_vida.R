library(gganimate)
library(gapminder)
data("gapminder")

ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, colour=country)) +
  geom_point(alpha=0.7, show.legend=FALSE) +
  geom_point(data=gapminder[gapminder$country=='Colombia', ], 
             aes(x=gdpPercap, y=lifeExp), colour="royalblue3", size=5) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  geom_text(aes(label=ifelse(country=='Colombia',
                             as.character(country), '')), 
            hjust=1, vjust=0, color='royalblue3', 
            show.legend=FALSE, size=4) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Año: {frame_time}', 
       x = 'Ingreso per cápita', 
       y = 'Expectativa de vida (años)') +
  transition_time(year) +
  ease_aes('linear') 



