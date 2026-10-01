df <- read.csv('z:/working_dir/student/student-mat.csv', sep=';')

library(ggplot2)
library(ggthemes)
library(dplyr)

install.packages('corrgram')
library(corrgram)
install.packages('corrplot')
library(corrplot)


# num only
num.cols <- sapply(df,is.numeric)
# filter
cor.data <- cor(df[,num.cols])
print(cor.data)

print(corrplot(cor.data,method='color'))
corrgram(df)
corrgram(df,order=TRUE,lower.panel=panel.shade,upper.panel=panel.pie,text.panel=panel.txt)

ggplot(df,aes(x=G3)) + geom_histogram(bins=20,alpha=0.5,fill='blue')

install.packages('caTools')
library(caTools)
# set a seed
set.seed(101)

# split up sample
sample <- sample.split(df$G3, SplitRatio = 0.7)
train <- subset(df,sample==TRUE)
test <- subset(df,sample==FALSE)

# Train and build model
model <- lm(G3 ~ . , train)

res <- residuals(model)
res <- as.data.frame(res)
head(res)
ggplot(res,aes(res))+geom_histogram(fill='blue',alpha=0.5)

# predictions
G3.predictions <- predict(model,test)
results <- cbind(G3.predictions,test$G3)
colnames(results) <- (c('predicted','actual'))
results <- as.data.frame(results)
print(head(results))
ggplot(results,aes(x=predicted,y=actual))+geom_point()+geom_smooth(method='lm')

# take care of negative values
to_zero <- function (x) {
  if (x<0) { return (0) }
  else { return (x) }
}

results$predicted <- sapply(results$predicted,to_zero)

mse <- mean((results$actual-results$predicted)^2)



# run model


# interpret model
summary(model)
