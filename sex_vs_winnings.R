
# load comparison library
library(compare)
#Age versus Winnings

#obtain the id/name columns (1- Gelding, 2-Filly, 3-Mare, etc.)
horseSexes <- read.csv(file="c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/horse_sexes.csv", header=TRUE);

horses <- read.csv(file="c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/CSV files For Horses/horses_small_size.csv", header=TRUE)

#must change the id name in horseSexes to match the id in horses for correct merge
colnames(horseSexes)[which(names(horseSexes) == "id")] <- "sex_id"


#make sure it merges so sex_id is the column that's equal in the tables
combinedHorses <- merge(horseSexes, horses, by.x = "sex_id")

#order the data from youngest to oldest
combinedHorses[order(combinedHorses$age),] 

rowcount <- length(combinedHorses$age)

horseAges = matrix( 
  +   combinedHorses$age, 
  +   length(combinedHorses$age), 
  +   1) 

horseWinnings= matrix( 
  +   combinedHorses$prize_money, 
  +   length(combinedHorses$prize_money), 
  +   1) 

horseMatrix = cbind(horseAges, horseWinnings)


#Need to combine the horses in to Ages (X-axis), break Ages into Genders (legend), and take average of the winnings per age group (height of bars)

#Obtain the ages & prize money of horses by sex
gelding <- subset(combinedHorses, sex_id==1, select=c(age, prize_money))
filly <- subset(combinedHorses, sex_id==2,  select=c(age, prize_money))
mare <- subset(combinedHorses, sex_id==3,  select=c(age, prize_money))
colt <- subset(combinedHorses, sex_id==4,  select=c(age, prize_money))
unknown <- subset(combinedHorses, sex_id==5, select=c(age, prize_money))

#Group the Prize Money by Age per Gender
groupByGeldingAge <-aggregate(gelding, by=list(gelding$age), FUN=mean, na.rm=TRUE)
groupByFillyAge <-aggregate(filly, by=list(filly$age), FUN=mean, na.rm=TRUE)
groupByMareAge <-aggregate(mare, by=list(mare$age), FUN=mean, na.rm=TRUE)
groupByColtAge <-aggregate(colt, by=list(colt$age), FUN=mean, na.rm=TRUE)
groupByOtherAge <-aggregate(unknown, by=list(unknown$age), FUN=mean, na.rm=TRUE)



# Graph autos with adjacent bars using rainbow colors
barplot(as.matrix(autos_data), main="Autos", ylab= "Total",
        beside=TRUE, col=rainbow(5))


# Place the legend at the top-left corner with no frame  
# using rainbow colors
#legend("topleft", combinedHorses$name, cex=0.6, 
#       bty="n", fill=rainbow(5))


