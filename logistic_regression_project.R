adult <- read.csv('D:/utwente.svn/administration/udemy/r/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects/adult_sal.csv')
head(adult)
str(adult)
summary(adult)
library(dplyr)
adult <- select(adult,-X)

table(adult$type_employer)

make_unemployed <- function (type_employer) {
  ifelse(type_employer=='Never-worked' | type_employer=='Without-pay', 'Unemployed', type_employer)
}

make_sl_gov <- function (type_employer) {
  ifelse(type_employer=='Local-gov' | type_employer=='State-gov', 'SL-gov', type_employer)
}

make_self_emp <- function (type_employer) {
  ifelse(type_employer=='Self-emp-inc' | type_employer=='Self-emp-not-inc', 'self-emp', type_employer)
}

adult$type_employer <- sapply(adult$type_employer,make_unemployed)
adult$type_employer <- sapply(adult$type_employer,make_sl_gov)
adult$type_employer <- sapply(adult$type_employer,make_self_emp)


library(Amelia)
## missing data
adult[adult=='?'] <- NA
table(adult$type_employer)

adult$type_employer <- sapply(adult$type_employer,factor)
adult$country <- sapply(adult$country,factor)
adult$marital <- sapply(adult$marital,factor)

adult$education     <- sapply(adult$education    ,factor)
adult$occupation    <- sapply(adult$occupation   ,factor)
adult$relationship  <- sapply(adult$relationship ,factor)
adult$race          <- sapply(adult$race         ,factor)
adult$sex           <- sapply(adult$sex          ,factor)
adult$income        <- sapply(adult$income       ,factor)

missmap(adult)
# drop missing data
adult <- na.omit(adult)
adult <- subset(adult,country!='Holand-Netherlands')

ggplot(adult, aes(x=age)) + geom_histogram(aes(fill=income))
ggplot(adult, aes(x=hr_per_week)) + geom_histogram()

adult <- rename(adult,region = country)
#adult$region <- adult$country
#adult <- select(adult,-country)

ggplot(adult, aes(x=region)) +
  geom_bar(aes(fill=factor(income))) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

library(caTools)
split <- sample.split(adult$income,SplitRatio=0.7)
adult.train <- subset(adult,split==TRUE)
adult.test <- subset(adult,split==FALSE)

adult.model <- glm(income ~ ., family = binomial(link = 'logit'), data=adult.train)
summary(adult.model)
fitted.probabilities <- predict(adult.model, adult.test, type="response")
fitted.results <- ifelse(fitted.probabilities>0.5,1,0)
table(adult.test$income,fitted.probabilities>0.5)


# Accuracy shows how often a classification ML model is correct overall.
# Precision shows how often an ML model is correct when predicting the target class.
# Recall shows whether an ML model can find all objects of the target class.

accuracy <- (6305+1369) / (6305+1369+491+883)
recall <- 6305 / (6305+491)
precision <- 6305 / (6305+883)
