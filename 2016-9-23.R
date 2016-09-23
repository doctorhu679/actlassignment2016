#Age Frequency
TAB <-table (motor$Age)
barplot(TAB)
barplot (TAB, beside=T, ylim=c(0,15000), xlab="Age", ylab="Frequency", main="Frequency of age")

#average GLCTP&GLMotor by age
a <- data.frame(merged_ctp_df_claim_only$Age, merged_ctp_df_claim_only$GrossLossMotor , merged_ctp_df_claim_only$GrossLossCTP)
names(a) <- c("Age","GrossLossMotor","GrossLossCTP")

b <- aggregate(. ~ Age, data=a, FUN=sum)

c <- b[, colnames(b) != 'Age']/table(a$Age)

d <- cbind(b['Age'],c)

plot(d$Age,d$GrossLossMotor,type="l",col="red")
lines(d$Age,d$GrossLossCTP,col="green")

#average Suminsured by age
a <- data.frame(file_policy_motorctp$Age, file_policy_motorctp$SumInsured)
names(a) <- c("Age","SumInsured")
b <- aggregate(. ~ Age, data=a, FUN=sum)
c <- b[, colnames(b) != 'Age']/table(a$Age)
barplot(c)

#average Suminsured by EVR
a <- data.frame(file_policy_motorctp$EVR, file_policy_motorctp$SumInsured)
names(a) <- c("EVR","SumInsured")
b <- aggregate(. ~ EVR, data=a, FUN=sum)
c <- b[, colnames(b) != 'EVR']/table(a$EVR)
barplot(c)

#average Suminsured by licenclass
a <- data.frame(file_policy_motorctp$Licence, file_policy_motorctp$SumInsured)
names(a) <- c("Licence","SumInsured")
b <- aggregate(. ~ Licence, data=a, FUN=sum)
c <- b[, colnames(b) != 'Licence']/table(a$Licence)
barplot(c)

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

#Age and licence
TAB <-table (file_policy_motorctp$EVR, file_policy_motorctp$Age)
barplot(TAB)
barplot (TAB, beside=T, legend =T)

#EVR and licence
TAB <-table (file_policy_motorctp$EVR, file_policy_motorctp$Licence)
barplot(TAB)
barplot (TAB, beside=T, legend =T)

#Inception day frequency

Inception_Date <- as.Date(file_policy_motorctp$Inception)


Inception_Month <- format(Inception_Date, "%m")

Ins_Month_contigency_table <- table(Inception_Month)


barplot(Ins_Month_contigency_table, main= "Inception in Each Month",
        xlab = "Months", col= "darkblue")

#code to save plot
jpeg(filename="months_freqency.jpeg")
barplot(Ins_Month_contigency_table, main= "Inception in Each Month",
        xlab = "Months", col= "darkblue")
dev.off()