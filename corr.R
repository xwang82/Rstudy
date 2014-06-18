corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  
  scope <- subset(complete("specdata", 1:332), nobs > threshold)
  
  m <- data.frame()
  c <- numeric()
  
  ##loop through all data
  for (i in scope[,1]) {
    m <- read.csv(paste("specdata", myFiles[i], sep="/"))
    ct <- cor(m$nitrate,m$sulfate,use="complete.obs")  
    c <- c(c,ct)
  }
  c
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 150000)
cr <- corr("specdata")
summary(cr)
length(cr)