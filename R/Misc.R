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