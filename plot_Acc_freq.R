#extract accident day of motorctp claim from data frame
Accident_Date <- as.Date(file_claim_motorctp$AccidentDay)

#build a accident frequency table of Accident_Date
Acc_Day_table <- table(Accident_Date)

#barplot frequency table of years
barplot(Acc_Day_table, main= "Accident Day Frequency",
        xlab = "Accident Days", ylab = "Number of Claims", ylim  = c(0,1000) )

#codes to save plot
jpeg(filename="AccidentDay_freqency.jpeg")
barplot(Acc_Day_table, main= "Accident Day Frequency",
        xlab = "Accident Days", ylab = "Number of Claims", ylim  = c(0,1000) )
dev.off()
