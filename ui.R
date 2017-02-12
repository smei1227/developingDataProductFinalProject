
library(shiny)
library(leaflet)


hsdf <- read.csv("location data.csv", header=TRUE, sep=",")

# Define UI for application that draws a map of the location of top 25 FL private high schools.
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Top 25 Private High School in FL"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       h3("How to use this App?"),
       h5("1. Move the slider to select the ranking of a high school in FL"),
       h5("2. Press +/- to view the location of the high school in the map on the right."),
       h5("3. The school name and other information will show below the map."),
       sliderInput("Rank",
                   "Number of ranking:",
                   min = 1,
                   max = 25,
                   value = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        h3("Location of Top Private High School in FL"),
        leafletOutput("locationMap"),
        h6("School Name:"),
        verbatimTextOutput("Name"),
        h6("Ranking:"),
        verbatimTextOutput("Rank"),
        h6("Address:"),
        verbatimTextOutput("Address"),
        h6("Telephone:"),
        verbatimTextOutput("Tel"),
        h6("Home Page:"),
        verbatimTextOutput("Url")
         
    )
  )
))
