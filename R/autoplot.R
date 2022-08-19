##' @rdname autoplot
##' @importFrom ggplot2 autoplot
##' @export
ggplot2::autoplot


## autoplot methods
## autoplot methods for hierarchical clustering results

##' @title autoplot
##' @rdname autoplot
##' @param object input object
##' @param layout layout for plotting the tree
##' @param ladderize whether ladderize the tree (default FALSE)
##' @param hang numeric The fraction of the tree plot height by which labels
##' should hang below the rest of the plot. A negative value will cause the 
##' labels to hang down from 0.
##' @param ... additional paramters that passed to ggtree
##' @return ggtree object
##' @importFrom ggtree ggtree
##' @importFrom ggtree geom_tiplab
##' @importFrom ggtree theme_dendrogram
##' @importFrom ggtree theme_tree2
##' @importFrom ggplot2 theme
##' @importFrom ggplot2 margin
##' @method autoplot hclust
##' @export
##' @examples 
##' d <- dist(USArrests)
##' hc <- hclust(d, "ave")
##' autoplot(hc) + geom_tiplab()
autoplot.hclust <- function(object, layout = "dendrogram", ladderize = FALSE, hang = 0.1, ...) {
    p <- ggtree(object, ladderize = ladderize, layout=layout, hang = hang, ...) 
    #geom_tiplab() + 

    if (is.function(layout)) {
        thm <- NULL
    } else if (layout %in% c("fan", "circular", "inward_circular", "radial",
                            "unrooted", "equal_angle", "daylight", "ape")) {
        thm <- NULL
    } else if (layout == "dendrogram") {
        thm <- theme_dendrogram(plot.margin=margin(t=6, r=6, b=80, l=6, unit='pt'))
    } else {
        thm <- theme_tree2(plot.margin=margin(t=6, r=80, b=6, l=6, unit='pt'))
    }
     
    p + thm
}

##' @rdname autoplot
##' @method autoplot linkage
##' @export
autoplot.linkage <- autoplot.hclust

##' @rdname autoplot
##' @method autoplot dendrogram
##' @export
autoplot.dendrogram <- autoplot.hclust

##' @rdname autoplot
##' @method autoplot agnes
##' @export
autoplot.agnes <- autoplot.hclust

##' @rdname autoplot
##' @method autoplot diana
##' @export
autoplot.diana <- autoplot.hclust

##' @rdname autoplot
##' @method autoplot twins
##' @export
autoplot.twins <- autoplot.hclust


##' @rdname autoplot
##' @method autoplot pvclust
##' @importFrom ggtree geom_nodelab
##' @importFrom ggtree geom_hilight
##' @importFrom ggplot2 aes_
##' @importFrom ggplot2 scale_color_manual
##' @importFrom tidytree as.treedata
##' @importFrom tidytree as_tibble
##' @importFrom tidytree rootnode
##' @importFrom tidytree offspring
##' @export
autoplot.pvclust <- function(object, layout = "dendrogram", ladderize = FALSE, 
                            label_edge = FALSE, pvrect = FALSE, alpha = 0.95, hang = 0.1, ...) {

    x <-  as.treedata(object, hang = hang)
                            
    p <- autoplot.hclust(x, layout=layout, ladderize=ladderize, ...) +
        geom_nodelab(aes_(label=~au, color="au"), angle=0, vjust=-.5, hjust=1.3) +
        geom_nodelab(aes_(label=~bp, color="bp"), angle=0, vjust=-.5, hjust=-.2) +
        scale_color_manual(values=c("au"="#97c497", "bp" = "#e06663"), name = 'p-values')
  
    if (label_edge) {
        p <- p + geom_nodelab(aes_(label=~sub("_edge", "", label)), 
                        color="grey50", hjust=0.5, angle=0, vjust=1.2, size=3.5)

    }

    if (pvrect) {
        d <- as_tibble(x)
        
        n <- d$node[d$au > alpha * 100]
        n <- n[!is.na(n)]
        n <- n[n != rootnode(x)]

        os <- offspring(x, n)
        xx <- do.call('rbind', lapply(os, function(i) n %in% i))
        n <- n[!apply(xx, 2, any)]

        p <- p + geom_hilight(node = n, fill=NA, colour='red', 
                            to.bottom=TRUE, extendto=-.2) 
    }

    return(p)
}


