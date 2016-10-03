library(shiny)

shinyServer(function(input, output) {

  x <- c(1, 2, 3, 4)
  y <- c(2, 4, 3, 5)
    
  output$main_plot <- renderPlot({

    res <- lm(y ~ x)
    
    layout(matrix(c(1,1, 2, 2), ncol=2), widths=c(3,1))
    
    par(cex=1.3)
    plot(x, y, xlim=c(-1, 6), ylim=c(-1, 6), pch=20, cex=1.3)
    
    abline(a=input$alpha, b=input$beta, lwd=3, col="blue")
    
    segments(x, input$alpha+input$beta*x, x, y)
          
	sse <- sum((y - (input$alpha+input$beta*x))**2)
    bp <- barplot(sse, col="#0000BB66", ylim=c(0, 15), main="Residualkvadratsum")
    text(bp, 1, sse)
    
  })
})
