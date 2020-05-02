library(tidyverse)
library(hrbrthemes)
library(scales)

grosses <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-04-28/grosses.csv', guess_max = 40000)

top_viewings <- grosses %>% 
  group_by(show) %>%
  summarize(num_seats = sum(seats_sold)) %>%
  arrange(desc(num_seats)) %>%
  top_n(15)

top_viewings %>%
  ggplot(aes(x = reorder(show, num_seats), y = num_seats)) + 
  geom_col(fill = "#76A8B0") + 
  labs(x = "Show", y = "# of Seats Sold",
       title = "Top 15 Broadway Shows by Seats Sold",
       subtitle = "#TidyTuesday Submission 2020-04-28",
       caption = "Twitter: @WavebreakData") + 
  scale_y_continuous(labels = comma) + 
  coord_flip() + 
  theme_ft_rc()
