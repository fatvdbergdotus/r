library(ggplot2)

loans <- read.csv("Z:/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects/loan_data.csv")

str(loans)
summary(loans)
head(loans)

loans$inq.last.6mths <- factor(loans$inq.last.6mths)
loans$delinq.2yrs <- factor(loans$delinq.2yrs)
loans$pub.rec <- factor(loans$pub.rec)
loans$not.fully.paid <- factor(loans$not.fully.paid)
loans$credit.policy <- factor(loans$credit.policy)

ggplot(loans,aes(x=fico)) +
  geom_histogram(aes(fill=not.fully.paid))

ggplot(loans, aes(x=purpose)) +
  geom_bar(position='dodge',aes(fill=not.fully.paid))

ggplot(loans, aes(x=int.rate, y=fico)) + geom_point(aes(color=credit.policy))

ggplot(loans, aes(x=int.rate, y=fico)) + geom_point(aes(color=not.fully.paid))

library(caTools)
split <- sample.split(loans$credit.policy,SplitRatio=0.7)
loans.train <- subset(loans,split==TRUE)
loans.test <- subset(loans,split==FALSE)

library(c1071)
model <- svm(not.fully.paid  ~ ., data = loans.train)
summary(model)
pred.values <- predict(model,loans.train[1:13])
table(pred.values,loans.train[,14])

cost.vector = c(100,200)
gamma.vector= c(0.1,0.2)

tune.results <- tune(svm,train.x=not.fully.paid~., data=loans.train,kernel='radial',
                     ranges=list(cost=cost.vector, gamma=gamma.vector))
summary(tune.results)

model <- svm(not.fully.paid  ~ ., data = loans.train, cost=100, gamma=0.1)
summary(model)
pred.values <- predict(model,loans.train[1:13])
table(pred.values,loans.train[,14])
