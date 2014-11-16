corr <- function(directory, threshold=0) {

##definition of the working directory where the csv files are stored:
data_dir <- paste(getwd(),directory,sep="/")

##list of the files in the directory, with full path:
csvfiles <- paste(data_dir, list.files(directory, pattern="*.csv"), sep='/')

##stores all files we want to read
data_list <- lapply(csvfiles, read.csv)

##applies complete.R to all files in directory
comp <- complete(directory)

##data.frame where the number os observations are higher than the threshold
thres <- comp[comp$nobs>threshold,]

#application of the correlation where thres is valid and removal of nulls with 'complete.obs'
result <- sapply(data_list[thres$id], function(x)
  cor(x$nitrate, x$sulfate, use='complete.obs'))
return (result)

}