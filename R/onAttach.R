#' @import installr
.onAttach <- function(libname, pkgname){
  Version = packageVersion("MToolBox")
  packageStartupMessage(sprintf("MToolBox %s", Version))
  readline("Do you want to check for R update? (y/n) ") -> answer
  if (answer == "y"){installr::updateR()
  } else if (answer != "n"){packageStartupMessage("Do not regconize response, not checking for update")
    }
}
