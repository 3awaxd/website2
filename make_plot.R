library(tidyverse)

x <- read_rds("clean_data.rds")

month_breaks <- seq(0, 48, by = 4)
month_labels <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan")

billboard_plot <- x |>
  ggplot(aes(x = week_num, y = rank, color = song_artist)) +
  geom_line(linewidth = 1.2, alpha = 0.8) +
  geom_point(size = 2) +
  scale_y_reverse(limits = c(100, 1)) +
  scale_x_continuous(breaks = month_breaks, labels = month_labels) +
  scale_color_manual(values = c("#FF6B6B", "#4ECDC4", "#45B7D1", "#96CEB4", "#FFEEAD")) +
  labs(title = "Billboard Top 100: Top 5 Songs in Jul 2000",
       subtitle = "Tracking rank changes from Jan to Dec 2000",
       x = "Month",
       y = "Chart Position",
       color = "Song (Artist)") +
  theme_minimal() +
  theme(legend.position = "bottom")

ggsave("billboard.png", billboard_plot)
