library(shiny)

shinyUI(fluidPage(
  #User dropbox
  selectInput("tag", "Choose a topic:", 
              choices = c("fire behavior", "fire ecology", "spatial forest structure", "forest management", "forest dynamics"))
  #Print table to UI
  ,tableOutput("table")
))
