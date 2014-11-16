pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  data_dir <- paste(getwd(),directory,sep="/") ##definition of the working directory where the csv files are stored
  
  files <- list.files(data_dir) #list of the files in the directory
  
  csvfiles <- paste(data_dir,files,sep="/") #full path of the files

  data_list <- lapply(csvfiles[id], read.csv, header=TRUE) #list of the files we want to read
  
  data <- do.call("rbind",data_list) #bind of the csv files read into a single data.frame
  
  mean(data[ ,pollutant], na.rm = TRUE) #mean of the wanted pollutant
  
}