

#============= Required Libraries======================
suppressPackageStartupMessages(c(
        library(tm),
        library(shiny),
        library(shinythemes),
        library(stringr),
        library(markdown),
        library(stylo)))



#================= main program==============================

shinyUI(navbarPage(  #--------------------start------------------
  
                   "Capstone Project", 
                   
                   theme = shinytheme("united"),
                   

## ==============Tab - Prediction===================

tabPanel("Next Word Prediction",
         fluidRow(
           
           column(3),
           column(6, 
         
         tags$span(style="color:grey", 
                   tags$footer(
                     
                     ("Word Predictor App built with"), tags$a(
                       href="http://www.r-project.org/",
                       target="_blank",
                       "R"),
                     ("&"), tags$a(
                       href="http://shiny.rstudio.com",
                       target="_blank",
                       "Shiny."),
                     
                     tags$br(),
                     
                     ("Special thanks to"), tags$a(
                       href="https://www.coursera.org/",
                       target="_blank",
                       "Coursera"),
                     (","), tags$a(
                       href="https://swiftkey.com/en",
                       target="_blank",
                       "SwiftKey"),
                     ("&"), tags$a(
                       href="https://www.coursera.org/learn/data-science-project/",
                       target="_blank",
                       "JHU DataScience Team"),
                     
                     tags$br(),
                   
                     align = "center"))
           )),
                   
                   tags$br(),
         
         
         
         tags$head(includeScript("./js/ga-shinyapps-io.js")),
         
         fluidRow(
                 
                 column(3),
                 column(6,
                        tags$div(textInput("text", 
                                  label = h2("Universe"),
                                  value = ),
                        tags$span(style="color:grey",("Please, enter some text above.")),
                        br(),
                        tags$hr(),
                        h4("The Predicted Next Word:"),
                        tags$span(style="color:blue",
                                  tags$strong(tags$h3(textOutput("predictedWord")))),
                        br(),
                        #tags$hr(),
                        #h4("Typed Words:"),
                        #tags$em(tags$h4(textOutput("enteredWords"))),
                        align="center")
                        ),
                 column(3)
         )
),


## ==============Tab  - Application Document ============================================

tabPanel("Application Documents",
         fluidRow(
                 column(2,
                        p("")),
                 column(8,
                        includeMarkdown("./about/about.md")),
                 column(2,
                        p(""))
         )
),



## =================Tab- Footer==============================

tags$hr(),

tags$br(),

tags$span(style="color:grey;font-style:italic", 
          
          fluidRow(
            
            column(3),
            column(6,  
          
          
          tags$footer(
            
                      ("About Application:"),
                      tags$br(),
                      ("As you enter your text, this app runs a computational linguistics  model for Text-Analytics called" ),
                      tags$br(),
                      ("  'probabilistic n-gram model' over 'swiftkey-data' and predicts your next word."),
                      
                      tags$br(), 
                       
                      ("© 2016 - "), 
                    tags$a(
                     href="https://www.linkedin.com/in/dibakar-sigdel-3b4428a3",
                     target="_blank",
                     "Dibakar Sigdel."),

                    
                    ("View R-codes on"), 
                    tags$a(
                      href="https://github.com/RLocation/R-cap-Project",
                      target="_blank",
                      "github."),
                    
                    
                      align = "center")
          
)),
          
          tags$br()
)

) #------------------------------end-----------
)
