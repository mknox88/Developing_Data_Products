library(shiny)

data(cars)
lm_cars <- lm(dist ~ speed, data=cars)

stopping_distance <- function(speed_in) {
    new <- data.frame(speed = speed_in)
    round(predict(lm_cars, new), 0)
}

shinyServer(
    function(input, output) {
        output$inputValue <- renderPrint({paste(input$speed, "mph")})
        output$prediction <- renderPrint({paste(stopping_distance(input$speed), "ft")})
    }
)