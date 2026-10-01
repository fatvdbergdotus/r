library(ISLR)
head(iris)

install.packages('e1071')
library(e1071)
help("svm")

model <- svm(Species ~ ., data = iris)
summary(model)
pred.values <- predict(model,iris[1:4]) # never use your train data as set data!
table(pred.values,iris[,5])

help(tune)
tune.results <- tune(svm,train.x=iris[1:4],train.y=iris[,5],kernel='radial', ranges = list(cost=c(0.1,0.5,1,1.5,10),gamma=c(0.5,0.7,1,2)))
summary(tune.results)

model <- svm(Species ~ ., data = iris, cost=1, gamma=0.5)
summary(model)
pred.values <- predict(model,iris[1:4]) # never use your train data as set data!
table(pred.values,iris[,5])
