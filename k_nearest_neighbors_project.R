install.packages("ISLR")
library(ISLR)
library(dplyr)
str(iris)

sd.iris <- mutate_at(iris, c(1,2,3,4), funs(c(scale(.))))
var(sd.iris[,1])
var(sd.iris[,2])
var(sd.iris[,3])
var(sd.iris[,4])

library(caTools)
split <- sample.split(sd.iris$Species,SplitRatio=0.7)
iris.train <- subset(sd.iris,split==TRUE)
iris.test <- subset(sd.iris,split==FALSE)

iris.train[1:4]
iris.train[,5]
iris.test[1:4]

library(class)
set.seed(101)
iris.predicted <- knn(iris.train[1:4],iris.test[1:4],iris.train[,5],k=5)
error.rate <- mean(iris.test[,5] != iris.predicted)

error.rates <- NULL
for (i in 1:20){
  set.seed(101)
  iris.predicted <- knn(iris.train[1:4],iris.test[1:4],iris.train[,5],k=i)
  error.rates[i] <- mean(iris.test[,5] != iris.predicted)
}

library(ggplot2)
k.values <- 1:20
error.df <- data.frame(error.rates,k.values)
ggplot(error.df,aes(k.values,error.rates)) + geom_point() + geom_line()