library(tidyverse)
scooby_raw <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-13/scoobydoo.csv")
scooby_raw %>%
  filter(monster_amount > 0) %>%
  count(monster_real)
scooby_raw %>%
  filter(monster_amount > 0) %>%
  count(
    year_aired = 10 * ((lubridate::year(date_aired) + 1) %/% 10),
    monster_real
  ) %>%
  mutate(year_aired = factor(year_aired)) %>%
  ggplot(aes(year_aired, n, fill = monster_real)) +
  geom_col(position = position_dodge(preserve = "single"), alpha = 0.8) +
  labs(x = "Date aired", y = "Monsters per decade", fill = "Real monster?")