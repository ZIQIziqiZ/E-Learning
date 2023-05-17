function(input, output){
  
  messageData <- data.frame(from = c("Finance", "Accounting", "HR"),
                            message = c("Revenue is up", "Budget meeting this Friday", "Donuts in the breakroom"))
  
  output$messageMenu <- renderMenu({
    msg <- apply(messageData, 1, function(row){
      messageItem(from = row[['from']], message = row[['message']])
      })
    
    dropdownMenu(type = "messages", .list = msg)
    
  })
  
  ## 1st tab
  playerData <- reactive({ # specific player, for career and yearly table, and player plot
    filteredData <- subset(allBaseballData, name == input$playerSelect)
    return(filteredData)
  })
  
  playerCareerData <- reactive({
    data <- playerData()
    final <- data.table(data)[,list(G = sum(G),
                                    AB = sum(AB),
                                    R = sum(R),
                                    H = sum(H),
                                    Doubles = sum(Doubles),
                                    Triples = sum(Triples),
                                    HR = sum(HR),
                                    RBI = sum(RBI),
                                    BB = sum(BB),
                                    SO = sum(SO)),
                              by = list(name)]
    return(final)
  })
  
  output$careerPlayerTable <- renderDT({
    data <- playerCareerData()
    datatable(data, options = list(pageLength = nrow(data)))
  })
  
  output$yearlyPlayerTable <- renderDT({
    data <- playerData()
    datatable(data, options = list(pageLength = nrow(data)))
  })
  
  ## 2nd tab
  output$yearPlayerPlot <- renderPlot({
    ggplot(playerData()) +
      geom_col(aes_string(x = "yearID", y = input$metricSelect), fill = "violet") +
      ggtitle(paste0(input$metricSelect, " per Year for ", input$playerSelect))
  })
  
  ## 3rd tab
  teamYearData <- reactive({ # one row for each team & year
    filteredData <- subset(allBaseballData, franchName == input$teamSelect)
    final <- data.table(filteredData)[,list(G = sum(G),
                                            AB = sum(AB),
                                            R = sum(R),
                                            H = sum(H),
                                            Doubles = sum(Doubles),
                                            Triples = sum(Triples),
                                            HR = sum(HR),
                                            RBI = sum(RBI),
                                            BB = sum(BB),
                                            SO = sum(SO)),
                                      by = list(franchName, yearID)]
    return(final)
  })
  
  output$teamYear <- renderDT({
    data <- teamYearData()
    datatable(data, options = list(pageLength = nrow(data)))
  })
  
  ## 4th tab
  yearlyLeaderData <- reactive({ # given year & metric, obtain top 10 players
    filteredData <- subset(allBaseballData, yearID == input$yearSelect)
    orderedData <- filteredData[order(filteredData[input$metricSelect], decreasing = T), ]
    top10 <- orderedData[1:10,]
    top10$name <- factor(top10$name, levels = unique(top10$name))
    return(top10)
  })
  
  output$yearLeaderPlot <- renderPlot({
    ggplot(yearlyLeaderData()) +
      geom_col(aes_string(x = "name", y = input$metricSelect), fill = "purple") +
      ggtitle(paste0(input$metricSelect, " Leaders for Year ", input$yearSelect))
  })
  
}