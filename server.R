library(shiny)
library(ggplot2)
data(ToothGrowth)
d=ToothGrowth

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
 
  output$summary = renderPrint({
    summary(d)
    })

  output$text1 = renderText({ 
      paste("You have selected", input$supplement, ":")
    })

  datasetInput= reactive({
  	if (input$supplement == "Orange Juice"){d2=subset(d,d$supp=="OJ")} 
  	if (input$supplement == "Vitamin C"){d2=subset(d,d$supp=="VC")}
  	return(d2)
  	})  

  output$summary2 <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
	}) 

  output$text2 = renderText({ 
      paste("Below is the boxplot for Tooth Length per dose, as well as a regression of Tooth Length on dose for your chosen supplement,", input$supplement, ".")
    })

  output$boxPlot = renderPlot({
  	dataset <- datasetInput()
	  qplot(factor(dose), len, data=dataset, geom=c("boxplot", "jitter"), 
	   fill=dose,
   		xlab="Dose of Supplement", ylab="Tooth Length")
  	})

  output$Plot2 = renderPlot({
  	dataset <- datasetInput()
	qplot(dose, len, data=dataset, geom=c("point", "smooth"), 
   	method="lm", formula=y~x, color=len, 
   	xlab="Dose of Supplement", ylab="Tooth Length")
	})
})

