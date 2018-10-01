server <- function(input, output, session) {
 source("fagan.r")
  
  
  LR<-reactive({
    if(input$select=="Positive"){
      a<-input$sens/(100-input$spec)
      } else {
     a<-(100-input$sens)/(input$spec)
        
        return(a)
        }
  }
    )
  
  live.infobox.val <- reactive({
    logits <- function(p) log(p/(1 - p))  
    logits.pre <- logits(input$pre/100)  
    logits.post <- log(LR()) + logits.pre
    post <- exp(logits.post)/(1 + exp(logits.post))
    #compl.logit.pre <- logits(1 - probs.pre)
    return(paste(round(post*100,2),"%"))
    get.infobox.val()         # call our function from above
  })

  output$Results= renderText({"<h3>Results</h3>"})
  
  output$postValue <- renderInfoBox({
   infoBox(
    "Probability of Disease",
    live.infobox.val(),
  icon = icon("signal"),
  color = "purple",
  fill = TRUE)
})
  
  
  
  # output$Post<-reactive({
  #   
  #     logits <- function(p) log(p/(1 - p))  
  #     logits.pre <- logits(input$pre)  
  #     logits.post <- log(LR()) + logits.pre
  #     post <- exp(logits.post)/(1 + exp(logits.post))
  #     #compl.logit.pre <- logits(1 - probs.pre)
  #     return(paste(round(post*100,2),"%"))
  #   
  #   
  #   
  #   
  # })
  
  output$plot1 <- renderPlot({
    fagan_plot(input$pre, LR())
  })
}
