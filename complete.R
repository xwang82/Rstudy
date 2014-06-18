complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ##Get file names into a vector
  myFiles <- list.files(directory, pattern="csv")
  
  m <- data.frame()
  
  ##loop through all data
  for (i in id) {
    temp <- read.csv(paste("specdata", myFiles[i], sep="/"))
    
    ##Get current obs and id into a row
    nobs<-sum(complete.cases(temp))
    mrow<-data.frame(i,nobs)
    
    ##bind
    m <- rbind(m,mrow)
  }
  m
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)