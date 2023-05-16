fluidPage(

  sidebarLayout(
    
    sidebarPanel(
      selectInput("month", label = "Select a month:", choices = unique(airquality$Month)),
      selectInput("column", label = "Select a column to plot:", choices = c("Wind", "Temp")),
      checkboxInput("showTitle", label = "Check to enter title", value = FALSE),
      conditionalPanel(condition = "input.showTitle == true",
                       textInput("title", label = "Enter a plot title", placeholder = "Title")),
      width = 3
    ),
    
    mainPanel(
      fluidRow( # total width = 12
        column(width = 6, DTOutput(outputId = "datatable1")),
        column(width = 6, plotOutput(outputId = "plot1")),
      ),
      width = 9
    )
  ),
  
)