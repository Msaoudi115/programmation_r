# Charger les bibliothèques requises
library(shiny)
library(dplyr)
library(ggplot2)

# Définir l'interface utilisateur (UI) pour l'application Shiny
ui <- fluidPage(
  
  titlePanel("Tabsets"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      radioButtons("dist", "Distribution type:",
                   c("Normal" = "norm",
                     "Uniform" = "unif",
                     "Log-normal" = "lnorm",
                     "Exponential" = "exp")),
      
      br(),
      
      sliderInput("n",
                  "Number of classes:",
                  value = 10,
                  min = 1,
                  max = 20)
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("plot")),
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Table", tableOutput("table")),
                  tabPanel("Graph", plotOutput("graphique"))
      )
    )
  )
)

# Définir la logique du serveur pour l'application Shiny
server <- function(input, output) {
  data <- read.csv("C:/Users/msaoudi/Documents/GitHub/programmation_r/BUT 2/Projet VELOV/Excel.csv")
  
  d <- reactive({
    data
  })
  
  output$plot <- renderPlot({
    hist(data$available_bikes,
         main = "histo",
         col = "#75AADB", border = "white", breaks = input$n)
  })
  
  output$summary <- renderPrint({
    summary(d())
  })
  
  output$table <- renderTable({
    d()
  })
# Graphique Top 10 stations avec le plus de velo (fonctionne à ne pas modifier )  
  output$graphique <- renderPlot({
    data_filtered <- data %>%
      arrange(desc(available_bikes)) %>%
      head(10)
    
    data_filtered$name <- substr(data_filtered$name, 8, nchar(data_filtered$name)) # Enlever les 5 premiers caractères
    
    ggplot(data_filtered, aes(x = reorder(name, -available_bikes), y = available_bikes)) +
      geom_bar(stat = "identity") +
      labs(x = "Name", y = "Available bikes", title = "Stations with the most available bikes") +
      theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
  })
}

# Créer l'application Shiny
shinyApp(ui, server)


write.csv(DLyon, "C:/Users/msaoudi/Documents/GitHub/programmation_r/BUT 2/Projet VELOV/Excel.csv", row.names=TRUE)

