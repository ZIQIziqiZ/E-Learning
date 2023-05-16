fluidPage(
  
  sidebarLayout(
    sidebarPanel(
      selectInput("cylSelector", label = "Select a cylinder", choices = cylinderChoices),

    ),
    
    mainPanel(
      DTOutput("datatable1"),
      downloadButton("downloadData", "Download Data"),

    )
  )

)