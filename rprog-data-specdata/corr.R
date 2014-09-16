corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  cor_vect <- c()
  id <- 1:332
  for(i in id) {
    idfile <- paste0(directory, "/", sprintf("%03d", i), ".csv")
    data <- read.csv(idfile)
    if (sum(complete.cases(data)) > threshold) {
      x <- cor(data[complete.cases(data), "nitrate"], data[complete.cases(data), "sulfate"])
      cor_vect <- c(cor_vect, x)
    }
    
  }
  cor_vect
}