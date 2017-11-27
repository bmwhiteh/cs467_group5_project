
#obtain the id/name columns (1- Gelding, 2-Filly, 3-Mare, etc.)
horses_sex_data <- read.csv(file="c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/horse_sexes.csv", header=TRUE);

horses_data <- read.csv(file="c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/horses.csv", header=TRUE)


#combine the data into one table
#must change the id name in horseSexes to match the id in horses for correct merge
colnames(horses_sex_data)[which(names(horses_sex_data) == "id")] <- "sex_id"


#make sure it merges so sex_id is the column that's equal in the tables
combinedHorses <- merge(horses_sex_data, horses_data, by.x = "sex_id")

age_prizes <- combinedHorses[c("age","prize_money")]



getMeanPrizeMoney <- aggregate(name_prizes$prize_money, FUN=mean, nfrequency =1, by=list(sort(age_prizes$age)))

ages <- sort(unique(age_prizes$age));

# Graph autos with adjacent bars using rainbow colors
barplot(getMeanPrizeMoney$x, main="Horse Age versus Average Prize Money", ylab= "Average Prize Winnings",
        beside=TRUE, col=rainbow(6), names.arg = ages, xlab = "Ages")

