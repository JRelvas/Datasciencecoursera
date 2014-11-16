complete <- function(directory, id = 1:332) {
  
  data_dir <- paste(getwd(),directory,sep="/") ##definition of the working directory where the csv files are stored
  
  for (i in id){
  csvfiles[i] <- paste(data_dir, sprintf('%03d.csv', i), sep = "/")} ##definition of each csv file to be read
    
  data.frame(id=id, nobs=sapply( csvfiles[id], function(f) sum(complete.cases(read.csv(f)))), row.names=1:length(id))

  #returns a data frame and last argument renames each row to replace the location of each csv file
}