#install.packages("doParallel")
require(doParallel)

# Start Parallel Processing
ncores <- makeCluster(detectCores() - 1)
registerDoParallel(cores = ncores)
getDoParWorkers()

# Stop Parallel Processing
stopCluster(ncores)