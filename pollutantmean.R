setwd("/home/xiao/Documents/RStudy/R1406")

##read.csv("specdata/001.csv")
##myFiles <- list.files("specdata",pattern="csv")

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
  
  ##Get file names into a vector
  myFiles <- list.files(directory, pattern="csv")
  
  m <- data.frame()
  
  ##loop through all data
  for (i in id) {
    temp <- read.csv(paste("specdata", myFiles[i], sep="/"))
    m <- rbind(temp,m)
  }
  
  mean(m[[pollutant]], na.rm=TRUE)
}
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)