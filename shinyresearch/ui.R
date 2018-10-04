library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    selectInput("researchdata", "Choose a topic:", 
                choices = c("fire behavior", "fire ecology", "spatial forest structure", "forest management", "forest dynamics"))
  ),

  # Show a summary of the dataset and an HTML table with the requested
  # number of observations
  mainPanel(
    verbatimTextOutput("summary"),

    tableOutput("view")
  )
))