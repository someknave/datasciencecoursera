complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  compdata <- data.frame(id = numeric(), nobs = numeric())
  for(i in id) {
    idfile <- paste0(directory, "/", sprintf("%03d", i), ".csv")
    nob <- sum(complete.cases(read.csv(idfile)))
    compdata <- rbind(compdata, data.frame(id = i, nobs = nob))
  }
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  compdata
}