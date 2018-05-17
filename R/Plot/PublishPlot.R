#' Save Publication-quality plot
#' @param plot any plot or ggplot object
#' @param res resolution
#' @param height height
#' @param width width
#' @param dir saving directory
#' @param filename file name

Plot.PublishPlot = function(plot,  res = 400, height = 1500, width = 3000, dir = getwd(), filename = "Plot Output"){
  jpeg(filename = paste0(dir, "/", filename, ".jpg"), res, height, width)
  plot; dev.off()
  graphics.off()
}