#Pure motor premium rate and pure ctp premium in full licence class
#Policies in full licence class
Full.licence.policy <- Merged_ctp_df[Merged_ctp_df$Licence %in% "Full", ]

#Number of policies at different age in every EVR levels for full licence
Full.licence.freq.EVR.Age <- table(Full.licence.policy$EVR, Full.licence.policy$Age)

#Convert table to data frame
Full.licence.freq.EVR.Age <- as.data.frame(Full.licence.freq.EVR.Age)

#Remove classes which have less than 500 policies
Full.licence.freq.EVR.Age <- Full.licence.freq.EVR.Age[!(Full.licence.freq.EVR.Age$Freq < 500), ]

#Rename columns of data frame
colnames(Full.licence.freq.EVR.Age) <- c("EVR", "Age", "Frequency")

#Total gross loss motor at different age in every EVR levels for full licence claims
Full.lic.Sum.GLMotor <- aggregate(GrossLossMotor ~ EVR + Age, data = Full.licence.policy, FUN = sum)

#Total sum insured at different age in every EVR levels for full licence policies
Full.lic.Total.SumInsured <- aggregate(SumInsured ~ EVR + Age, data = Full.licence.policy, FUN = sum)

#Total gross loss CTP at different age in every EVR levels for full licence claims
Full.lic.Sum.GLCTP <- aggregate(GrossLossCTP ~ EVR + Age, data = Full.licence.policy, FUN = sum)

#Merge total gross loss motor and CTP at different age in every EVR levels for full licence claims
Merged.full.lic.Sum.GLMotor.GLCTP <- merge(Full.lic.Sum.GLCTP, Full.lic.Sum.GLMotor)

#Data frame of number of claims, total sum insured, total GLM and total GLCTP at different age in every EVR levels for full licence
Full.lic.EVR.Age <- merge(merge(Full.licence.freq.EVR.Age, Full.lic.Total.SumInsured), Merged.full.lic.Sum.GLMotor.GLCTP)

#Divide total motor gross loss by total sum insured for pure motor premium rate as percentage
Full.lic.EVR.Age$Motor.pure.premium.rate <- Full.lic.EVR.Age$GrossLossMotor / Full.lic.EVR.Age$SumInsured *100

#Install and load package "ggplot2"
install.packages("ggplot2")
library(ggplot2)

#Plot pure motor premium rate at different age in every EVR levels for full licence
ggplot(Full.lic.EVR.Age, aes(x=Age, y=Motor.pure.premium.rate, group=EVR)) +
  geom_line(aes(color=EVR), size=1)

