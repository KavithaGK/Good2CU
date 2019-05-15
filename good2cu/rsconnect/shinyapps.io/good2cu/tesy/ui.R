
library(shinydashboard)
library(shinyjs)

# Define UI for application that draws a histogram
shinyUI( dashboardPage(
    dashboardHeader(title = "Find Top Schools "),
    dashboardSidebar(),
    dashboardBody(
        useShinyjs(),
        tags$style(type = "text/css", "#mymap {height: calc(100vh - 80px) !important;}"),
        
        tags$div(
            class = "row",
            tags$div(
                class = "col-sm-6 border-right",
                tags$div(
                    class = "description-block",
                    selectInput("SchoolType","Select Your School Type",choices = unique(df_new$School_Type)),
                    
                    #selectInput("Sport","Select a Sport==",choices = NULL),
                    tags$span(class = "box box-widget widget-user")
                )),
            
            tags$div(
                class = "col-sm-6 border-right",
                tags$div(
                    class = "description-block",
                    #selectInput("Suburb","Select Your Suburb",choices = unique(df$Suburb)),
                    
                    selectInput("EducationType","Choose a Education Type", choices = unique(df_new$Education_Sector)),
                    tags$span(class = "box box-widget widget-user")
                )),
            
            tags$div(
                class = "col-sm-6 border-right",
                tags$div(
                    class = "description-block",
                    #selectInput("Suburb","Select Your Suburb",choices = unique(df$Suburb)),
                    
                    selectInput("SuburbCode","Choose a Suburb", choices = unique(df_new$Suburb_Code)),
                    tags$span(class = "box box-widget widget-user")
                ))
        ),
        
        
        tags$div(
            class = "Bar Graph", 
            # Add the bg color to the header using any of the bg-* classes
            ## Box Header ##
            plotOutput("barGraph",height = 500)
            
        )
        
        
        
        
        
        
        
    )
))