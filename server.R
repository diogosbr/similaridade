packages = c('xlsx', 'vegan', 'pvclust')
for (p in setdiff(packages, installed.packages()[, 'Package'])) {
  install.packages(p, dependencies = T)
}
require(xlsx)
require(vegan)


function(input, output) {
  observeEvent(input$btn_calcular, {
    df <-
      read.xlsx(
        input$file1$datapath,
        sheetIndex = 1,
        encoding = "UTF-8",
        row.names = 1
      )
    
    fig = plot(
      hclust(
        vegdist(df, method = input$method.s, binary = T),
        method = input$method.a
      ),
      hang = -1,
      main = "",
      ylab = input$method.s
    )
    
    output$input_data <- renderTable({
      return(format(round(df, 1)))
    }, rownames = TRUE)

    output$results <- renderPlot({
      input$btn_calcular
      plot(
        hclust(
          vegdist(df, method = input$method.s, binary = input$binary),
          method = input$method.a
        ),
        hang = -1,
        main = "",
        ylab = input$method.s
      )
        png(filename = paste0(input$method.s,"_", input$method.a, ".png"))
        plot(
          hclust(
            vegdist(df, method = input$method.s, binary = T),
            method = input$method.a
          ),
          hang = -1,
          main = "",
          ylab = input$method.s
        )
        dev.off()
    })
  })
}