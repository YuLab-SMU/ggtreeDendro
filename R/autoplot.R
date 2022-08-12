##' @importFrom ggplot2 autoplot
##' @export
ggplot2::autoplot

##' @importFrom ggtree ggtree
##' @importFrom ggtree geom_tiplab
##' @importFrom ggtree theme_dendrogram
##' @importFrom ggplot2 theme
##' @importFrom ggplot2 margin
##' @method autoplot linkage
##' @export
autoplot.linkage <- function(object, layout = "dendrogram", ladderize = FALSE, ...) {
    ggtree(object, ladderize = ladderize, layout=layout, ...) + 
    #geom_tiplab() + 
    theme_dendrogram(plot.margin=margin(t=6, r=6, b=80, l=6, unit='pt')) 
}

##' @method autoplot hclust
##' @export
autoplot.hclust <- autoplot.linkage

##' @method autoplot dendrogram
##' @export
autoplot.dendrogram <- autoplot.linkage

##' @method autoplot agnes
##' @export
autoplot.agnes <- autoplot.linkage

##' @method autoplot diana
##' @export
autoplot.diana <- autoplot.linkage

##' @method autoplot twins
##' @export
autoplot.twins <- autoplot.linkage

