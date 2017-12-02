
#obtain the id/name columns (1- Gelding, 2-Filly, 3-Mare, etc.)
horses_sex_data <- read.csv(file="c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/horse_sexes.csv", header=TRUE);

horses_data <- read.csv(file="c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/horses.csv", header=TRUE)


#combine the data into one table
#must change the id name in horseSexes to match the id in horses for correct merge
colnames(horses_sex_data)[which(names(horses_sex_data) == "id")] <- "sex_id"


#make sure it merges so sex_id is the column that's equal in the tables
combinedHorses <- merge(horses_sex_data, horses_data, by.x = "sex_id")

getHorseGenders <- combinedHorses[c("name")]

getAgeMoney <- combinedHorses[c("age","prize_money")]


getMean <- aggregate(getAgeMoney$prize_money, FUN=mean, nfrequency =1, by=list(getAgeMoney$age))
ages <- c(getAgeMoney$age)
# Graph autos with adjacent bars using rainbow colors
barplot(order(getMean$x), main="Horses", ylab= "Average Prize Winnings",
        beside=TRUE, col=rainbow(10), names.arg = order(unique(c(getAgeMoney$age))), xlab = "Ages")

# Place the legend at the top-left corner with no frame  
# using rainbow colors
legend("topleft", c(getHorseGenders ), cex=0.6, 
       bty="n", fill=rainbow(5))
