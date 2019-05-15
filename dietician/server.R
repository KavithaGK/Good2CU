#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    

    addClass(selector = "body", class = "sidebar-collapse")
    observe({
        hFilterData <- hdata %>% filter(Suburb == input$'Suburb')
        print(hFilterData)
    })
    
    hdat <- reactive({
        fData <- hdata %>% filter(Suburb == input$'Suburb')  
        
    })
    
    
    output$hmap <- renderLeaflet({
        newHData <- hdat()
        
        m <- leaflet(data = newHData) %>%
            addTiles() %>%
            addMarkers(lng = ~Lat,
                       lat = ~Lang,
                       popup = paste(newHData$Name, "in", newHData$Suburb)) %>%
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
