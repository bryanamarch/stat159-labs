---
output: html_document
runtime: shiny
---
#loading in required packages
library(shiny)
library(ggplot2)

#Loading data
advertising <- read.csv("Advertising.csv")

ui <- shinyUI(fluidPage(
  
  # Application title
  titlePanel("Scatterplot of Sales vs. Advertising Budgets"),
  
  # Sidebar with a dropdown input for advertising type
  sidebarLayout(
    sidebarPanel(
      #Setting the input.
      selectInput(inputId = "ad_type", 
                  label = "Select a Advertising type", 
                  choices = c("TV", "Radio", "Newspaper"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("ScatterPlot")
    )
  )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  data <- reactive({
    data.frame(type = advertising[ ,input$ad_type], sales = advertising$Sales)
    })
  output$ScatterPlot <- renderPlot({
    ggplot(data(), aes(type, sales))+
      geom_smooth(method = "lm", se = FALSE, size = 1) +
      geom_point(shape = 16, col = "red")+
      theme_bw()
  })
})

# Run the application 
shinyApp(ui = ui, server = server)

