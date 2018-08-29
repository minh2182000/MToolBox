.onLoad = function(libname, pkgname){
  print("LOADING MTOOLBOX")
  if (! "car" %in% rownames(installed.packages()))
    install.packages("car")
  if (! "mctest" %in% rownames(installed.packages()))
    install.packages("mctest")
  if (! "plotly" %in% rownames(installed.packages()))
    install.packages("plotly")
}

.onAttach <- function(libname, pkgname){
  Version = packageVersion("MToolBox")
  packageStartupMessage(sprintf("MToolBox %s", Version))
  library(plotly); library(mctest); library(car)
}
