library(shiny)

# Define UI for data upload app ----
ui <- fluidPage(
  # App title ----
  titlePanel("Similaridade"),
  helpText("Cluster"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    # Sidebar panel for inputs ----
    sidebarPanel(
      # Input: Select a file ----
      fileInput(
        "file1",
        "Importar tabela (xlsx)",
        multiple = TRUE,
        accept = c(
          "text/xlsx",
          "text/comma-separated-values,text/plain",
          ".xlsx"
        )
      ),
      
      # Horizontal line ----
      tags$hr(),
      
      # Input: Select method ----
      radioButtons(
        "binary",
        "Dados",
        choices = c(
          "Binário" = TRUE,
          "Não-binário" = FALSE
        ),
        selected = TRUE
      ),
      
      # Input: Select method ----
      radioButtons(
        "method.s",
        "Algoritmo de similaridade \n (a primeira coluna deve conter o nome das espécies)",
        choices = c(
          "Euclidiana" = 'euclidean',
          "Bray" = 'bray',
          "Jaccard" = 'jaccard',
          "Morisita" = 'morisita'
        ),
        selected = 'euclidean'
      ),
      
      # Input: Select método de agrupamento ----
      radioButtons(
        "method.a",
        "Método de agrupamento",
        choices = c(
          "Single" = "single",
          "Complete" = "complete",
          "WPGMA" = "mcquitty",
          "UPGMA" = 'average',
          "Ward.D2" = "ward.D2"
        ),
        selected = "ward.D2"
      ),
      
      # Horizontal line ----
      tags$hr(),
      
      # Input: Select number of rows to display ----
      # radioButtons("disp", "Modo de exibição",
      #   choices = c("Mostrar somente as primeiras linhas" = "head",
      #     "Mostrar todos os registros" = "all"),
      #   selected = "head"),
      
      
      # Horizontal line ----
      tags$hr(),
      
      # radioButtons("base", "Base de logaritmo usada no índice de Shannon",
      #   choices = c("Bits" = "2",
      #     "Nats" = "exp(1)",
      #     "Decits" = "10")
      #
      # ) ,
      actionButton("btn_calcular", "Calcular!")
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(tabsetPanel(
      tabPanel("Gráfico",
               plotOutput("results")),
      tabPanel("Entrada de dados",
               tableOutput("input_data"))
      
    ))
    
    
  )
  
  
)