library(shiny)
shinyUI(fluidPage(
    h1("Employee Satisfaction Regression Model Shiny App"),
    p("This Shiny App is designed to evaluate potential linear regression models 
      for the ", tags$i("attitude"), " data set in the R datasets package.  The 
    ", tags$i("attitude"), " data set is described in R as follows:"),
    
    h4("Attitude Data Set Description"),
    
    p("From a survey of the clerical employees of a large financial 
      organization, the data are aggregated from the questionnaires of the 
      approximately 35 employees for each of 30 (randomly selected) departments. 
      The numbers give the percent proportion of favourable responses to seven 
      questions in each department."),
    
    h4("Instructions"),
    
    p("This Shiny App will fit a linear regression model with output ", 
      tags$i("'rating'"), " to the selected regressor variables."),
    
    tags$ol(
        tags$li("Select one or more regressor variables from the blue Model 
                Selection box on the left."),
        tags$li("Click the Run Simulation button"),
        tags$li("Review the output of the linear regression model in the Model \
                Evaluation section on the right.")
    ),
    
    hr(),
    
    fluidRow(
        column(4, style = "background-color:aliceblue;",
               h2('Model Selection'),
               checkboxGroupInput("variables","Select the predictor variables",
                                  c("Handling of employee complaints" = 
                                        "complaints",
                                    "Does not allow special privileges" = 
                                        "privileges",
                                    "Opportunity to learn" = 
                                        "learning",
                                    "Raises based on performance" = 
                                        "raises",
                                    "Too critical" = 
                                        "critical",
                                    "Opportunity for advancement" = 
                                        "advance")),
               submitButton("Run Simulation")
        ),
        column(8, 
               h2('Model Evaluation'),
               h4('Selected linear model'),
               verbatimTextOutput("ovariables"),
               h4('Adjusted R^2 value:'),
               p('This value gives the percent of variace explained by the model (R^2), 
            but is adjusted to penalize for high p-values.  We want a model that
            maximizes this number.'),
               verbatimTextOutput("Rsquared2"),
               h4('Residuals plots'),
               p('The following plots can be used tio evaluate the quality of 
                 the linear model.'),
               plotOutput("myplot")
        )
    )
))