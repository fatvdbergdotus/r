install.packages('MASS')
library(MASS)
head(Boston)
str(Boston)

any(is.na(Boston))

data <- Boston
maxs <- apply(data,2,max) # maximum values of each column
mins <- apply(data,2,min)

help("scale")
data <- scale(data,center=mins,scale=maxs-mins) # substract the min and divide it by the distance between max and min
data <- as.data.frame(data)

head(data)

library(caTools)
split <- sample.split(data$medv, SplitRatio = 0.7)
train <- subset(data,split==TRUE)
test <- subset(data,split==FALSE)

install.packages('neuralnet')
library(neuralnet)
n <- names(train)
f <- as.formula(paste("medv ~", paste(n[!n %in% "medv"], collapse = "+")))
f
# edv ~ crim + zn + indus + chas + nox + rm + age + dis + rad +  tax + ptratio + black + lstat

nn <- neuralnet(f, data=train,hidden=c(5,3), linear.output = TRUE) # first hiden layer =5, second hidden layer =3
plot(nn)

predicted.nn.values <- compute(nn,test[1:13])
# undo the scaling step:
true.predictions <- predicted.nn.values$net.result * (max(Boston$medv)-min(Boston$medv))+min(Boston$medv)
test.r <- (test$medv) * (max(Boston$medv)-min(Boston$medv))+min(Boston$medv)
MSE.nn <- sum((test.r-true.predictions)^2)/nrow(test)
error.df <- data.frame(test.r,true.predictions)
head(error.df)

library(ggplot2)
ggplot(error.df,aes(x=test.r,y=true.predictions)) + geom_point() + stat_smooth()
