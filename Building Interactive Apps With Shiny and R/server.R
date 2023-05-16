library(DT)
library(ggplot2)

function(input, output){
  data("mtcars")
  mtcars$cyl <- as.factor(mtcars$cyl)
  
  output$dt1 <- renderDT({
    datatable(mtcars, options = list(pageLength = 10,
                                     lengthMenu = c(5,10,15,20)))
  })
  
  output$plot1 <- renderPlot({
    ggplot(data = mtcars, aes(x = wt, y = mpg, color = cyl)) + 
      geom_point()
  })
}