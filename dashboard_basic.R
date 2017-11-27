##install.packages("shinydashboard")


## app.R ##
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Dashboard"),
 
   ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
      
    )
  ),
  
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
          fluidRow(
            box(
              title = "Main Plot", width = 12, status = "primary", solidHeader = TRUE,
              plotOutput("plot1", height = 300)
              
              )
          ),
      
          fluidRow(
            box(
              title = "CSV Output", width = 12, solidHeader = TRUE
            )
          )
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
        fluidRow(
          box(
            title = "Main Plot", width = 12, status = "primary", solidHeader = TRUE,
            plotOutput("plot1", height = 300)
            
          )
        ),
        
        fluidRow(
          box(
            title = "CSV Output", width = 12, solidHeader = TRUE
          )
        )
      )
    )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)

