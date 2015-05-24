library(markdown)

shinyUI(navbarPage(
    " ",
    
    tabPanel("Main",
        fluidRow(
            column(width=3, ""),
            column(width=8, h1('Stopping Distance Prediction'))
        ),
        br(),
        sidebarLayout(
            sidebarPanel(
                width=5,
                h4('Select speed of car and click Predict'),
                br(),
                sliderInput('speed', 'Speed of Car (mph):', value=50, min=5, max=200, step=5),
                fluidRow(
                    column(width=4, ""),
                    column(width=8, submitButton('Predict'))
                )
            ),
            mainPanel(
                width=7,
                h3('Prediction Results'),
                br(),
                h4('You entered a speed of:'),
                verbatimTextOutput("inputValue"),
                h4('Which resulted in a predicted stopping distance of:'),
                verbatimTextOutput("prediction")
            )
        )
    ),
    tabPanel("Help",
        fluidRow(
            column(width=12, includeMarkdown("help.md"))
        )
    ),
    tabPanel("Source Code",
        tabsetPanel(type="tabs",
            tabPanel("ui.R",
                fluidRow(
                    column(width=12, includeMarkdown("ui.md"))
                )
            ),
            tabPanel("server.R",
                 fluidRow(
                     column(width=12, includeMarkdown("server.md"))
                 )
            )
        )
    )
))