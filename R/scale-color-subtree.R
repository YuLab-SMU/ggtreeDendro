##' scale tree color by subtree (e.g., output of cutree, kmeans, or other clustering algorithm)
##'
##' 
##' @title scale_color_subtree
##' @rdname scale-color-subtree
##' @param group taxa group information
##' @return updated tree view
##' @export
##' @author Guangchuang Yu
scale_color_subtree <- function(group) {
    if (inherits(group, 'kmeans')) {
        group <- group$cluster
    } 

    structure(group,
              class = 'color_subtree'
              )
}

##' @rdname scale-color-subtree
##' @importFrom stats as.hclust
##' @importFrom stats cutree
##' @importFrom ggtree groupOTU
##' @export
scale_colour_subtree <- scale_color_subtree

scale_color_subtree_ <- function(p, group) {

    if (is.numeric(group) && length(group) == 1) {
        group <- cutree(as.hclust(as.phylo(p$data)), group)
    } 

    g <- split(names(group), group)
    groupOTU(p, g, group_name = 'subtree') +
        aes_(color = ~subtree)
}


##' @method ggplot_add color_subtree
##' @export
ggplot_add.color_subtree <- function(object, plot, object_name) {
    scale_color_subtree_(plot, object)
}

