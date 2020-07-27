library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # Application title
    titlePanel("Swift - Text Prediction"),
    tabsetPanel(
        tabPanel("App Main Page",
                sidebarLayout(
                    sidebarPanel(
                        textInput('userInput', label = "Input your phrase here:", 
                                  value = "", placeholder = "Type your message..."),
                        br(),
                        helpText("Note:",br(),
                                "The following predicted word will show up automatically as you input."),
                        hr(),
                        h4("Made by Vedant Mane :-)"),
                        a(p("View Milestone Report"), href="https://rpubs.com/vedantmane/predictionText"),
                        a(p("View Presentation"), href=""),
                        a(p("Click here to jump to the Github Repository."), href="https://github.com/vedantmane/SwiftKey-PredictiveTextAnalyis")
                        ),
                    mainPanel(
                        h4("Voila! Here are the top 10 predictions:"),
                        tableOutput('guess')
                    )
                )
        ),
        
        tabPanel("Exploratory Analysis", h3("Dataset Summary"),
                div(img(src='tab.png', width='500px', height='140px'), style = "text-align: center;"),
                h3("Word-Cloud"),
                div(img(src='wordcloud.png', width='500px', height='500px'), style = "text-align: center;"),
                h3("Highest Frequency Uni-Gram"),
                div(img(src='unigram.png', width='600px', height='400px'), style = "text-align: center;"),
                h3("Highest Frequency Bi-Gram"),
                div(img(src='bigram.png', width='600px', height='400px'), style = "text-align: center;"),
                h3("Highest Frequency Tri-Gram"),
                div(img(src='trigram.png', width='600px', height='400px'), style = "text-align: center;"),
                h3("Highest Frequency Quad-Gram"),
                div(img(src='quadgram.png', width='600px', height='400px'), style = "text-align: center;"),
                h3("Highest Frequency Penta-Gram"),
                div(img(src='pentagram.png', width='600px', height='400px'), style = "text-align: center;"),
                h5("For more information of exploratory analysis of dateset, please refer to my milestone document."),
                a(div(p("vedantmane/predictionText"), style = "align: center;"), href="https://rpubs.com/vedantmane/predictionText")
        )
        
    ),
    hr(),
    h4("Made by Vedant Mane :-)",
       a(p("Click here to jump to the Github Repository."), href="https://github.com/vedantmane/SwiftKey-PredictiveTextAnalyis")
    ))
)
