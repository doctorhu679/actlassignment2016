#setting the working directory
setwd("T:/Work/University/UNSW/Courses/Sem 2/ACTL 1101/Coursework")

#import csv files as data frames and merge together based on "Policy ID"
file_claim_motorctp <- read.csv("file_claim_motorctp.csv", header=TRUE)
file_policy_motorctp <-read.csv("file_policy_motorctp.csv", header=TRUE)
merged_ctp_df <- merge(file_policy_motorctp, file_claim_motorctp, all=TRUE)
##make a file exclusively for claims for easy manipulation
merged_ctp_df_claim_only <- merge(file_policy_motorctp,
file_claim_motorctp, all=FALSE)

##finding claims OUTSIDE of policy period

#Convert Inception, Expiry and AccidentDay into dates
Incep <- as.Date(merged_ctp_df_claim_only$Inception)
Expiry <- as.Date(merged_ctp_df_claim_only$Expiry)
Accday <- as.Date(merged_ctp_df_claim_only$AccidentDay)
#Subtract Accday from Expiry to obtain difference in days
#between occurence of accident and expiration of policy
Dif <- Expiry - Accday
#Any -'ive values indicate accidents outside of policy period
sum(Dif<0)
#proof that all these are 1 day after policy period
sum(Dif==-1)
