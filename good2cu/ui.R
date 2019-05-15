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

# Define UI for application that draws a histogram
shinyUI( dashboardPage(skin = "green",
                       dashboardHeader(title = "Find Your Sport"),
                       dashboardSidebar(),
                       dashboardBody(
                         h2("Selecting a sport facility from a suburb"),
                         p(class = "text-muted",
                           h4("Select you suburb from the 'select your suburb' drop down and choose a sport from 'Choose your Sport from your Suburb Sportslist' ")),
                         
                         useShinyjs(),
                         tags$style(type = "text/css", "#mymap {height: calc(100vh - 80px) !important;}"),
                         
                         tags$div(
                           class = "row",
                           tags$div(
                             class = "col-sm-6 border-right",
                             tags$div(
                               class = "description-block",
                               selectizeInput("Suburb","Select Your Suburb",choices = unique(df$Suburb),
                                              options = list(
                                                placeholder = 'Please select a Suburb below',
                                                onInitialize = I('function() { this.setValue(""); }')
                                              )
                                              #selectizeInput('Sub','Suburb', choices= unique(df$Suburb),
                                              #              options = list(
                                              #               placeholder = 'Please select a Suburb below',
                                              #              onInitialize = I('function() { this.setValue(""); }')
                               ),
                               #selectInput("Sport","Select a Sport",choices = NULL),
                               tags$span(class = "box box-widget widget-user")
                             )),
                           tags$div(
                             class = "col-sm-6 border-right",
                             tags$div(
                               class = "description-block",
                               #selectInput("Suburb","Select Your Suburb",choices = unique(df$Suburb)),
                               
                               selectInput("Sport","Choose a Sport available in", "Suburb",choices = NULL),
                               #selectizeInput("sport","Select Your sport",choices = unique(df$SportsPlayed),
                               #            options = list(
                               #       placeholder = 'Please select a sport below',
                               #     onInitialize = I('function() { this.setValue(""); }')
                               # )),
                               tags$span(class = "box box-widget widget-user")
                             ))
                         ),
                         tags$div(
                           class = "box box-widget widget-user", 
                           # Add the bg color to the header using any of the bg-* classes
                           ## Box Header ##
                           leafletOutput("mymap")
                           
                         )
                         
                         
                         
                         
                         
                         
                         
                       )
))





