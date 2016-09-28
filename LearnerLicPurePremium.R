#Pure motor premium rate and pure ctp premium in learner licence class
#Policies in learner licence class
Learner.licence.policy <- Merged_ctp_df[Merged_ctp_df$Licence %in% "Learner", ]

#Number of policies at different age in every EVR levels for learner licence
Learner.licence.freq.EVR.Age <- table(Learner.licence.policy$EVR, Learner.licence.policy$Age)

#Convert table to data frame
Learner.licence.freq.EVR.Age <- as.data.frame(Learner.licence.freq.EVR.Age)

#Remove classes which have less than 500 policies
Learner.licence.freq.EVR.Age <- Learner.licence.freq.EVR.Age[!(Learner.licence.freq.EVR.Age$Freq < 500), ]

#Rename columns of data frame
colnames(Learner.licence.freq.EVR.Age) <- c("EVR", "Age", "Frequency")

#Total gross loss motor at different age in every EVR levels for learner licence claims
Learner.lic.Sum.GLMotor <- aggregate(GrossLossMotor ~ EVR + Age, data = Learner.licence.policy, FUN = sum)

#Total sum insured at different age in every EVR levels for learner licence policies
Learner.lic.Total.SumInsured <- aggregate(SumInsured ~ EVR + Age, data = Learner.licence.policy, FUN = sum)

#Total gross loss CTP at different age in every EVR levels for learner licence claims
Learner.lic.Sum.GLCTP <- aggregate(GrossLossCTP ~ EVR + Age, data = Learner.licence.policy, FUN = sum)

#Merge total gross loss motor and CTP at different age in every EVR levels for learner licence claims
Merged.learner.lic.Sum.GLMotor.GLCTP <- merge(Learner.lic.Sum.GLCTP, Learner.lic.Sum.GLMotor)

#Data frame of number of claims, total sum insured, total GLM and total GLCTP at different age in every EVR levels for learner licence
Learner.lic.EVR.Age <- merge(merge(Learner.licence.freq.EVR.Age, Learner.lic.Total.SumInsured), Merged.learner.lic.Sum.GLMotor.GLCTP)

#Divide total motor gross loss by total sum insured for pure motor premium rate as percentage
Learner.lic.EVR.Age$Motor.pure.premium.rate <- Learner.lic.EVR.Age$GrossLossMotor / Learner.lic.EVR.Age$SumInsured *100

#Install and load package "ggplot2"
install.packages("ggplot2")
library(ggplot2)

#Plot pure motor premium rate at different age in every EVR levels for learner licence
ggplot(Learner.lic.EVR.Age, aes(x=Age, y=Motor.pure.premium.rate, group=EVR)) +
  geom_line(aes(color=EVR), size=1)

