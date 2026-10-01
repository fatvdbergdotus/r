x<-0
while (x<10){
  x<-x+1
  print(x)
}

func <- function(input1,input2,input3=0){
  return (input1-input2+input3)
}

print(func(input2=4,input1=5,2))


hello2 <- function(name){
  return (paste("Hello",name))
}

prod <- function(int1,int2){
  return (int1*int2)
}

num_check <- function(number,vector){
  for (v in vector){
    if (number==v){
      RETURN(TRUE)
    }
  }
  return(FALSE)
}

num_counts <- function(number,vector){
  count <- 0
  for (v in vector) {
    if (number==v){
      count <- count+1
    }
  }
  return (count)
}

bar_count <- function(requested){
  return (requested && 5 + requested %/% 5)
}

