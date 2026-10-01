bank <- read.csv("Z:/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects/bank_note_data.csv")
head(bank)
str(bank)

library(caTools)
split <- sample.split(bank$Class, SplitRatio = 0.7)
train <- subset(bank,split==TRUE)
test <- subset(bank,split==FALSE)

library(neuralnet)
n <- names(bank)
f <- as.formula(paste("Class ~", paste(n[!n %in% "Class"], collapse = "+")))
f # Class ~ Image.Var + Image.Skew + Image.Curt + Entropy

# against test set
nn <- neuralnet(f, data=train,hidden=c(10), linear.output = FALSE)
predicted.nn.values <- compute(nn,test[1:4])
pv <- as.data.frame(predicted.nn.values$net.result)
pv$round <- round(pv$V1)
head(pv)
table(pv$round,test$Class)

# forest
library(randomForest)
train$Class <- as.factor(train$Class)
test$Class <- as.factor(test$Class)

rf.model <- randomForest(Class ~ ., data=train)
p <- predict(rf.model,test)
table(p,test$Class)
