df.train <- read.csv("z:/titanic_train.csv")
df.test <- read.csv("z:/titanic_test.csv")

install.packages("Amelia")
library(Amelia)
library(ggplot2)
library(dplyr)

missmap(df.train, main = 'Missing map', col = c("red","blue"))
ggplot(df.train,aes(Survived)) + geom_bar()
ggplot(df.train,aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)))
ggplot(df.train,aes(Sex)) + geom_bar(aes(fill=factor(Sex)))

ggplot(df.train,aes(Age)) + geom_histogram(bins=20, alpha=0.5, fill="Blue")
ggplot(df.train,aes(Fare)) + geom_histogram(bins=20, alpha=0.5, fill="Blue", color="Black")
ggplot(df.train,aes(SibSp)) + geom_bar()
ggplot(df.train,aes(Parch)) + geom_bar()

ggplot(df.train,aes(Pclass,Age)) +
geom_boxplot(aes(group=Pclass,fill=factor(Pclass), alpha=0.4)) +
scale_y_continuous(breaks=seq(min(0),max(80),by=4))

## imputation of age based on class
impute_age <- function(age,class){
  out<-age
  for (i in 1:length(age)){
    if (is.na(age[i])){
      if(class[i]==1) { out[i]<- 37}
      else if(class[i]==2) { out[i]<- 29}
      else { out[i]<- 24}
    }
    else { out[i]<-age[i] }
  }
  return (out)
}

fixed.ages <- impute_age(df.train$Age,df.train$Pclass)
df.train$Age <- fixed.ages
# df.train <- df.train %>% select (-age)

missmap(df.train, main = 'Missing map', col = c("red","blue"))

str(df.train)
df.train <- select(df.train,-PassengerId,-Name,-Ticket,-Cabin)
head(df.train)

df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)

log.model <- glm(Survived ~ ., family = binomial(link = 'logit'), data=df.train)
summary(log.model)

library(caTools)
set.seed(101)
split <- sample.split(df.train$Survived,SplitRatio=0.7)
final.train <- subset(df.train,split==TRUE)
final.test <- subset(df.train,split==FALSE)

final.model <- glm(Survived ~ ., family = binomial(link = 'logit'), data=final.train)
fitted.probabilities <- predict(final.model, final.test, type="response")
fitted.results <- ifelse(fitted.probabilities>0.5,1,0)
misClassError <- mean(fitted.results!=final.test$Survived)

# confustion matrix
table(final.test$Survived,fitted.probabilities>0.5)
