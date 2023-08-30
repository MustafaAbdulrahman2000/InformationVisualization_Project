# Load project libraries
library(shiny)
library(shinydashboard)


# Create basic layout of shiny dashboard web application
dashboardPage(
  dashboardHeader(
    title = "Nobel prize dashboard web application",
    titleWidth = 500,
    tags$li(class= "dropdown",
            tags$a(
            href = "https://www.kaggle.com/datasets/bahramjannesarr/nobel-prize-from-1901-till-2020?resource=download",
            "Dataset Source",
            target = "_blank"
            )),
    
    tags$li(class= "dropdown",
            tags$a(
              href = "https://www.nobelprize.org/",
              "More Info",
              target = "_blank"
            ))
  ),
  dashboardSidebar(
      sidebarMenu(
        id = "Sidebar",
        menuItem("Info",tabName = "Info"),
        menuItem("Visualization",tabName ="Visualize")
        )),

  
  
  dashboardBody(
    
    tabItems(
      tabItem(
        tabName = "Info",
        tabBox(id = "tab1",
               width = 15,
               tabPanel("Introduction",fluidRow(
                 column(width = 4,tags$h2("About dataset",style ="color:gray"), 
                        tags$p("This dataset file contains 14 columns about Nobel prize winner information.",style ="color:black"),
                        
                        tags$br(),
                        
                        tags$p("1.	Firstname.",style ="color:black"),
                        tags$p("2.	surname.",style ="color:black"),
                        tags$p("3.	borncountrycode.",style ="color:black"),
                        tags$p("4.	diedcountrycode.",style ="color:black"),
                        tags$p("5.	gender.",style ="color:black"),
                        tags$p("6.	year.",style ="color:black"),
                        tags$p("7.	category.",style ="color:black"),
                        tags$p("8.	share.",style ="color:black"),
                        tags$p("9.	nameofuniversity.",style ="color:black"),
                        tags$p("10.	cityofuniversity.",style ="color:black"),
                        tags$p("11.	countryofuniversity.",style ="color:black"),
                        tags$p("12.	born_month.",style ="color:black"),
                        tags$p("13.	age.",style ="color:black"),
                        tags$p("14.	agegetprize .",style ="color:black")),
                column(width = 4,tags$h2("Target of visualization",style ="color:gray"),
                        tags$p("Our goal is to visualize the data to get information about:",style ="color:black"),
                        tags$p("1. The proportions of the Nobel Prize winners based on the factor of sharing the prize.",style ="color:black"),
                        tags$p("2. The relationship between the age of the winner and winning the prize.",style ="color:black"),
                        tags$p("3. The deviation of the data in the previous relationship based on gender.",style ="color:black"),
                        tags$p("4. The relationship between the category and the number of award winners.",style ="color:black")  
                       ),
                column(width = 4,tags$h2("Some statistics",style ="color: gray;"),
                       tags$div("Mean of ages:",textOutput("Mean"), style="background-color:   #45b39d;
                                          width: 150px;
                                          height: 65px;
                                          text-align: center;
                                          color: white;
                                          font-size: 15px;
                                          border-radius: 8px;
                                          margin-top: 20px;
                                          margin-left: 30px"),
                       tags$div("Standard deviation of ages :",textOutput("SD"), style="background-color:  #2e86c1 ;
                                          width: 150px;
                                          height: 65px;
                                          text-align: center;
                                          color: white;
                                          font-size: 15px;
                                          border-radius: 8px;
                                          margin-top: 20px;
                                          margin-left: 30px"),
                       tags$div("Number of male :",textOutput("Males"), style="background-color:  #9b59b6
;
                                          width: 150px;
                                          height: 65px;
                                          text-align: center;
                                          color: white;
                                          font-size: 15px;
                                          border-radius: 8px;
                                          margin-top: 20px;
                                          margin-left: 30px"),
                       tags$div("Number of female :",textOutput("Females"), style="background-color: crimson;
                                          width: 150px;
                                          height: 65px;
                                          text-align: center;
                                          color: white;
                                          font-size: 15px;
                                          border-radius: 8px;
                                          margin-top: 20px;
                                          margin-left: 30px")))),
               tabPanel("Structure of dataset",verbatimTextOutput("Struct")))),
   
    
    tabItem(
      tabName = "Visualize",
      tabBox(id = "tab2",
             width = 15,
             tabPanel("Pie chart",plotOutput("PieChart")),
             tabPanel("Histogram & Box plot",plotOutput("Hist")),
             tabPanel("Bar plot",plotOutput("Bar")))))))



