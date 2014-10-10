install.packages("swirl")
library(swirl)

## Emptying workspace
ls()
rm(list=ls())
swirl

seq(0,10,by=.5) ## gives a sequence from 0 to 10 in increments of .5
my_seq<-seq(5,10,length=30) ## gives a sequence with 30 numbers

1:length(my_seq) ## sequence as long as my_seq
seq(along=my_seq)
seg_along(my_seq)

## repetitions
rep(0, times=40)
rep(c(0,1,2), times=10) ## repeats 0 1 2, 10 times after each other
rep(c(0,1,2), each=10) ## repeats 0 10-times, then 1 10-times, then 2 10-times

my_char<-c("My", "name", "is")
paste(my_char, collapse=" ") ## collapse tells R that the elements of my_char should be separated by a single space when joining them together

paste(1:3, c("X", "Y", "Z"), sep="") ## Result is: [1] "1X" "2Y" "3Z"


## Missing values
y<-rnorm(1000)
z<-rep(NA,1000)
my_data<-sample(c(y,z), 100) ## select 100 elements at random from the 2000 values (combining y and z)
my_na<-is.na(my_data)
sum(my_na) ## gives the total number of NAs in my_data, because all NA have become TRUE=1 and FALSE=0

## Subsetting
y<-x[!is.na(x)] ## vector containing all non-NA values from x
y[y>0] ## gives a vector with all the positive elements of y and the original x
x[!is.na(x)&x>0] ## gives aonly values of x hat are non-missing and greater than 0

x[c(3,5,7)]  ## subsetting 3rd, 5th, 7th elements of x
x[c(-2,-10)] ## subsetting everything except the 2nd and 10th element
x[-c(2,10)] ## this yields the same result as the line above


vect<-c(foo=11, bar=2, norf=NA)
names(vect)
vect2<-c(11,2,NA)
names(vect2)<-c("foo", "bar", "norf")
identical(vect, vect2) ## gives a TRUE/FALSE vector

## Assigning column names to a matrix
my_matrix<-matrix(data=1:20, nrow=4, ncol=5)
patients<-c("Bill", "Gina", "Kelly", "Sean")
my_data<-data.frame(patients,my_matrix)
cnames<-c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data)<-cnames