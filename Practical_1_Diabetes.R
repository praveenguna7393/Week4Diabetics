
#Load the diabetes dataset into the dataframe.
my_data <- read.csv("Diabetes-md.csv")

#struture of the data_frame.
class(my_data)
str(my_data)

#deals with missing value.
my_data[!complete.cases(my_data),]

# Some data which have missing data needs to be changed.
my_data$Address[my_data$Address == ""] <- NA
my_data$Daibetes.type[my_data$Daibetes.type == ""] <- NA
my_data$Status[my_data$Status == ""] <- NA

my_data[!complete.cases(my_data),]

# still the column showing ""
# to convert the column type to char
# first recode to factor
my_data$Daibetes.type <- as.character(my_data$Daibetes.type)

# Then convert back it to factor.
my_data$Daibetes.type <- as.factor(my_data$Daibetes.type)
str(my_data)

# convert the address to character
my_data$Address <- as.character(my_data$Address)
str(my_data)

# convert status to char -> factor
my_data$Status <- as.character(my_data$Status)
my_data$Status <- as.factor(my_data$Status)
str(my_data)

# deal with missing data.

my_na <- my_data[!complete.cases(my_data),]
nrow(my_na)

# Use VIM package to show the missing value
#install.packages(VIM)
library(VIM)
missing_value <- aggr(my_data, prop = TRUE, numbers = TRUE)
summary(missing_value)

# Missing NI addresses are not important
# the missing values of "type" and "Health status" are important for analytics so i am removing it.

my_na <- my_data[!complete.cases(my_data$Daibetes.type, my_data$Status),]
my_na
nrow(my_na)
nrow(my_data)

# 15 rows have missing information reverse the logic to contain relant data.

full_date <- my_data[complete.cases(my_data$Daibetes.type, my_data$Status),]
nrow(full_date)


# Confifguring the type to an unordered factor.

my_data$Status <- factor(my_data$Status, order = TRUE, level = c("Poor","Improved","Excellent"))
str(my_data)












