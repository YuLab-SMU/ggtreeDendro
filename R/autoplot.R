##' @method autoplot linkage
##' @importFrom ggplot2 autoplot
##' @importFrom ggtree ggtree
##' @importFrom ggtree geom_tiplab
##' @export
autoplot.linkage <- function(object, ...) {
    ggtree(object, layout="dendrogram") + geom_tiplab()
}

