install.packages("ISLR")
library(ISLR)
str(Caravan)

# any N/A values?
any(is.na(Caravan))

var(Caravan[,1])
var(Caravan[,2])

purchase <- Caravan[,86]

standardized.Caravan <- scale(Caravan[,-86])
var(Caravan[,1])
var(Caravan[,2])

test.index <- 1:1000
test.data <- standardized.Caravan[test.index,]
test.purchase <- purchase[test.index]

train.data <- standardized.Caravan[-test.index,]
train.purchase <- purchase[-test.index]

### KNN model
library(class)
set.seed(101)
predicted.purchase <- knn(train.data,test.data,train.purchase,k=5)
head(predicted.purchase)

misclass.error <- mean(test.purchase != predicted.purchase)

# CHOOSING A K value
predicted.purchase <- NULL
error.rate <- NULL

for (i in 1:20){
  set.seed(101)
  predicted.purchase <- knn(train.data,test.data,train.purchase,k=i)
  error.rate[i] <- mean(test.purchase != predicted.purchase)
}

# visualize K elbow method
library(ggplot2)
k.values <- 1:20
error.df <- data.frame(error.rate,k.values)
ggplot(error.df,aes(k.values,error.rate)) + geom_point() + geom_line()
