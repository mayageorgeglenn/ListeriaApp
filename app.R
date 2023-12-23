library(shiny)


##I am going to operate my app based off of the random assumption that 

# Define UI ----
ui <- fluidPage(
  titlePanel("Listeria Detection App"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a color"),
      
      radioButtons("pic1", 
                  label = "Color of first photo ",
                  choices = c("pink", 
                              "orange",
                              "light orange", 
                              "yellow"),
                  selected = "pink"),
      
      radioButtons("pic2", 
                  label = "Color of second photo",
                  choices = c("pink", "orange", "light orange", "yellow"), selected = "pink") ,
    
    radioButtons("pic3", 
                 label = "Color of third photo",
                 choices = c("pink", "orange", "light orange", "yellow"), selected = "pink"),
    
    radioButtons("pic4", 
                 label = "Color of fourth photo",
                 choices = c("pink", "orange", "light orange", "yellow"), selected = "pink")
    
    
  ),
    
    
    
    mainPanel(
      textOutput("selected_pic1"),
      textOutput("selected_pic2"), 
      textOutput("selected_pic3"),
      textOutput("selected_pic4"), 
      textOutput("result")
    )
  )
)

# Define server logic ----
server <- function(input, output) {
  
  output$selected_pic1 <- renderText({ 
    paste("You have selected", input$pic1, " for your first color")
  })
  
  output$selected_pic2 <- renderText({
    paste("You have chosen", input$pic2, " for your second color")
  })
  
  output$selected_pic3 <- renderText({
    paste("You have chosen", input$pic3, " for your third color")
  })
  
  output$selected_pic4 <- renderText({
    paste("You have chosen", input$pic4, " for your foruth color")
  })
  
  output$result <- renderText({
    answer <- FALSE
    
    if(input$pic1 == "pink" & input$pic2 == "orange" & input$pic3 == "light orange" & input$pic4 == "yellow"){
      answer <- TRUE
    }
    
    if(answer == TRUE){ 
    print("Your result is positive")
    }
    else{
      print("Your result is negative")
    }
  })
  
  
  
}

# Run the app ----
shinyApp(ui = ui, server = server)
