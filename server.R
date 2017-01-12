



#==========Required - Library=========================

suppressPackageStartupMessages(c(
        library(shinythemes),
        library(shiny),
        library(tm),
        library(stringr),
        library(markdown),
        library(stylo)))

#======== data-base ====================================
dataC <- readRDS(file="./data/dataC.RData")
dataB <- readRDS(file="./data/dataB.RData")
dataA <- readRDS(file="./data/dataA.RData")



#==================== Input-cleaner ========================
data_Cleaner<-function(text){
  
  cleanText <- tolower(text)
  cleanText <- removePunctuation(cleanText)
  cleanText <- removeNumbers(cleanText)
  cleanText <- str_replace_all(cleanText, "[^[:alnum:]]", " ")
  cleanText <- stripWhitespace(cleanText)
  
  return(cleanText)
}

clean_Input <- function(text){
  
  textInput <- data_Cleaner(text)
  textInput <- txt.to.words.ext(textInput, 
                                language="English.all", 
                                preserve.case = TRUE)
  
  return(textInput)
}


#======= main - prediction - engine==================================================

next_Word_Predictor <- function(wordCount,textInput){
  
  if (wordCount>=3) {
    textInput <- textInput[(wordCount-2):wordCount] 
    
  }
  
  else if(wordCount==2) {
    textInput <- c(NA,textInput)   
  }
  
  else {
    textInput <- c(NA,NA,textInput)
  }
  
  
  
  wordPrediction <- as.character(dataC[dataC$unigram==textInput[1] & 
                                         dataC$bigram==textInput[2] & 
                                         dataC$trigram==textInput[3],][1,]$quadgram)
  
  if(is.na(wordPrediction)) {
    wordPrediction1 <- as.character(dataB[dataB$unigram==textInput[2] & 
                                            dataB$bigram==textInput[3],][1,]$trigram)
    
    if(is.na(wordPrediction)) {
      wordPrediction <- as.character(dataA[dataA$unigram==textInput[3],][1,]$bigram)
    }
  }
  
  
  print(wordPrediction)
  
}


#================== Main Server=======================

shinyServer(function(input, output) {
        
        wordPrediction <- reactive({
                text <- input$text
                textInput <- clean_Input(text)
                wordCount <- length(textInput)
                wordPrediction <- next_Word_Predictor(wordCount,textInput)})
        
        output$predictedWord <- renderPrint(wordPrediction())
        output$enteredWords <- renderText({ input$text }, quoted = FALSE)
})



#===================== The end =================================================







