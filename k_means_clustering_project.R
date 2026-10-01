white.wine <- read.csv("Z:/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects/winequality-white.csv",sep=';')
red.wine <- read.csv("Z:/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects/winequality-red.csv",sep=';')

white.wine$Type <- 'white'
red.wine$Type <- 'red'

wine <- rbind(white.wine,red.wine)
str(wine)

ggplot(wine,aes(x=residual.sugar)) + geom_histogram(aes(fill=Type)) 
ggplot(wine,aes(x=citric.acid)) + geom_histogram(aes(fill=Type)) 
ggplot(wine,aes(x=alcohol)) + geom_histogram(aes(fill=Type)) 

ggplot (wine,aes(x= citric.acid,y=residual.sugar))+ geom_point(aes(color=Type))
ggplot (wine,aes(x= volatile.acidity,y=residual.sugar))+ geom_point(aes(color=Type))

clus.data <- wine[1:12]
wine.cluster <- kmeans(clus.data,2)
wine.cluster$cluster
table(wine.cluster$cluster,wine[,13])


wine.cluster <- kmeans(clus.data,4) # four clusters instead of 2!!
wine.cluster$cluster
table(wine.cluster$cluster,wine[,13])
