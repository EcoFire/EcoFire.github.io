library(shiny)
library(datasets)
# Global variables can go here
n <- 200


# Define the UI
ui <- bootstrapPage(
   selectInput("researchdata", "Choose a topic:", 
                choices = c("fire behavior", "fire ecology", "spatial forest structure", "forest management", "forest dynamics"))
  )



# Define the server code
server <- function(input, output) {
  output$plot <- renderPlot({
    hist(runif(input$n))
  })
}

# Return a Shiny app object
shinyApp(ui = ui, server = server)