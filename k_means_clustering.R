library(ISLR)
library(ggplot2)

head(iris)

ggplot(iris,aes(Petal.Length,Petal.Width,color=Species)) + geom_point(size=4)

cluster <- kmeans(iris[,1:4],3,nstart=20)
cluster

table(cluster$cluster,iris$Species)

library(cluster)
clusplot(iris,cluster$cluster,color = T, shade = T, labels = 0, lines = 0) # plots the 2 features with the most variablility

