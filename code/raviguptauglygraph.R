library(tidyverse)

sweaters <- read_csv(here::here("data/use_this_data", "holiday_sweaters-2020-12-15-clean.csv")) %>% 
  filter(hs_tf == "Yes") %>% 
  separate_rows(colors, sep = c(", ")) %>% 
  group_by(sweater) %>% 
  rownames_to_column("values")

ggplot(sweaters, aes(x = sweater, y = colors)) + geom_boxplot() +
  geom_dotplot(aes(color = colors), binwidth = 3) +
  labs(title = "Useful Graph",
       subtitle = "haha jk",
       caption = "Look closely",
       x = "Things", 
       y = "List of colors") +
  facet_wrap(~hs_tf) +
  theme(plot.background = element_rect(fill = "#5a6c3f"),
        plot.title = element_text(size = 30, hjust = -1, color = "#b44b52"),
        plot.subtitle = element_text(size = 7, hjust = 1, color = "#4c44bb"),
        plot.caption = element_text(size = 3, color = "#00ffd1"),
        axis.title.x = element_text(size = 15, color = "#94846b"),
        axis.title.y = element_text(size = 15, color = "#8ba15e"),
        axis.text.x = element_text(size = 3, color = "#fce7b8"),
        axis.text.y = element_text(size = 5, color = "#3d003d"),
        strip.background = element_rect(fill = "#666600"),
        strip.text = element_text(size = 20, color = "#e7fffa"),
        legend.background = element_rect(fill = "#5c3d18"),
        legend.text = element_text(size = 10, color = "#ffcb94"),
        legend.title = element_text(size = 4, color = "#94c8ff"),
        )

ggsave(here::here("figures/an-plot.jpg"), width = 7, height = 4, dpi = 150)

