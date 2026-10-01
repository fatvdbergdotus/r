install.packages("plotly")
library(ggplot2)
library(plotly)

pl <- ggplot(mtcars, aes(x=mpg,y=wt)) + geom_point()

gpl <- ggplotly(pl)
print(gpl)


# histrogram using ggplotly
df <- data.frame (type=rep(1:2, each=1000), subtype=rep(c("a","b"), each=500), value=rnorm(4000, 0,1))
ggplotly(
  ggplot(df, aes(x=value, fill=subtype)) +
  geom_histogram(position="identity", alpha=0.4)+
  facet_grid(. ~ type) 
)