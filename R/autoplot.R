##' @importFrom ggplot2 autoplot
##' @export
ggplot2::autoplot

##' @importFrom ggtree ggtree
##' @importFrom ggtree geom_tiplab
##' @importFrom ggplot2 theme
##' @importFrom ggplot2 margin
##' @method autoplot linkage
##' @export
autoplot.linkage <- function(object, ...) {
    ggtree(object, ladderize = FALSE, layout="dendrogram") + 
    geom_tiplab() + 
    theme(plot.margin=margin(b=3, unit='cm')) 
}
