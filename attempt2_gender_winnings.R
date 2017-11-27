
#obtain the id/name columns (1- Gelding, 2-Filly, 3-Mare, etc.)
horses_sex_data <- read.csv(file="c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/horse_sexes.csv", header=TRUE);

horses_data <- read.csv(file="c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/horses.csv", header=TRUE)


#combine the data into one table
#must change the id name in horseSexes to match the id in horses for correct merge
colnames(horses_sex_data)[which(names(horses_sex_data) == "id")] <- "sex_id"


#make sure it merges so sex_id is the column that's equal in the tables
combinedHorses <- merge(horses_sex_data, horses_data, by.x = "sex_id")

name_prizes <-combinedHorses[c("name","prize_money")]



getMeanPrizeMoney <- aggregate(name_prizes$prize_money, FUN=mean, nfrequency =1, by=list(name_prizes$name))

# Graph autos with adjacent bars using rainbow colors
barplot(getMeanPrizeMoney$x, main="Horses", ylab= "Average Prize Winnings",
        beside=TRUE, col=rainbow(6), names.arg = getMean$Group.1, xlab = "Genders")

