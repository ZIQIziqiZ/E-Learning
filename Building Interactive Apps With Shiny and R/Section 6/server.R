function(input, output){
  
  filteredData <- reactive({
    
    filteredData <- airquality[airquality$Month == input$month,]
    
    return(filteredData)
    
  })
  
  output$datatable1 <- renderDT({
    datatable(filteredData(), options = list(pageLength = 10, 
                                             lengthMenu = c(5,10,15,20)))
  })
  
  output$plot1 <- renderPlot({
    
    if(input$showTitle == TRUE){
      
      ggplot(data = filteredData(), aes_string(x = "Day", y = input$column)) +
        geom_point() +
        geom_line() +
        ggtitle(input$title)
      
    } else{
      
      ggplot(data = filteredData(), aes_string(x = "Day", y = input$column)) +
        geom_point() +
        geom_line()
      
    }
  })
  
}