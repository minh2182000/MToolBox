.onLoad = function(libname, pkgname){
  print("LOADING MTOOLBOX")
  if (! "car" %in% rownames(installed.packages()))
    install.packages("car")
  if (! "installr" %in% rownames(installed.packages()))
    install.packages("installr")
  if (! "mctest" %in% rownames(installed.packages()))
    install.packages("mctest")
  if (! "plotly" %in% rownames(installed.packages()))
    install.packages("plotly")
}