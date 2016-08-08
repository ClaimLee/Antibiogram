library(shiny)
library(shinydashboard)

# Load the data set you want to display
# setwd("F:/Antibiogram")
Anti <- read.csv("Data/Final Cumulative Antibiogram by Group.csv")

# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("Cumulative Antibiogram"),
    
    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4,
             selectInput("org",
                         "Organism:",
                         c("All",
                           unique(as.character(Anti$Organism))))
      ),
      column(4,
             selectInput("cat",
                         "Category:",
                         c("All",
                           unique(as.character(Anti$Category))))

    )),
    # Create a new row for the table.
    fluidRow(
      DT::dataTableOutput("table")
    )
  )
)
