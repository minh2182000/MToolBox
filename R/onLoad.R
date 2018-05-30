.onLoad = function(libname, pkgname){
  if (! "car" %in% rownames(installed.packages()))
    install.packages("car")
  if (! "car" %in% rownames(installed.packages()))
    install.packages("installr")
  if (! "car" %in% rownames(installed.packages()))
    install.packages("mctest")
  if (! "car" %in% rownames(installed.packages()))
    install.packages("plotly")
}