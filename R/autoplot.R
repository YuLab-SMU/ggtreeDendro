##' @rdname autoplot
##' @importFrom ggplot2 autoplot
##' @export
ggplot2::autoplot


## autoplot methods
## 
## autoplot methods for hierarchical clustering results
##' @title autoplot
##' @rdname autoplot
##' @param object input object
##' @param layout layout for plotting the tree
##' @param ladderize whether ladderize the tree (default FALSE)
##' @param ... additional paramters that passed to ggtree
##' @return ggtree object
##' @importFrom ggtree ggtree
##' @importFrom ggtree geom_tiplab
##' @importFrom ggtree theme_dendrogram
##' @importFrom ggplot2 theme
##' @importFrom ggplot2 margin
##' @method autoplot linkage
##' @export
##' @examples 
##' d <- dist(USArrests)
##' hc <- hclust(d, "ave")
##' autoplot(hc) + geom_tiplab()
autoplot.linkage <- function(object, layout = "dendrogram", ladderize = FALSE, ...) {
    ggtree(object, ladderize = ladderize, layout=layout, ...) + 
    #geom_tiplab() + 
    theme_dendrogram(plot.margin=margin(t=6, r=6, b=80, l=6, unit='pt')) 
}

##' @rdname autoplot
##' @method autoplot hclust
##' @export
autoplot.hclust <- autoplot.linkage

##' @rdname autoplot
##' @method autoplot dendrogram
##' @export
autoplot.dendrogram <- autoplot.linkage

##' @rdname autoplot
##' @method autoplot agnes
##' @export
autoplot.agnes <- autoplot.linkage

##' @rdname autoplot
##' @method autoplot diana
##' @export
autoplot.diana <- autoplot.linkage

##' @rdname autoplot
##' @method autoplot twins
##' @export
autoplot.twins <- autoplot.linkage

