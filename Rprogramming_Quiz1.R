## Quiz 1

### Setting working directory
getwd()
setwd("E:/datasciencecoursera")

### Some basic operations:
x<-c(1,3,5)
y<-c(3,2,10)
w<-cbind(x,y)
dim(w)
length(w)

### Replacing elements in a vector greater than 10 by 4
x<-c(17,14,4,5,13,12,10)
x[x>=11]<-4

### Reading in data
data<-read.csv("hw1_data.csv")
data ## displays the entire data incl. headers
names(data) ## displays header names
data[1:2,] ## displays the first two lines
nrow(data) ## number of rows, i.e. observations in the data frame
data[152:153,]
data[(nrow(data)-1):nrow(data),] ## both lines yield the same result here
tail(data) ## displays last observations
data$Ozone[47] ## Value of Ozone in the 47th row
is.na(data$Ozone) ## Returns a vector with logical T/F answer
table(is.na(data$Ozone)) ## tabulates the T/F response
mean(data$Ozone) ## gives NA because of the missing valuessu
mean(data$Ozone, na.rm=TRUE) ## calculates mean of Ozone, removing the missing values

sub<-subset(data, Ozone>31 & Temp>90) ## subsetting data to those obs where Ozone is above 31 and Temp above 90
mean(sub$Solar.R)

sub6<-subset(data, Month==6) ## subsetting to include only data of month 6
mean(sub6$Temp) ## mean of Temp when month is equal to 6

sub5<-subset(data, Month==5) ## subsetting to include only data of month 5
max(sub5$Ozone,na.rm=TRUE) ## maximum Ozone value in this month