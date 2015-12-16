library(shiny)

#Define UI for dataset viewer application
shinyUI(fluidPage(
  
  #Application Title
  titlePanel("ToothGrowth Shiny App"),

  sidebarLayout(
    sidebarPanel(h4("Description"),
      p("The following uses the ToothGrowth dataset from R to analyse the tooth length of subjects using various doses of either Vitamin C or Orange Juice. In the drop down menu below, choose the supplement you wish to analyse further. The 'Data Summary' tab displays the statistical summary of the data, the 'Plots' tab displays two plots to aid in visualising the data."),
         selectInput("supplement", "Choose a supplement:", 
                     choices = c("Orange Juice", "Vitamin C")),
         img(src = "tooth.jpg", height = 150, width = 150)
             ),

    mainPanel( 
      tabsetPanel(type = "tabs", 
        tabPanel("Data Summary",
          p("We can see the summary of the ToothGrowth dataset below and compare it to the summary of the data of the chosen supplement:"),
          verbatimTextOutput("summary"),
          textOutput("text1"),
          verbatimTextOutput("summary2")),
        tabPanel("Plots", 
          textOutput("text2"),
          plotOutput("boxPlot"),
          plotOutput("Plot2"))      
              )
            ) 
    )
))