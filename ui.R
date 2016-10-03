library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Eksempel på estimation i simpel lineær regression"),
  
  sidebarPanel(
    sliderInput("alpha", 
                "Skæring med y-aksen", 
                value = 1,
                min = -1, 
                max = 3,
                step = 0.05),
    
    sliderInput("beta", 
                "Hældningskoefficient", 
                value = 1,
                min = -1, 
                max = 3,
                step = 0.05)
),
  
  mainPanel(
      plotOutput(outputId = "main_plot", height="600px", width="800px")
  
))
)