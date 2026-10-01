seq(12,200,by=10)
# [1]  12  22  32  42  52  62  72  82  92 102 112 122 132 142 152 162 172 182 192

sort (c(4,6,12,1,18,20,5,13))
# [1]  1  4  5  6 12 13 18 20
sort (c(4,6,12,1,18,20,5,13), decreasing=T)
# [1] 20 18 13 12  6  5  4  1

rev (1:10)
# [1] 10  9  8  7  6  5  4  3  2  1

str(1:10)
# int [1:10] 1 2 3 4 5 6 7 8 9 10

v <- 1:10
v2 <- 35:40
append(v,v2)
# [1]  1  2  3  4  5  6  7  8  9 10 35 36 37 38 39 40

is.vector(v)
# [1] TRUE

as.list(v)
#[[1]]
#[1] 1

#[[2]]
#[1] 2

#[[3]]
#[1] 3

#[[4]]
#[1] 4

as.numeric("45")
# [1] 45

sample(x = 1:1000, 3)
# [1]  39 329  28

v <- 1:5

addrand <- function(x){
  ran <- sample(1:100,1)
  return (x+ran)
}

addrand(10)

result <- lapply(v,addrand)
print (result)

sapply(v,addrand)
# [1] 99 66 53 30 39 27 47 73 62 95


# anonymous functions
sapply(1:10,function(x){x^2})
# [1]   1   4   9  16  25  36  49  64  81 100


# apply with multiple inputs
v <- 1:10

add_choice <- function(num,choice){
  return (num+choice)
}

add_choice(10,2)
sapply(v,add_choice,choice=100)
#[1] 101 102 103 104 105 106 107 108 109 110


# math functions with R
abs(-2) # 2
sum(1:100) # 5050

# regular expressions
text <- "Hi there, do you know who you are voting for?"
grepl("voting",text) # TRUE
grepl("dog",text) # FALSE

v <- c('a','b','c','d','d')
grep("b",v) # [1] 2
grepl("b",v) # [1] FALSE  TRUE FALSE FALSE FALSE
grep("d",v) # [1] 4 5


# date and timestamps
Sys.Date()   # [1] "2025-02-07"
as.Date("1990-01-01")

my.data <- as.Date("Nov-03-90",format="%b-%d-%y")
my.data #[1] "1990-11-03"

as.Date("June,01,2002", format="%B,%d,%Y") # [1] "2002-06-01"

as.POSIXct("11:02:03", format="%H:%M:%S") # [1] "2025-02-07 11:02:03 CET"
strptime("11:02:03", format="%H:%M:%S")   # [1] "2025-02-07 11:02:03 CET"







