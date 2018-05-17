#' Set current working directory to the one copied on clipboard
#' @export
Misc.setwdClipboard = function(){
  setwd(readClipboard())
}