library(shiny)
library(leaflet)

hsdf <- read.csv("location data.csv", header=TRUE, sep=",")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$locationMap <- renderLeaflet({
          leaflet()%>%
          addTiles() %>%
          addMarkers(lat = hsdf[input$Rank,7], 
                     lng = hsdf[input$Rank,8],
                     popup = hsdf[input$Rank,2]) 
  })
  output$Name <- renderPrint({paste(hsdf[input$Rank,2],"")})
  output$Rank <- renderText(hsdf[input$Rank,1])
  output$Address <- renderPrint({paste(hsdf[input$Rank,3], ",", hsdf[input$Rank,4], hsdf[input$Rank,5], " ", hsdf[input$Rank,6])})
  output$Tel <- renderPrint({paste(hsdf[input$Rank,9],"")})
  output$Url <- renderPrint({paste(hsdf[input$Rank,10],"")})
  
})
