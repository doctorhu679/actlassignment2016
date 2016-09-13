#sort by age
Sort.Age<- setorder(policy.claim, Age);

#Creat subset of Age and SocRisk exclusively (IRRELLEVENT??)
Age.SocRisk <- subset(policy.claim, select=c("Age","SocRisk"))

#find sum, mean and quartiles for GrossLossBuildings
GLB <- policy.claim$GrossLossBuilding
sum(GLB)
mean(GLB)
quantile(GLB)

#need to cut/split datatables in age groups
Age.group.all<- split(policy.claim.ALL, cut(policy.claim.ALL$Age, 
+ c(15,20,25,30,35,40,45,50,55,60,65,70,75), include.lowest = TRUE))


#turn Inception, Expiration and Accident into dates (only those claims made)
DI <- as.Date(policy.claim$Inception)
DE <- as.Date(policy.claim$Expiry)
DA <- as.Date(policy.claim$AccidentDay)
DE- DA #difference between accident date and claim date in days

#split data by dates??
#trues and falses to count
#probability for certain groups to make a claim??
#suggest everyone make data.frame both WITH and WITHOUT claims. Its easier