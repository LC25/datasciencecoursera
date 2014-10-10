getmonitor <- function(id, directory, summarize = FALSE) {
  te1 <- formatC(id, width=3, flag="0")
  filename = paste(directory, te1, sep = "/")
  filename1 = paste(filename, "csv", sep = ".")
  print(filename1)
  test <- read.table(file = filename1, header=T, sep=",")
  if(summarize) {
    print(summary(test))
    return (test)
  } else {
    return (test)
  }
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  pollutantData<-data.frame()
  for(file in rep(id)){
    pollutantData<-rbind(pollutantData,read.table(paste(directory,"/",sprintf("%03d", file),".csv",sep=""),sep=",",header=TRUE))
    #head(pollutantData)
    #mean(pollutantData[!is.na(pollutantData[pollutant])][pollutant])
    #index<-!is.na(pollutantData[pollutant])
    #class(pollutantData)
    #mean(as.matrix(pollutantData[complete.cases(pollutantData[pollutant]),][pollutant]))
  }
  mean(as.matrix(pollutantData[pollutant]),na.rm=TRUE)
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  ## Get a list of filenames
  filenames <- list.files(path=directory, pattern="*.csv")
  
  ## Initialize a vector to hold values
  vals <- vector()
  
  ## Loop over the passed id's
  for(i in id) {
    
    ## Pad the i to create a filename
    filename <- sprintf("%03d.csv", i)
    filepath <- paste(directory, filename, sep="/")
    
    ## Load the data
    data <- read.csv(filepath)
    
    ## Select our column
    d <- data[,pollutant]
    
    ## Ignore NAs
    d <- d[!is.na(d)]
    
    ## append to our vector
    vals <- c(vals, d)
  }
  
  ## Return the value rounded to 3 dec places
  round(mean(vals), 3)
}