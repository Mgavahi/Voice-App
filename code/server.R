# Import required libraries ----
library(shiny)

# Define server ----
shinyServer(function(input, output) {
    
    # reactive function for regression ----
    lm_line <- reactive({
        input$yes
        fit = lm(formula = dist ~ speed, 
                 data = cars)
        lines(x = cars$speed, 
              predict(fit, cars), 
              lwd = 2)
    })
    # reactive function for render plot ----
    output$voicePlot <- renderPlot({
        col = input$color
        if (length(col) == 0 || !(col %in% colors())) {
            col = 'gray'
        }
        # drawing plot in output ----
        plot(
            cars,
            main = input$title,
            col = col,
            cex = input$bigger,
            pch = 19
        )
        # drawing regression line in output ----
        lm_line()
    })
}
)
