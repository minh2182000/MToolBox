.onLoad = function(libname, pkgname){
  print("LOADING MTOOLBOX")
  get_os <- function(){
    sysinf <- Sys.info()
    if (!is.null(sysinf)){
      os <- sysinf['sysname']
      if (os == 'Darwin')
        os <- "osx"
    } else { ## mystery machine
      os <- .Platform$OS.type
      if (grepl("^darwin", R.version$os))
        os <- "osx"
      if (grepl("linux-gnu", R.version$os))
        os <- "linux"
    }
    tolower(os)
  }

  if (!get_os() == "linux")
    if (! "installr" %in% rownames(installed.packages()))
      install.packages("installr")
  if (! "car" %in% rownames(installed.packages()))
    install.packages("car")
  if (! "mctest" %in% rownames(installed.packages()))
    install.packages("mctest")
  if (! "plotly" %in% rownames(installed.packages()))
    install.packages("plotly")
}

#' @import installr
.onAttach <- function(libname, pkgname){
  Version = packageVersion("MToolBox")
  packageStartupMessage(sprintf("MToolBox %s", Version))

  get_os <- function(){
    sysinf <- Sys.info()
    if (!is.null(sysinf)){
      os <- sysinf['sysname']
      if (os == 'Darwin')
        os <- "osx"
    } else { ## mystery machine
      os <- .Platform$OS.type
      if (grepl("^darwin", R.version$os))
        os <- "osx"
      if (grepl("linux-gnu", R.version$os))
        os <- "linux"
    }
    tolower(os)
  }
  if (!get_os() == "linux"){
    Newer_version = installr::check.for.updates.R(notify_user = FALSE)
    if (Newer_version){
      readline("There is a newer version of R, would you like to update R? (y/n) ") -> answer
      if (answer == "y"){installr::updateR()
      } else if (answer != "n") packageStartupMessage("Do not regconize response, abort")

    }
  }
  
}
