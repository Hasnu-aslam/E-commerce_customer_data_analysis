library(shiny)
library(rpart)
library(ggplot2)

ui <- fluidPage(
  titlePanel("E-Commerce Intelligence Dashboard"),
  
  sidebarLayout(
    sidebarPanel(
      actionButton("run", "Run Analysis"),
      
      hr(),
      
      h4("Test Customer Input"),
      numericInput("pc", "Purchase Count", 5),
      numericInput("ts", "Total Spent", 2000),
      numericInput("lpd", "Last Purchase Days", 10)
    ),
    
    mainPanel(
      tabsetPanel(
        
        tabPanel("Data Preview",
                 tableOutput("table")
        ),
        
        tabPanel("Classification",
                 verbatimTextOutput("prediction")
        ),
        
        tabPanel("Clustering",
                 plotOutput("clusterPlot")
        ),
        
        tabPanel("Fraud Detection",
                 tableOutput("fraudTable")
        ),
        
        tabPanel("Fake Reviews",
                 tableOutput("fakeTable")
        )
        
      )
    )
  )
)

server <- function(input, output) {
  
  dataset <- reactive({
    read.csv('ecommerce_dataset.csv')
  })
  
  observeEvent(input$run, {
    
    data <- dataset()
    
    # -----------------------
    # 1. CLASSIFICATION
    # -----------------------
    model <- rpart(category ~ purchase_count + total_spent + last_purchase_days, data = data)
    
    sample <- data.frame(
      purchase_count = input$pc,
      total_spent = input$ts,
      last_purchase_days = input$lpd
    )
    
    pred <- predict(model, sample, type = "class")
    
    output$prediction <- renderText({
      paste("Predicted Customer Type:", pred)
    })
    
    # -----------------------
    # 2. CLUSTERING
    # -----------------------
    set.seed(123)
    clusters <- kmeans(data[, c("purchase_count", "total_spent")], centers = 3)
    data$cluster <- as.factor(clusters$cluster)
    
    output$clusterPlot <- renderPlot({
      ggplot(data, aes(x = purchase_count, y = total_spent, color = cluster)) +
        geom_point(size = 3) +
        ggtitle("Customer Clusters")
    })
    
    # -----------------------
    # 3. FRAUD DETECTION
    # -----------------------
    threshold <- quantile(data$transaction_amount, 0.95)
    data$fraud <- ifelse(data$transaction_amount > threshold, "Fraud", "Normal")
    
    output$fraudTable <- renderTable({
      subset(data, fraud == "Fraud")[, c("customer_id", "transaction_amount", "fraud")]
    })
    
    # -----------------------
    # 4. FAKE REVIEW DETECTION
    # -----------------------
    data$fake_detected <- grepl("http|fake", data$review_text, ignore.case = TRUE)
    
    output$fakeTable <- renderTable({
      subset(data, fake_detected == TRUE)[, c("customer_id", "review_text")]
    })
    
    # -----------------------
    # DATA PREVIEW
    # -----------------------
    output$table <- renderTable({
      head(data)
    })
  })
}

shinyApp(ui = ui, server = server)