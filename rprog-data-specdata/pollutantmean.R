pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  iddata <- c()
  for(i in id) {
    idfile <- paste0(directory, "/", sprintf("%03d", i), ".csv")
    data <- read.csv(idfile)[[pollutant]]
    data <- data[!is.na(data)]
    iddata <- c(iddata, data)
  }
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  mean(iddata)
}
