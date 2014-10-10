## Function to calculate the mean of a pollutant across a list of pollutant monitors

pollutantmean <- function(directory, pollutant, id=1:332) {
  ## "directory" is a character vector of length 1 indicating
  ## the location fo the CSV files
  
  ## "pollutant" is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the 
  ## mean; either "sulfate" or "nitrate".
  
  ## "id" is an integer vector indicating the monitor ID numbers
  ## to be used. 
  
  ## Return the mean of the pollutant across all monitors list
  ## in the "id" vector (ignoring NA values)
  
  
  
  ## Specify invalid pollutants, namely the columns "Date" and "ID".
  ## Calculating means of these two is meaningless. 
  
    invalid_pollutant <- c("Date", "ID")
  
    if(pollutant==invalid_pollutant[1] | pollutant==invalid_pollutant[2] ) {
    ## Error message to be displayed if something except for "nitrate" or "sulfate" is specified as "pollutant"   
      stop("This is not a valid pollutant")
     } else {
    ## Create a vector to store the pollutant data         
      all_data <- vector()
    ## Loop to extract the relevant data from the specified monitor IDs
      for(i in id) {
      
      ## Putting together the csv-file names according to the specified IDs  
      threedigit_id <- formatC(i, width=3, flag="0")  ## 3 digit ID
      file <- paste(directory, threedigit_id,  sep = "/")
      filename <- paste(file, "csv", sep = ".")
      
      ## Reading in the monitor's data
      data <- read.csv(file = filename, header = TRUE, sep = ",")
      
      ## Extracting the relevant data column
      subset<-data[,pollutant]
      
      ## Storing this monitor's data in the all_data vector
      all_data <- c(all_data,subset)
      
    }
    ## Calculating the overall mean, rounded to three decimal places & ignoring NA values
    print(round(mean(all_data, na.rm=T),3))
  }
}


