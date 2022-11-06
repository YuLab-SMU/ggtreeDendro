

##' @title geom_rect_subtree
##' @rdname geom-rect-subtree
##' @param group output of cutree or number of subtree
##' @param color border color to highlight subtrees 
##' @param ... additional parameters pass to 'ggtree::hilight()'
##' @return rect layer
##' @seealso
##'  [geom_hilight][ggtree::geom_hilight]; 
##' @export
##' @examples 
##' d <- dist(USArrests)
##' hc <- hclust(d, "ave")
##' autoplot(hc) + geom_rect_subtree(4)
geom_rect_subtree <- function(group=NULL, color = "red", ...) {
    structure(list(
        group = group,
        color = color, 
        ...
    ),
    class = "rect_subtree")
}


##' @method ggplot_add rect_subtree
##' @importFrom utils modifyList
##' @importFrom tidytree MRCA
##' @export
ggplot_add.rect_subtree <- function(object, plot, object_name) {


    if (is.null(object$node)) {
        hc <- as.hclust(as.phylo(plot$data))
        group <- hc_cluster(hc, object$group)
        object$node <- sapply(split(names(group), group), 
            FUN = function(ii) MRCA(as.phylo(plot$data), ii)
        )
    }

    params <- object
    params$group <- NULL
    default_params <- list(fill = NA, to.bottom = TRUE)
    params <- modifyList(default_params, params)
    ly <- do.call(geom_hilight, params)
    ggplot_add(ly, plot, object_name)
}
