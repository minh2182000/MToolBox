#' @import installr
.onAttach <- function(libname, pkgname){
  if (! "car" %in% rownames(installed.packages()))
    install.packages("car")
  if (! "car" %in% rownames(installed.packages()))
    install.packages("installr")
  if (! "car" %in% rownames(installed.packages()))
    install.packages("mctest")
  if (! "car" %in% rownames(installed.packages()))
    install.packages("plotly")
  
  Version = packageVersion("MToolBox")
  packageStartupMessage(sprintf("MToolBox %s", Version))
  
  Newer_version = installr::check.for.updates.R(notify_user = FALSE)
  if (Newer_version){
    readline("There is a newer version of R, would you like to update R? (y/n) ") -> answer
    if (answer == "y"){installr::updateR()
    } else if (answer != "n") packageStartupMessage("Do not regconize response, abort")
    
  }
  
  
}