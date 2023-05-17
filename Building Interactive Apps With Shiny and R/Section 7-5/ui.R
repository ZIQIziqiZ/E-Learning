dashboardPage(
  dashboardHeader(title = "Baseball App",
                  dropdownMenu(type = "messages", # manually define messages
                               messageItem(from = "Mike",
                                           message = "This is a test message")
                               ),
                  dropdownMenuOutput(outputId = "messageMenu"), # define messages through server
                  dropdownMenu(type = "notifications",
                               notificationItem(text = "This is a text notification")
                               ),
                  dropdownMenu(type = "tasks",
                               taskItem(text = "This is a test task", value = 50)
                               )
                  ),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        text = "Player Data",
        startExpanded = TRUE,
        menuSubItem(text = "Data", tabName = "playerData"),
        menuSubItem(text = "Plot", tabName = "playerPlot")
      ),
      
      menuItem(text = "Data per Team/Year", tabName = "dataPerTeamYear"),
      menuItem(text = "Yearly Leaders", tabName = "yearlyLeaders"),
      
      selectInput("playerSelect", label = "Select a player:", choices = playerChoices),
      selectInput("teamSelect", label = "Select which team to view:", choices = teamChoices),
      selectInput("yearSelect", label = "Select which year to view:", choices = yearChoices),
      selectInput("metricSelect", label = "Select which stat to display:", choices = metricChoices)
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "playerData",
              DTOutput("careerPlayerTable"),
              DTOutput("yearlyPlayerTable")
              ),
      tabItem(tabName = "playerPlot",
              plotOutput("yearPlayerPlot")
              ),
      tabItem(tabName = "dataPerTeamYear",
              DTOutput("teamYear")
              ),
      tabItem(tabName = "yearlyLeaders",
              plotOutput("yearLeaderPlot")
              )
    )
  )
)