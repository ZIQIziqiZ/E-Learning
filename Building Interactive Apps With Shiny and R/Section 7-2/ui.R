fluidPage(
  
  sidebarLayout(
    sidebarPanel(
      # selectInput("cylSelector", label = "Select a cylinder", choices = cylinderChoices),
      
      fileInput("file1", "Upload a csv file:",
                multiple = FALSE,
                accept = c(".csv")),
      textInput("sep", label = "Enter the separator character:", value = ","),
      checkboxInput("header", label = "File contains a header", value = TRUE)
    ),
    
    mainPanel(
      # DTOutput("datatable1"),
      # downloadButton("downloadData", "Download Data"),
      
      DTOutput("data1"),
    )
  )

)