library(shiny)
library(datasets)
data(attitude)

shinyServer(
    function(input, output){
        ## Display formula for the selected linear model.  If no variables are 
        ## selected when the "go"Run simulation" button is pressed, then it 
        ## tells you "no formula selected".
        lmformula <- reactive(
            ifelse(is.null(input$variables),
                   "No formula selected",
                   paste("rating", paste(input$variables, collapse = " + "), 
                  sep = " ~ "))
        )  
        output$ovariables <- renderPrint({lmformula()})    
        
        ## Construct the linear model
        att <- reactive(
            lm(rating ~ . , data = attitude[c("rating", input$variables)]))
        
        output$Rsquared <- renderPrint({round(summary(att())$r.squared*100,1)})
        output$Rsquared2 <- renderPrint({round(summary(att())$adj.r.squared*100,1)})

        output$myplot <- renderPlot({
            if(is.null(input$variables))
                return()
            par(mfrow=c(2,2), mar=c(3,2,2,2) )
            plot(att())
        })
    }
)