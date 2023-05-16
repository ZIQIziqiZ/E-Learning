function(input, output){
  
  filteredData <- reactive({
    
    filteredData <- mtcars[mtcars$cyl == input$cylSelector,]
    
    return(filteredData)
    
  })
  
  output$datatable1 <- renderDT({
    datatable(filteredData(), options = list(pageLength = 10, 
                                             lengthMenu = c(5,10,15,20)))
  })
  
  output$downloadData <- 
    downloadHandler(
      filename = "FilteredData.csv",
      content = function(file){
        write.csv(filteredData()[input[["datatable1_rows_all"]], ], file)
      }
    )

}