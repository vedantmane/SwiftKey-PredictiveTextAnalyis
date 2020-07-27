library(shiny)
print("Loading...!!!")
source("./prepareText.R")
source("./predictWord.R")
print("done...")
shinyServer(function(input, output, session) {
    
    resultList <- reactive({
        if(nchar(input$userInput) > 0){
            as.character(prepareText(input$userInput)$nextword)[1:10]
        }
        else {
            as.character(predictUnigram()$word)[1:10]
        }
    })
    
    output$guess <- renderTable({
        outputTable <- data.frame(resultList())
        outputTable$Order = (1:10)
        outputTable <- outputTable[c(2,1)]
        colnames(outputTable) <- c("Order", "Prediction")
        outputTable
    },
    caption=paste("Text Prediction: N-gram Model + Stupid BackOff"),
    width = '400px',
    spacing = 'l',
    hover = TRUE,
    align = "c",
    striped = TRUE
    )
    
})
