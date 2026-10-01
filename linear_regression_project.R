library(ggplot2)
library(datetime)
library(dplyr)

bike <- read.csv("Z:/bikeshare.csv")
head(bike)
str(bike)
ggplot(bike, aes(x=temp, y=count)) + geom_point(alpha=0.3,aes(color=temp)) + theme_bw()
bike$newdate <- as.POSIXct(bike$datetime)
bike$season <- as.factor(floor(as.integer(format(bike$newdate, "%m"))/4))
bike$hour <- as.factor(format(bike$newdate, "%H"))
bike$day <- format(bike$newdate, "%u")
ggplot(bike, aes(x=newdate, y=count)) + geom_point(aes(color=temp),alpha=0.5) + scale_color_continuous(high='red',low='blue') + theme_bw()
ggplot(bike, aes(x=season, y=count)) + geom_boxplot(aes(color=factor(season))) + theme_bw()

bike.dayone <- filter(bike, day==1)
bike.weekend <- filter(bike, day==6 | day==7)
ggplot(bike.dayone, aes(hour,count)) + geom_point(aes(color=temp), position=position_jitter(w=1, h=0))
ggplot(bike.weekend, aes(x=hour, y=count)) + geom_point(aes(color=temp), position=position_jitter(w=1, h=0))

cor(bike$temp,bike$count)

model <- lm (formula = count ~ temp, data = bike)
summary(model)
predict(model,data.frame(temp=25))
prediction <- 6.0462 + 25 * 9.1705

model2 <- lm (formula = count ~ . - casual - registered - datetime - atemp, data = bike)
summary(model2)
