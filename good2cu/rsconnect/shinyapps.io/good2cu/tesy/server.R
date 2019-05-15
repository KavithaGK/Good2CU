library(shiny)
library(datasets)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(session,input, output) {
    
    addClass(selector = "body", class = "sidebar-collapse")
    
    # filter(EducationType == input$'EducationType')
    
    observe({
        filteredData <- df_new %>% filter(SchoolType == input$'SchoolType') %>% select('EducationType')
        print(filteredData)
        updateSelectInput(session,"EducationType", "Choose your Education type",choices = unique(filteredData))
        
        
    })
    
    dat <- reactive({
        fData <- df_new %>% filter(SchoolType == input$'SchoolType' & EducationType == input$'EducationType')  
        #print(fData)
    })
    
    
    output$barGraph <- renderPlot({
        
        
        our_data <- dat()
        
        #barplot(v2,names.arg=li,xlab="School Name",ylab="Parents Preference",main = "Schools & Parents Preference ", col = "blue", border="red")
        
        
        barplot(our_data$`Total Population`,names.arg=our_data$School_Name,xlab="School Name",ylab="Parents Preference",main = "Schools & Parents Preference ", col = "blue", border="red")
    })
    
    
    
})