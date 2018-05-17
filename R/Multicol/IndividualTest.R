#' Individual Multicollinearity Diagnostic Measures
# 
#' methods include VIF, CVIF, TOL, Leamer, Wi, Fi, Klein

library(mctest)
Multicol.IndividualTest = function(x, y, method = NULL, na.rm = TRUE, corr = FALSE, vif = 10, tol = 0.1,
                                   conf = 0.95, cvif = 10, leamer = 0.1, all = FALSE){
  return(mctest::imcdiag(x, y, methodL, na.rm, corr , vif , tol ,
                         conf, cvif , leamer , all ))
}