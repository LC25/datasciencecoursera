complete <- function(directory, id=1:332) {
  all_data <- data.frame()
  
  
  for(i in id) {
    
    ## Putting together the csv-file names according to the specified IDs  
    threedigit_id <- formatC(i, width=3, flag="0")  ## 3 digit ID
    file <- paste(directory, threedigit_id,  sep = "/")
    filename <- paste(file, "csv", sep = ".")
    
    ## Reading in the monitor's data
    data <- read.csv(file = filename, header = TRUE, sep = ",")
    
    ## Extracting the relevant data column
    i_data<-data.frame(id=data[1,4], nobs=sum(complete.cases(data)))
    
    ## Storing this monitor's data in the all_data vector
    all_data <- rbind(all_data, i_data)
  }
  print(all_data)
}