#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(session,input, output) {
  
  addClass(selector = "body", class = "sidebar-collapse")
  
  observe({
    filteredData <- df %>% filter(Suburb == input$'Suburb') %>% select('SportsPlayed')
    print(filteredData)
    updateSelectizeInput(session,"Sport", "Choose your Sport from your Suburb Sportslist",choices = unique(filteredData),
                         options = list(
                           placeholder = 'Please select a Sport below')
                         
    )
    
  })
  
  dat <- reactive({
    fData <- df %>% filter(Suburb == input$'Suburb' & SportsPlayed == input$'Sport')  
    #print(fData)
  })
  
  
  output$mymap <- renderLeaflet({
    newData <- dat()
    #print(newData)
    m <- leaflet(data = newData) %>%
      addTiles() %>%
      addMarkers(lng = ~Longitude,
                 lat = ~Latitude,
                 popup = paste(newData$FacilityName, "in", newData$Suburb, "has", newData$SportsPlayed)) %>%
      #setView(lng = 144.78, lat = -37.47, zoom = 6) %>%
      #Easy buttons code
      addEasyButton(easyButton(
        icon="fa-globe", title="Zoom to Victoria Map",
        onClick=JS("function(btn, map){map.setView([-37.47,144.78],6);map.setZoom(6); }"))) %>%
      addEasyButton(easyButton(
        icon="fa-crosshairs", title="Locate Me",
        onClick=JS("function(btn, map){ map.locate({setView: true}); }")))
  })
  
  
  
})
