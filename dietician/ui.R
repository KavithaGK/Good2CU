#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shinyjs)
require(leaflet)
# Define UI for application that draws a histogram
shinyUI( dashboardPage(skin = "green",
                       dashboardHeader(title = "Find Nearby Hospitals"),
                       dashboardSidebar(),
                       dashboardBody(
                           
                           p(class = "text-muted",
                             h4("Select you suburb from the 'select your suburb' drop down ")),
                           
                           useShinyjs(),
                           tags$style(type = "text/css", "#mymap {height: calc(100vh - 80px) !important;}"),
                           
                           tags$div(
                               class = "row",
                               tags$div(
                                   class = "col-sm-6 border-right",
                                   tags$div(
                                       class = "description-block",
                                       selectizeInput("Suburb","Select Your Suburb",choices = unique(hdata$Suburb),
                                                      options = list(
                                                          placeholder = 'Please select a Suburb below',
                                                          onInitialize = I('function() { this.setValue(""); }')
                                                      )
                                                    ),
                                       #selectInput("Sport","Select a Sport",choices = NULL),
                                       tags$span(class = "box box-widget widget-user")
                                   ))
                               
                           ),
                           tags$div(
                               class = "box box-widget widget-user", 
                               # Add the bg color to the header using any of the bg-* classes
                               ## Box Header ##
                               leafletOutput("hmap")
                               
                           )
       
                           
                       )
))