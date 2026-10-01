Name <- c("Sam","Frank","Amy")
Age <- c(22,25,26)
Weight <- c(150,165,120)
Sex <- c("M", "M", "F")

df <- data.frame(row.names = Name, Age, Weight, Sex)


#Excel files (read)
install.packages("readxl")
library(readxl)

df <- excel_sheets("proj_management.xlsx")
df <- read_excel(path="proj_management.xlsx", sheet = "pmd", skip=4)
entire.workbook <- lapply(excel_sheets("proj_management.xlsx"),read_excel,path="proj_management.xlsx",skip=4)

#Excel files (write)
install.packages("xlsx")
library(xlsx)
write.xlsx(mtcars,"mtcars.xlsx",)




# Install the RMySQL package if you haven't already
install.packages("RMySQL")

# Load the RMySQL library
library(RMySQL)

# Create a connection to the MySQL database
con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "humaninf", 
                 host = "localhost", 
                 port = 3306, 
                 user = "root", 
                 password = "1234")

# Check the connection
dbListTables(con)

# dep.table <- dbSendQuery(con,"SELECT * FROM department")
dep.table <- dbSendQuery(con,"SELECT * FROM department")
df <- dbFetch(dep.table)


# Close the connection
dbDisconnect(con)


install.packages("rvest")
library(rvest)
demo(package = "rvest")
