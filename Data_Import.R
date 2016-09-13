#setting the working directory
setwd("T:/Work/University/UNSW/Courses/Sem 2/ACTL 1101/Coursework")

#importing each csv file
file.pb <-"file_policy_building.csv"
file.cb <-"file_claim_building.csv"

#download data.table for memory efficiency (CODE NEEDED FOR DOWNLOAD?)
library(data.table)

#generating data.frames from the file
policy<- read.csv(file=file.pb);
claim<- read.csv(file=file.cb);
policy.claim.ALL <- merge(policy,claim, all=TRUE); #with 0 claims
policy.claim <- merge(policy,claim);#without 0 claims