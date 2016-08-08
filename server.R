library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {

  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    Anti <- read.csv("Data/Final Cumulative Antibiogram by Group.csv")
    data <- Anti
    if (input$org != "All") {
      data <- data[data$Organism == input$org,]
    }
    if (input$cat != "All") {
      data <- data[data$Category == input$cat,]
    }
    data
  }))
  
})