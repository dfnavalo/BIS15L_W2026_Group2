library(tidyverse)
library(shiny)
library(shinythemes)
library(janitor)

surgery <- read_csv("data/surgery.csv") %>% 
  clean_names()

ui <- fluidPage(
  titlePanel("Surgery Timing and Patient Outcomes"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "timing",
        "Choose Timing Variable:",
        choices = c("Hour","Day of Week","Month","Moon Phase"),
        selected = "Hour"
      )
    ),
    
    mainPanel(
      plotOutput("plot", width="700px", height="500px")
    )
  )
)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    
    if(input$timing == "Hour"){
      
      surgery %>% 
        mutate(hour_round = floor(hour)) %>% 
        group_by(hour_round) %>% 
        summarize(mortality_rate = mean(mort30 == "Yes", na.rm = TRUE)) %>% 
        ggplot(aes(x = factor(hour_round), y = mortality_rate))+
        geom_col(color="black", fill="turquoise4", alpha=0.8)+
        scale_y_continuous(labels=scales::percent)+
        labs(title="Mortality Rate by Operation Hour",
             x="Hour",
             y="Mortality Rate")+
        theme_minimal()
      
    } else if(input$timing == "Month"){
      
      surgery %>%
        filter(month!="NA") %>%
        mutate(month=factor(month,
                            levels=c("Jan","Feb","Mar","Apr","May","Jun",
                                     "Jul","Aug","Sep","Oct","Nov","Dec"))) %>%
        group_by(month) %>%
        summarise(mortality_rate=mean(mort30=="Yes", na.rm=TRUE)) %>%
        ggplot(aes(month, mortality_rate, group=1))+
        geom_line(color="turquoise4", linewidth=1.2)+
        geom_point(size=3, color="turquoise4")+
        scale_y_continuous(labels=scales::percent)+
        labs(title="Mortality Rate by Month",
             x="Month",
             y="Mortality Rate")+
        theme_minimal()
      
    } else if(input$timing == "Day of Week"){
      
      surgery %>%
        mutate(dow=factor(dow,
                          levels=c("Mon","Tue","Wed","Thu","Fri"))) %>%
        group_by(dow) %>%
        summarize(mortality_rate=mean(mort30=="Yes", na.rm=TRUE)) %>%
        ggplot(aes(dow, mortality_rate))+
        geom_col(fill="turquoise4", color="black")+
        scale_y_continuous(labels=scales::percent)+
        labs(title="Mortality Rate by Day of Week",
             x="Day",
             y="Mortality Rate")+
        theme_minimal()
      
    } else {
      
      surgery %>% 
        group_by(moonphase) %>% 
        summarize(mortality_rate = mean(mort30=="Yes", na.rm=TRUE)) %>%
        ggplot(aes(moonphase, mortality_rate, group=1))+
        geom_point(size=3, color="turquoise4")+
        geom_line(color="turquoise4")+
        scale_y_continuous(labels=scales::percent)+
        labs(title="Mortality Rate by Moon Phase",
             x="Moon Phase",
             y="Mortality Rate")+
        theme_minimal()
    }
    
  })
}

shinyApp(ui, server)
      
