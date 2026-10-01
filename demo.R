goog <- c(450,451,440,480,500)
msoft <- c(300,305,344,356,444)

stocks <- c(goog,msoft)

stock.matrix <- matrix(stocks,byrow=T,nrow=2)

days <- c("Mon","Tue","Wed","Thu","Fri")
stock.names <- c("Google","Microsoft")

colnames(stock.matrix) <- days
rownames(stock.matrix) <- stock.names

print(stock.matrix)



days <- c("Mon",'Tue',"Wed","Thu","Fri")
temp <- c(14,5,12,15,20)
rain <- c(T,F,T,F,F)
df <- data.frame(days,temp,rain)

df[1:3,c("days","temp")]
df$days
df["days"]

subset(df,subset = rain==T)
subset(df,subset = rain)
subset(df,subset = temp > 5)


# sort by temperature
sorted.temp <- order(df[,"temp"])
sorted.temp
df[sorted.temp,]

# descending temperature
desc.temp <- order(-df[,"temp"])
df[desc.temp,]
df[desc.temp,]

