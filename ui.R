library(shinydashboard)
library(shiny)

ui <- dashboardPage(
  dashboardHeader(title = "Diagnostic Bayes Calculator"),
  dashboardSidebar(
    sidebarMenu(
    
    menuItem("Introduction", tabName = "Intro", icon = icon("dashboard")),
    

    
    menuItem("Bayes calculator  ", tabName="Bayes "),
    
    hr(),
             
    div("Shiny app by",br(), 
        p("",
          a(href="https://www.linkedin.com/in/massimo-tranquillo-1301552a/",target="_blank",
            "Massimo Tranquillo"),align="left", style = "font-size: 8pt")
    ),
    
    div("R code by",br(),
        p("",
          a(href="https://www.linkedin.com/in/stefano-guazzetti-1990831b/",target="_blank",
            "Stefano Guazzetti"),align="left", style = "font-size: 8pt"),
        p("",
          a(href="https://www.linkedin.com/in/massimo-tranquillo-1301552a/",target="_blank",
            "Massimo Tranquillo"),align="left", style = "font-size: 8pt")
    )
    
       
                   
                   )
    ),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    
    tabItems(tabItem(tabName = "Intro",
              fluidRow(
                box(title="Introducing Diagnostic Bayes Calculator", 
                    status="primary",
                    solidHeader = TRUE,
                    width = 12,
               includeHTML("bayes.html"))
              )     
                     
    ),
        tabItem(tabName="Bayes",              
    
       fluidRow(
      box(selectInput("select", label = ("Test result"), 
                      choices = list("Positive", "Negative" ), 
                      selected = ""),
          
          sliderInput("pre", "Pretest probability of disease", 0, 100, 50),
          
          sliderInput("sens","Sensitivity", 0,100,50),
          
          sliderInput("spec","Specificity", 0,100,50),
      
      # htmlOutput("Results"),
      br(),br()
        
      ),
      
      #box( title = "Probability of Disease", status = "primary",solidHeader = TRUE,
         #textOutput("Post"),background = "red")),
      infoBoxOutput("postValue",width = 6),
       box(plotOutput("plot1", height=500))
      
      
      
    
    )
  )
)))