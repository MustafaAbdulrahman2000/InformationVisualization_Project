#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
 
  # Print mean
  output$Mean <- renderText({
    mean(CompletedDataSet$age_get_prize)
  })
  
  # Print standard deviation
  output$SD <- renderText({
    sqrt(var(CompletedDataSet$age_get_prize))
  })
  
  # Print number of male winners
  output$Males <- renderText({
    Male <- CompletedDataSet[CompletedDataSet$gender == "male",]
    nrow(Male)
  })
  
  # Print number of female winners
  output$Females <- renderText({
    Female <- CompletedDataSet[CompletedDataSet$gender == "female",]
    nrow(Female)
  })
  
  # Print Structure of dataset
  output$Struct <- renderPrint({
    str(CompletedDataSet)
  })
  
  
  # Create Pie chart
  MyData <- CompletedDataSet
  
  output$PieChart <- renderPlot({
    
    
    # Prepare Chart inputs 
    Values <- as.numeric(unique(CompletedDataSet$share))
    Labels <- as.character(Values)
    percentage <- round(Values/sum(Values)*100)
    Labels <- paste("Share between",Labels,sep = " ")
    Labels <- paste(Labels,percentage, sep = " -")
    Labels <- paste(Labels,"%",sep = "")
   
    
    
    # Draw chart
     pie(Values,labels = Labels,col = rainbow(4), main ="Sharing of Nobel prize")
  })
  
  
  output$Hist <- renderPlot({
    # Prepare diagram inputs
    Ages <- CompletedDataSet$age_get_prize

    
    # Create diagram
    par(mfrow = c(1,2))
    hist(Ages,main = "Age when person get the Nobel prize",xlab = "Ages", ylab = "Frequency",col= "brown")
    
    # Prepare diagram inputs
    Male <- CompletedDataSet[CompletedDataSet$gender == "male",]
    Female <- CompletedDataSet[CompletedDataSet$gender == "female",]
    
    # Create diagram
    boxplot(Male$age_get_prize,Female$age_get_prize,main = "Age when person get the Nobel prize",xlab = "Gender", ylab = "Ages",col = "yellow",names = c("Male","Female"))
    
  })  
  
  output$Bar <- renderPlot({
    # Prepare diagram inputs
    physics <- CompletedDataSet[CompletedDataSet$category == "physics",]
    peace <- CompletedDataSet[CompletedDataSet$category == "peace",] 
    medicine <- CompletedDataSet[CompletedDataSet$category == "medicine",]
    economics <- CompletedDataSet[CompletedDataSet$category == "economics",]
    chemistry <- CompletedDataSet[CompletedDataSet$category == "chemistry",]
    
    Categorynames <- as.character(unique(CompletedDataSet$category))
    tab <- c(nrow(physics), nrow(chemistry), nrow(peace), nrow(medicine), nrow(chemistry))
    
    # Create diagram
    barplot(tab,names.arg = Categorynames, xlab = "Category", ylab = "Frequency" ,main = "Persons in each category",col = rainbow(5))
    
  })  
 
  
  
})

