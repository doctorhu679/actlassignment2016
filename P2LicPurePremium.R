#Pure motor premium rate and pure ctp premium in P2 licence class
#Policies in P2 licence class
P2.licence.policy <- Merged_ctp_df[Merged_ctp_df$Licence %in% "Provisional 2", ]

#Number of policies at different age in every EVR levels for P2 licence
P2.licence.freq.EVR.Age <- table(P2.licence.policy$EVR, P2.licence.policy$Age)

#Convert table to data frame
P2.licence.freq.EVR.Age <- as.data.frame(P2.licence.freq.EVR.Age)

#Remove classes which have less than 500 policies
P2.licence.freq.EVR.Age <- P2.licence.freq.EVR.Age[!(P2.licence.freq.EVR.Age$Freq < 500), ]

#Rename columns of data frame
colnames(P2.licence.freq.EVR.Age) <- c("EVR", "Age", "Frequency")

#Total gross loss motor at different age in every EVR levels for P2 licence claims
P2.lic.Sum.GLMotor <- aggregate(GrossLossMotor ~ EVR + Age, data = P2.licence.policy, FUN = sum)

#Total sum insured at different age in every EVR levels for P2 licence policies
P2.lic.Total.SumInsured <- aggregate(SumInsured ~ EVR + Age, data = P2.licence.policy, FUN = sum)

#Total gross loss CTP at different age in every EVR levels for P2 licence claims
P2.lic.Sum.GLCTP <- aggregate(GrossLossCTP ~ EVR + Age, data = P2.licence.policy, FUN = sum)

#Merge total gross loss motor and CTP at different age in every EVR levels for P2 licence claims
Merged.P2.lic.Sum.GLMotor.GLCTP <- merge(P2.lic.Sum.GLCTP, P2.lic.Sum.GLMotor)

#Data frame of number of claims, total sum insured, total GLM and total GLCTP at different age in every EVR levels for P2 licence
P2.lic.EVR.Age <- merge(merge(P2.licence.freq.EVR.Age, P2.lic.Total.SumInsured), Merged.P2.lic.Sum.GLMotor.GLCTP)

#Divide total motor gross loss by total sum insured for pure motor premium rate as percentage
P2.lic.EVR.Age$Motor.pure.premium.rate <- P2.lic.EVR.Age$GrossLossMotor / P2.lic.EVR.Age$SumInsured *100

#Install and load package "ggplot2"
install.packages("ggplot2")
library(ggplot2)

#Plot pure motor premium rate at different age in every EVR levels for P2 licence
ggplot(P2.lic.EVR.Age, aes(x=Age, y=Motor.pure.premium.rate, group=EVR)) +
  geom_line(aes(color=EVR), size=1)

