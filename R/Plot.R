#' Save Publication-quality plot
#' @param plot any plot or ggplot object
#' @param res resolution
#' @param height height
#' @param width width
#' @param dir saving directory
#' @param filename file name
#' @export

Plot.PublishPlot = function(plot,  res = 400, height = 1500, width = 3000, dir = getwd(), filename = "Plot Output"){
  jpeg(filename = paste0(dir, "/", filename, ".jpg"), res, height, width)
  plot; dev.off()
  graphics.off()
}




#' Visualize High-dimensional data in a 3D scatter plot
#' Using PCA to visualize a classification data at 2D or 3D
#' 
#' @import plotly
#' @export
Plot.VisualizeSupervise = function(formula, data, dim = NULL){
  y = data[all.vars(formula)[1]]
  x = model.matrix(formula, data); x = x[,colnames(x) != "(Intercept)"]
  if (is.null(dim)) dim = min(3, ncol(x))
  
  # PCA
  PCA = prcomp(x)
  VarExplained = (PCA$sdev^2/sum(PCA$sdev^2))[1:dim]
  PCs = PCA$x[,1:dim]
  
  # plot
  Group = y; colnames(Group) = "Group"
  PlotData = as.data.frame(cbind(PCs, Group)); PlotData$Group = as.factor(PlotData$Group)
  if (dim == 3){
    Plot = plot_ly(data = PlotData, x = ~PC1, y = ~PC2, z = ~PC3, color = ~Group,
                   colors = "Set1") %>%
          add_markers(marker = list(size = 5))
  }
  if (dim == 2){
    Plot = ggplot(data = PlotData, aes(x = PC1, y = PC2, col = Group)) +
      geom_point()
  }
  return(list(Plot = Plot, VarExplained = VarExplained))
}
