#Age Frequency
TAB <-table (merged_ctp_df_claim_only$Age)
barplot (TAB, beside=T, ylim=c(0,15000), xlab="Age", ylab="Frequency", main="Frequency of age")

#average GLCTP&GLMotor by age
a <- data.frame(merged_ctp_df_claim_only$Age, merged_ctp_df_claim_only$GrossLossMotor , merged_ctp_df_claim_only$GrossLossCTP)
names(a) <- c("Age","GrossLossMotor","GrossLossCTP")

b <- aggregate(. ~ Age, data=a, FUN=sum)

c <- b[, colnames(b) != 'Age']/table(a$Age)

d <- cbind(b['Age'],c)

barplot(t(as.matrix(d$GrossLossCTP,d$Age)))
barplot(t(as.matrix(d$Age,d$GrossLossCTP)))

x <-aggregate(GrossLossMotor ~ Age, merged_ctp_df, mean)
plot(as.factor(x$Age), x$GrossLossMotor)

#average GLCTP&GLMotor by EVR
a <- data.frame(merged_ctp_df_claim_norepeatID$EVR, merged_ctp_df_claim_norepeatID$GrossLossMotor , merged_ctp_df_claim_norepeatID$GrossLossCTP)
names(a) <- c("EVR","GrossLossMotor","GrossLossCTP")

b <- aggregate(. ~ EVR, data=a, FUN=sum)


c <- b[, colnames(b) != 'EVR']/table(a$EVR)

d <- cbind(b['EVR'],c)

plot(d$EVR,d$GrossLossMotor,col="red")
lines(d$EVR,d$GrossLossCTP,col="green")

#average GLCTP&GLMotor by Licence class
a <- data.frame(merged_ctp_df_claim_norepeatID$Licence, merged_ctp_df_claim_norepeatID$GrossLossMotor , merged_ctp_df_claim_norepeatID$GrossLossCTP)
names(a) <- c("Licence","GrossLossMotor","GrossLossCTP")

b <- aggregate(. ~ Licence, data=a, FUN=sum)

c <- b[, colnames(b) != 'Licence']/table(a$Licence)

d <- cbind(b['Licence'],c)

plot(d$Licence,d$GrossLossMotor,col="red",ylim = c(0,5000))
lines(d$Licence,d$GrossLossCTP,col="green")

e <- d$GrossLossMotor
f<- d$GrossLossCTP
cor(e,f)
#Age and EVR
TAB <-table (file_policy_motorctp$Licence, file_policy_motorctp$Age)
barplot(TAB)
barplot (TAB, beside=T, legend =T)

#EVR and licence
TAB <-table (file_policy_motorctp$EVR, file_policy_motorctp$Licence)
barplot(TAB,legend=T)
barplot (TAB, beside=T)


#code to save plot
jpeg(filename="months_freqency.jpeg")
barplot(Ins_Month_contigency_table, main= "Inception in Each Month",
        xlab = "Months", col= "darkblue")
dev.off()