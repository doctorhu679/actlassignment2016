#Pure motor premium rate and pure ctp premium in P1 licence class
#Policies in P1 licence class
P1.licence.policy <- Merged_ctp_df[Merged_ctp_df$Licence %in% "Provisional 1", ]

#Number of policies at different age in every EVR levels for P1 licence
P1.licence.freq.EVR.Age <- table(P1.licence.policy$EVR, P1.licence.policy$Age)

#Convert table to data frame
P1.licence.freq.EVR.Age <- as.data.frame(P1.licence.freq.EVR.Age)

#Remove classes which have less than 500 policies
P1.licence.freq.EVR.Age <- P1.licence.freq.EVR.Age[!(P1.licence.freq.EVR.Age$Freq < 500), ]

#Rename columns of data frame
colnames(P1.licence.freq.EVR.Age) <- c("EVR", "Age", "Frequency")

#Total gross loss motor at different age in every EVR levels for P1 licence claims
P1.lic.Sum.GLMotor <- aggregate(GrossLossMotor ~ EVR + Age, data = P1.licence.policy, FUN = sum)

#Total sum insured at different age in every EVR levels for P1 licence policies
P1.lic.Total.SumInsured <- aggregate(SumInsured ~ EVR + Age, data = P1.licence.policy, FUN = sum)

#Total gross loss CTP at different age in every EVR levels for P1 licence claims
P1.lic.Sum.GLCTP <- aggregate(GrossLossCTP ~ EVR + Age, data = P1.licence.policy, FUN = sum)

#Merge total gross loss motor and CTP at different age in every EVR levels for P1 licence claims
Merged.P1.lic.Sum.GLMotor.GLCTP <- merge(P1.lic.Sum.GLCTP, P1.lic.Sum.GLMotor)

#Data frame of number of claims, total sum insured, total GLM and total GLCTP at different age in every EVR levels for P1 licence
P1.lic.EVR.Age <- merge(merge(P1.licence.freq.EVR.Age, P1.lic.Total.SumInsured), Merged.P1.lic.Sum.GLMotor.GLCTP)

#Divide total motor gross loss by total sum insured for pure motor premium rate as percentage
P1.lic.EVR.Age$Motor.pure.premium.rate <- P1.lic.EVR.Age$GrossLossMotor / P1.lic.EVR.Age$SumInsured *100

#Install and load package "ggplot2"
install.packages("ggplot2")
library(ggplot2)

#Plot pure motor premium rate at different age in every EVR levels for P1 licence
ggplot(P1.lic.EVR.Age, aes(x=Age, y=Motor.pure.premium.rate, group=EVR)) +
  geom_line(aes(color=EVR), size=1)

