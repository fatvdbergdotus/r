import(ggplot2)

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

read.csv("Z:/working_dir/Economist_Assignment_Data.csv") %>%
  ggplot(aes(x=CPI, y=HDI)) +
  geom_point(aes(color=Region), size=5, shape=21) +
  geom_smooth(aes(group=1), method = 'lm', formula = y ~ log(x), se = FALSE, color = 'red') +
  geom_text(aes(label = Country), color = "gray20", 
            data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE) +
  theme_bw() +
  scale_x_continuous(name = "xlabelgoeshere", limits = c(2,10), breaks = 1:10) +
  scale_y_continuous(name = "ylabelgoeshere", limits = c(0,1), breaks = (0:5)/5) +
  ggtitle("Titlegoeshere")
