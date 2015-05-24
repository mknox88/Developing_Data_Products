```
data(cars)
lm_cars <- lm(dist ~ speed, data=cars)

stopping_distance <- function(speed_in) {
    df_speed <- data.frame(speed = speed_in)
    round(predict(lm_cars, df_speed), 0)
}

shinyServer(
    function(input, output) {
        output$inputValue <- renderPrint({paste(input$speed, "mph")})
        output$prediction <- renderPrint({paste(stopping_distance(input$speed), "ft")})
        output$myPlot <- renderPlot({
            pred_dist <- stopping_distance(input$speed)
            plot(x=cars$speed, y=cars$dist, col="black",
                 main="Stopping Distance",
                 xlab="Speed (mph)",
                 ylab="Distance (ft)",
                 xlim=c(0, max(max(cars$speed), input$speed)),
                 ylim=c(0, max(max(cars$dist), pred_dist))
            )
            abline(lm_cars, col="red", lwd=3)
            points(x=input$speed, y=pred_dist, pch=3, col="blue", lwd=4)
            lines(x=c(input$speed, input$speed), y=c(0, pred_dist), col="gray60", lty=2)
            lines(x=c(0, input$speed), y=c(pred_dist, pred_dist), col="gray60", lty=2)
        })
    }
)
```
