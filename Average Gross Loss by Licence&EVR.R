#Average GrossLossCTP in EVR/Licence
#Policy in each class by Licence&EVR
Licence.EVR.freq <- table(merged_ctp_df$Licence,merged_ctp_df$EVR)

#Total sum of gross loss ctp in every class
sum.Licence.EVR <- xtabs(GrossLossCTP~Licence+EVR, data=merged_ctp_df_claim_only)

#average gross lose ctp in each class
ave.Licence.EVR <- sum.Licence.EVR/Licence.EVR.freq

#average gross lose ctp in each class
ave.Licence.EVR <- sum.Licence.EVR/Licence.EVR.freq

#Average GrossLossCTP in Age/EVR
#Policy in each class by Age&EVR
Age.EVR.freq <- table(merged_ctp_df$Age,merged_ctp_df$EVR)
k <- Age.EVR.freq[-c(1,60),]
#Set 0 by NA in matrix
Age.EVR.freq[Age.EVR.freq == 0] <- NA

#Total sum of gross loss ctp in every class
sum.Age.EVR <- xtabs(GrossLossCTP~Age+EVR, data=merged_ctp_df,)

#average gross lose ctp in each class
ave.Age.EVR <- sum.Age.EVR/k
