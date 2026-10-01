install.packages('rpart')
install.packages('rpart.plot')
library(rpart)
library(rpart.plot)
help(rpart)

str(kyphosis)
head(kyphosis)

tree <- rpart(Kyphosis ~ ., method='class', data=kyphosis)
printcp(tree)
prp(tree)

install.packages('randomForest')
library(randomForest)
rf.model <- randomForest(Kyphosis ~ ., data=kyphosis)
print(rf.model)
