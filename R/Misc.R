#' Print Linear Equation
#' Print the linear equation from a glm or lm object
#' 
#' @param model a glm or lm object
#' @param round rounding for parameters
#' @export

Misc.PrintLinearEquation = function(model, round = 3){
  eq = paste0(round(model$coefficients[1], round), " + ",
              paste0(round(model$coefficients[-1], round), all.vars(formula(model))[-1], collapse = " + ")
  )
  return(gsub("\\+ -", "- ", eq))
}


#' Set current working directory to the one copied on clipboard
#' @export
Misc.setwdClipboard = function(){
  setwd(readClipboard())
}


#' Install commonly used packages
#' To get a newly installed R version ready
#' @export
Misc.InstallCommon = function(Packages = c("caret",
                                           "randomForest",
                                           "e1071",
                                           "ggplot2",
                                           "plotly",
                                           "shiny",
                                           "rsconnect",
                                           "xlsx",
                                           "nnet",
                                           "sqldf",
                                           "devtools",
                                           "roxygen2"
                                           ))
{
  Install = function(PackageName){
    if (!PackageName %in% installed.packages()[,1])
      install.packages(PackageName)
  }
  for (Package in Packages){
    Install(Package)
  }
}
