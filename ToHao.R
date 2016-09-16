#Histogram
hist(policy.claim.ALL$Age, freq = TRUE, col = c("purple"))

#Contingency tables
Geo.Age <- table(policy.claim.ALL$GeoRisk, policy.claim.ALL$Age)
#barplot
barplot(Geo.Age, main= "Frequency of Georisk with Age",
        xlab = "Age", col=c("darkblue","darkred","darkgreen"),
        legend = rownames(Geo.Age))
Soc.Age <- table(policy.claim.ALL$SocRisk, policy.claim.ALL$Age)
barplot(Soc.Age, main= "Frequency of Socrisk with Age",
        xlab = "Age", col=c("blue","red","green"),
        legend = rownames(Soc.Age))

#need to cut/split datatables in age groups
Age.group.all<- split(policy.claim.ALL, cut(policy.claim.ALL$Age, 
                                            + c(15,20,25,30,35,40,45,50,55,60,65,70,75), include.lowest = TRUE))

Age.group<- split(policy.claim, cut(policy.claim$Age, 
                                    + c(15,20,25,30,35,40,45,50,55,60,65,70,75), include.lowest = TRUE))

#probability a certain group makes a claim
#for georisk
T1<- table(policy.claim$GeoRisk)
T2<- table(policy.claim.ALL$GeoRisk)
T3 <- T1/T2