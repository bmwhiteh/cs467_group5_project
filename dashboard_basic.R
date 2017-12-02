#install.packages("shinydashboard")


## app.R ##
#library(shinydashboard)

################
##Travis Plots##
################
# Read values from tab-delimited autos.dat 
track_conditions_data <-read.csv(file = "c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/markets.csv", header =TRUE)



track_condition_winnings <- track_conditions_data[c("condition_id", "total_pool_one_win")]

getMeanWinnings <-aggregate(track_condition_winnings$total_pool_one_win, FUN=mean,
                          list(track_condition = track_condition_winnings$condition_id),na.rm=TRUE)

# Read values from tab-delimited autos.dat 
horse_weather_data <-read.csv(file = "c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/markets.csv", header =TRUE)


weather_winnings <- horse_weather_data[c("weather_id", "total_pool_one_win")]


getMeanWeatherWinnings <-aggregate(weather_winnings$total_pool_one_win, FUN=mean,
                                   list(id = weather_winnings$weather_id),na.rm=TRUE)


#################
##Donovan Plots##
################

#collect data about horses and runners
runnersData <- read.csv(file="c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/runners.csv", header=TRUE)
horses <- read.csv(file="c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/horses.csv", header=TRUE)

colnames(horses)[which(names(horses) == "id")] <- "horse_id"

#make sure it merges so sex_id is the column that's equal in the tables
combinedHorses <- merge(runnersData, horses, by.x = "horse_id")

# find all the money from each barrier
barrierMoneyPlot3 <- combinedHorses[c("handicap_weight","prize_money")]

#find the mean of the money from each barrier
moneyMeanPlot3 <- aggregate(barrierMoneyPlot3$prize_money, FUN=mean, nfrequency =1, by=list(barrierMoneyPlot3$handicap_weight), na.rm=TRUE)


# find all the money from each barrier
barrierMoneyPlot4 <- combinedHorses[c("barrier","prize_money")]

#find the mean of the money from each barrier
moneyMeanPlot4 <- aggregate(barrierMoneyPlot4$prize_money, FUN=mean, by=list(barrierMoneyPlot4$barrier), na.rm=TRUE)


################
##Bailey Plots##
################

#obtain the id/name columns (1- Gelding, 2-Filly, 3-Mare, etc.)
horses_sex_data <- read.csv(file="c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/horse_sexes.csv", header=TRUE);
horses_data <- read.csv(file="c:/Users/bmwhi/Documents/IPFW Fall 2017/CS 467 - Project Management/cs467_group5_project/horses.csv", header=TRUE)


#combine the data into one table
#must change the id name in horseSexes to match the id in horses for correct merge
colnames(horses_sex_data)[which(names(horses_sex_data) == "id")] <- "sex_id"


#make sure it merges so sex_id is the column that's equal in the tables
combinedHorses <- merge(horses_sex_data, horses_data, by.x = "sex_id")
age_prizes <- combinedHorses[c("age","prize_money")]
name_prizes <- combinedHorses[c("name","prize_money")]


getMeanPrizeMoneyAge <- aggregate(name_prizes$prize_money, FUN=mean, nfrequency =1, by=list(sort(age_prizes$age)))
ages <- sort(unique(age_prizes$age));
name_prizes <-combinedHorses[c("name","prize_money")]
getMeanPrizeMoneyGender <- aggregate(name_prizes$prize_money, FUN=mean, nfrequency =1, by=list(name_prizes$name))

################
##Jason Plots##
################








ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
 
   ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Graphs by Travis", tabName = "Travis", icon = icon("th"))
      ,
      menuItem("Graphs by Donovan", tabName = "Donovan", icon = icon("th"))
      ,
      menuItem("Graphs by Bailey", tabName = "Bailey", icon = icon("th"))
      ,
      menuItem("Graphs by Jason", tabName = "Jason", icon = icon("th"))
    )
  ),
  
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              h2("Click on a tab to view some graphs!")
        )
    ,
      
      # Travis tab content
      tabItem(tabName = "Travis",
        fluidRow(
          box(plotOutput("plot1"), height = 500, width = 500)
          
          #box(
          #  title = "Controls",
          #  sliderInput("slider", "Number of observations:", 1, 100, 50)
          #)
        ),
        fluidRow(
          box(plotOutput("plot2"), height = 500, width = 500)
          
          #box(
          #  title = "Controls",
          #  sliderInput("slider", "Number of observations:", 1, 100, 50)
          #)
        )
      )
    ,
      # Donovan tab content
      tabItem(tabName = "Donovan",
        fluidRow(
          box(plotOutput("plot3"), height = 500, width = 500)
          
          #box(
          #  title = "Controls",
          #  sliderInput("slider", "Number of observations:", 1, 100, 50)
          #)
        ),
        fluidRow(
          box(plotOutput("plot4"), height = 500, width = 500)
          
          #box(
          #  title = "Controls",
          #  sliderInput("slider", "Number of observations:", 1, 100, 50)
          #)
        )
      )
    ,
      # Bailey tab content
      tabItem(tabName = "Bailey",
        fluidRow(
          box(plotOutput("plot5"), height = 500, width = 500)
          
          #box(
          #  title = "Controls",
          #  sliderInput("slider", "Number of observations:", 1, 100, 50)
          #)
        ),
        fluidRow(
          box(plotOutput("plot6"), height = 500, width = 500)
          
          #box(
          #  title = "Controls",
          #  sliderInput("slider", "Number of observations:", 1, 100, 50)
          #),height = 500, width = 500
        )
      )
    ,
      # Jason tab content
      tabItem(tabName = "Jason",
        fluidRow(
          box(plotOutput("plot7", height = 500, width = 500))
          
          #box(
          #  title = "Controls",
          #  sliderInput("slider", "Number of observations:", 1, 100, 50)
          #)
        ),
        fluidRow(
          box(plotOutput("plot8", height = 500, width = 500))
          
          #box(
          #  title = "Controls",
          #  sliderInput("slider", "Number of observations:", 1, 100, 50)
          #)
          ,height = 500, width = 500
        )
        )
    )
    
  )
)

server <- function(input, output) {
  
  
    
  ##Travis Plots##
  output$plot1 <- renderPlot({
    barplot(getMeanWinnings$x/1000, main="Track Condition vs Winnings", ylab="Average Winnings (1000s)"
            ,col=rainbow(4), xlab = "Conditions", names.arg = getMeanWinnings$track_condition, ylim = c(0,80)) 
    
  })
  
  output$plot2 <- renderPlot({
    barplot(getMeanWeatherWinnings$x/1000, main="Weather Conditions", ylab="Average Winnings (1000s)"
            ,col=rainbow(4), xlab = "Weather Code", names.arg = getMeanWeatherWinnings$id, ylim = c(0,80))
    
  })
  
  ##Donovan Plots##
  
  output$plot3 <- renderPlot({
    #build the graph with random colors
    barplot(moneyMeanPlot3$x, main="Horses", ylab= "Average Prize Winnings",
            beside=TRUE, col=rainbow(22), names.arg = sort(unique(c(barrierMoneyPlot3$handicap_weight))), xlab = "Handicap Weight")
    
  })
  
  output$plot4 <- renderPlot({
    #build the graph with random colors
    barplot(moneyMeanPlot4$x, main="Horses", ylab= "Average Prize Winnings",
            beside=TRUE, col=rainbow(22), names.arg = sort(unique(c(barrierMoneyPlot4$barrier))), xlab = "Barrier Number")
    
  })
  
  ##Bailey Plots##
  output$plot5 <- renderPlot({
    # Graph autos with adjacent bars using rainbow colors
    barplot(getMeanPrizeMoneyGender$x, main="Horse Gender versus Average Prize Money", ylab= "Average Prize Winnings",
            beside=TRUE, col=rainbow(6), names.arg = getMeanPrizeMoneyGender$Group.1, xlab = "Genders")
    
  })
  
  output$plot6 <- renderPlot({
    barplot(getMeanPrizeMoneyAge$x, main="Horse Age versus Average Prize Money", ylab= "Average Prize Winnings",
            beside=TRUE, col=rainbow(6), names.arg = ages, xlab = "Ages")  })
  
  ##Jason Plots##
  output$plot7 <- renderPlot({
  })
  
  output$plot8 <- renderPlot({
  })
}

shinyApp(ui, server)

