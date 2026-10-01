library(ISLR)
library(dplyr)
head(College)

ggplot(College, aes(x=Room.Board, y=Grad.Rate)) +
  geom_point(aes(color=factor(Private)))

ggplot(College,aes(x=F.Undergrad)) +
  geom_histogram(aes(fill=Private))

ggplot(College,aes(x=Grad.Rate)) +
  geom_histogram(aes(fill=Private))

subset(College,Grad.Rate>100)

subset(College,Grad.Rate>100)
College$Grad.Rate[College$Grad.Rate >100] <- 100

library(caTools)
split <- sample.split(College$Private,SplitRatio=0.7)
College.train <- subset(College,split==TRUE)
College.test <- subset(College,split==FALSE)

tree <- rpart(Private ~ ., method='class', data=College.train)
predict <- predict(tree)
predict <- as.data.frame(predict)
joiner <- function (x){ ifelse(x>=0.5,'Yes','No') }
predict$Private <- sapply(predict$Yes,joiner)
table(predict$Private,College.train$Private)

library(rpart.plot)
prp(tree)


install.packages('randomForest')
library(randomForest)
rf.model <- randomForest(Private ~ ., data=College.train)
rf.model$confusion
rf.model$importance

p <- predict(rf.model,College.test)
table(p,College.test$Private)
