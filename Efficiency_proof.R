#Import a relvant file
file.pb <-"file_policy_building.csv"

#test to see how efficiently memory is WITHOUT data.table package
system.time(read.csv (file = file.pb))

#download data.table 
library(data.table)

#test efficiency after data.table package
system.time(read.csv (file = file.pb))