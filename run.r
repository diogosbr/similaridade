if("shiny" %in% rownames(installed.packages())){
  cat("Pacotes OK!")} else(install.packages("shiny",dependencies = T))
shiny::runApp(launch.browser=TRUE)