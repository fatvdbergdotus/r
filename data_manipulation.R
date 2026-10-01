library(dplyr)

filter(flights,month==11, day==3,carrier=="AA") # conditional select rows
slice(flights,1:10) # row 1 to 10
select(flights,month,year,day) # select columns
rename(flights,airlinecarrier=carrier) # rename column name
distinct(select(flights,carrier)) # 16 unique carriers
mutate(flights, new_col = arr_delay - dep_delay) # create new col.. travel time
transmute(flights, new_col = arr_delay - dep_delay) # only the new column
summarize(flights,avg_airtime=mean(air_time,na.rm=TRUE)) # group by
summarize(flights,tot_airtime=sum(air_time,na.rm=TRUE)) # group by
sample_n(flights,10) # 10 random rows
sample_frac(flights,0.10) # 10% random of the rows

filter(mtcars,mpg>20,cylinders==6)
arrange(mtcars,cyl,desc(wt))
select(mtcars,mpg,hp)
distinct(mtcars,gear)
mutate(mtcars,Performance=hp/wt)
summarize(mtcars, avg_mgp=mean(mpg,na.rm=TRUE))
result <- mtcars %>% filter(cyl==6) %>% summarize(mean_hp=mean(hp,na.rm=TRUE))


install.packages(data.table)
library(tidyr)

comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9, min=0, max=100)
q2 <- runif(9, min=0, max=100)
q3 <- runif(9, min=0, max=100)
q4 <- runif(9, min=0, max=100)

df <- data.frame(comp=comp,year=yr,Qtr1 = q1,Qtr2 = q2,Qtr3 = q3,Qtr4 = q4)

# from 
#   comp year     Qtr1      Qtr2     Qtr3     Qtr4
# 1    1 1998 29.83930 67.615384 11.96835 98.29292
# 2    1 1999 14.69841  5.030688 74.47050 69.35207

#to
# comp year Quarter   Revenue
# 1     1 1998    Qtr1 29.839297
# 2     1 1999    Qtr1 14.698410
# 3     1 2000    Qtr1 62.555233

gather(df,Quarter,Revenue,Qtr1:Qtr4) # collapsing columns into key value pairs

stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocks
stocks.gathered <- stocks %>% gather(xyz, value, X:Z)

# undo: complement of gather
stocks.gathered %>% spread(xyz,value)

# transpose/pivot the original table
stocks.gathered %>% spread(time,value)

# seperate columns
df <- data.frame(x=c(NA,"a.x","b.y","c.z"))
separate(df,x,c("ABC","XYZ"))

# unite columns
df.sep <- separate(df,x,c("ABC","XYZ"))
unite(df.sep, new.joined.col, ABC,XYZ, sep="---")