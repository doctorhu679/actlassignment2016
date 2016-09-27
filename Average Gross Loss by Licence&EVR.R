#Average GrossLossCTP in EVR/Licence
#Policy in each class by Licence&EVR
Licence.EVR.freq <- table(merged_ctp_df$Licence,merged_ctp_df$EVR)

#Total sum of gross loss ctp in every class
sum.Licence.EVR <- xtabs(GrossLossCTP~Licence+EVR, data=merged_ctp_df_claim_only)

#average gross lose ctp in each class
ave.Licence.EVR <- sum.Licence.EVR/Licence.EVR.freq