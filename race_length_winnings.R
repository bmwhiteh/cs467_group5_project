# Read values from tab-delimited autos.dat 
track_conditions_data <-read.csv(file = "/Users/travismiller/HorseRacing/cs467_group5_project/markets.csv", header =TRUE)



track_condition_winnings <- race_length_data[c("condition_id", "total_pool_one_win")]

dev.off()

getMeanWinnings <-aggregate(track_condition_winnings$total_pool_one_win, FUN=mean,
                                   list(track_condition = track_condition_winnings$condition_id))

barplot(getMeanWinnings$x/1000, main="Track Condition vs Winnings", ylab="Average Winnings (1000s)"
        ,col=rainbow(4), xlab = "Conditions", names.arg = getMeanWinnings$track_condition, ylim = c(0,80)) 