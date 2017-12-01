# Read values from tab-delimited autos.dat 
horse_weather_data <-read.csv(file = "/Users/travismiller/HorseRacing/cs467_group5_project/markets.csv", header =TRUE)



weather_winnings <- horse_weather_data[c("weather_id", "total_pool_one_win")]

dev.off()

getMeanWeatherWinnings <-aggregate(weather_winnings$total_pool_one_win, FUN=mean,
                                   list(id = weather_winnings$weather_id))

barplot(getMeanWeatherWinnings$x/1000, main="Weather Conditions", ylab="Average Winnings (1000s)"
        ,col=rainbow(4), xlab = "Weather Code", names.arg = getMeanWeatherWinnings$id, ylim = c(0,80))
