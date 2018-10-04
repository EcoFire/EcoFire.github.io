#server
library(shiny)
library(dplyr)
library(kableExtra)
biblio = (data.table::fread('biblio.txt',header=T))
#kable(dt) %>%
#  kable_styling(bootstrap_options = c("striped", "hover"))
Sys.setlocale('LC_ALL','C') 

shinyServer(function(input,output){
  df_subset <- reactive({
    a <- biblio[grepl(input$tag,biblio$tags,useBytes = TRUE),] 
          b=data.table::data.table()
    for (i in 1:dim(a)[1]){
      btitle= a$Title[i]
      babstract= a$Abstract[i]
      bcitation= a$Citation[i]
      burl= a$URL[i]
      b = rbind(b,btitle,babstract, bcitation, burl, "")
    }
    return(b)
  })

#  output$table <- 
#   renderTable(df_subset())
     #Note how df_subset() was used and not df_subset
 output$table <- function() {
     df_subset() %>%
       knitr::kable("html",col.names='') %>%
       kable_styling("striped", full_width = F) %>%
      row_spec(seq(1,dim(df_subset())[1],5), bold = T)
   }


})
