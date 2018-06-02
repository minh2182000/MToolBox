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

#' @import installr
.onAttach <- function(libname, pkgname){
  Version = packageVersion("MToolBox")
  packageStartupMessage(sprintf("MToolBox %s", Version))
  
  Newer_version = installr::check.for.updates.R(notify_user = FALSE)
  if (Newer_version){
    readline("There is a newer version of R, would you like to update R? (y/n) ") -> answer
    if (answer == "y"){installr::updateR()
    } else if (answer != "n") packageStartupMessage("Do not regconize response, abort")
    
  }
  
  
}