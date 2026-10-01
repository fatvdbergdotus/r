# install.packages("ggplot2")
# install.packages("ggplot2movies")

library(ggplot2)

pl <- ggplot(data=mtcars, aes(x=mpg, y=hp))
pl + geom_point() + 
  facet_grid(cyl ~ .) + 
  stat_smooth() + 
  coord_cartesian(xlim = c(15,25))
  theme_bw()

# Histrogram  
library(ggplot2)
library(ggplot2movies)
ggplot(movies,aes(x=rating)) +
  geom_histogram(binwidth=0.1, aes(fill=..count..)) +
  xlab("RATING") + 
  ylab("NUMBER OF VOTES") +
  ggtitle("My Title")

# Scatterplot
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(aes(color=factor(cyl),size=10,shape=factor(cyl)))

# barplots
ggplot(mpg, aes(x=class)) +
  geom_bar(position="dodge",aes(fill=factor(drv)))

# boxplots
ggplot(mtcars, aes(x=factor(cyl), y=mpg)) +
  geom_boxplot(aes(fill=factor(cyl))) + coord_flip() + theme_bw()

# 2 variable plotting
ggplot(movies, aes(x=year,y=rating)) +
  geom_bin2d(binwidth=c(3,1)) + 
  scale_fill_gradient(high="red", low="green")

ggplot(movies, aes(x=year,y=rating)) +
  geom_hex() + 
  scale_fill_gradient(high="red", low="green")

ggplot(movies, aes(x=year,y=rating)) +
  geom_density2d() + 
  scale_fill_gradient(high="red", low="green")

# coordinates and faceting
ggplot (mpg,aes(x=displ,y=hwy))+
  geom_point() +
  coord_cartesian(xlim=c(1,4),ylim=c(15,30))

ggplot (mpg,aes(x=displ,y=hwy))+
  geom_point() +
  coord_fixed(ratio= 1/3)

ggplot (mpg,aes(x=displ,y=hwy))+
  geom_point() +
  facet_grid(drv ~ cyl)

# themes
install.packages("ggthemes")
library(ggthemes)

ggplot (mtcars, aes(x=wt, y=mpg)) +
  geom_point() +
  theme_wsj()


# exercises
library(ggplot2)
library(ggthemes)
head(mpg)

ggplot (mpg,aes(x=hwy)) + geom_histogram()

ggplot (mpg,aes(x=manufacturer)) + geom_bar(aes(fill=factor(cyl)))

ggplot (txhousing,aes(x=volume,y=sales)) + 
  geom_point(aes(alpha=median), size=5) +
  geom_smooth() +
  scale_fill_gradient(high="red", low="green")
