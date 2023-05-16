### Multi-Page Layout

## Tabset Panel
# fluidPage(
# 
#   sidebarLayout(
#     
#     sidebarPanel(
#       selectInput("month", label = "Select a month:", choices = unique(airquality$Month)),
#       selectInput("column", label = "Select a column to plot:", choices = c("Wind", "Temp")),
#       checkboxInput("showTitle", label = "Check to enter title", value = FALSE),
#       conditionalPanel(condition = "input.showTitle == true",
#                        textInput("title", label = "Enter a plot title", placeholder = "Title")),
#       width = 3
#     ),
#     
#     mainPanel(
#       tabsetPanel(
#         tabPanel("Data Table", DTOutput(outputId = "datatable1")),
#         tabPanel("Plot", plotOutput(outputId = "plot1"))
#       ),
#       width = 9
#     )
#   ),
#   
# )

## Navbar Panel
# navbarPage("Navbar Example",
#            tabPanel("Input",
#                     selectInput("month", label = "Select a month:", choices = unique(airquality$Month)),
#                     selectInput("column", label = "Select a column to plot:", choices = c("Wind", "Temp")),
#                     checkboxInput("showTitle", label = "Check to enter title", value = FALSE),
#                     conditionalPanel(condition = "input.showTitle == true",
#                                      textInput("title", label = "Enter a plot title", placeholder = "Title"))
#                     ),
#            navbarMenu("Output",
#                       tabPanel("Data Table", DTOutput(outputId = "datatable1")),
#                       tabPanel("Plot", plotOutput(outputId = "plot1")))
#            )

## Navlist Panel
fluidPage(
  navlistPanel("Navlist Example",
               tabPanel("Input",
                        selectInput("month", label = "Select a month:", choices = unique(airquality$Month)),
                        selectInput("column", label = "Select a column to plot:", choices = c("Wind", "Temp")),
                        checkboxInput("showTitle", label = "Check to enter title", value = FALSE),
                        conditionalPanel(condition = "input.showTitle == true",
                                         textInput("title", label = "Enter a plot title", placeholder = "Title"))
                        ),
               tabPanel("Plot",
                        plotOutput(outputId = "plot1")
                        ),
               tabPanel("Data Table",
                        DTOutput(outputId = "datatable1")
                        )
               )

)