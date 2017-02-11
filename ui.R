#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

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
