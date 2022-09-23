##' @title geom_line_cutree
##' @rdname geom-line-cutree
##' @param group output of cutree or number of subtree
##' @param linetype linetype 
##' @param offset offset of the line
##' @param ... additional parameters to set the line (e.g., color, size, etc.)
##' @return line layer
##' @export
##' @examples 
##' d <- dist(USArrests)
##' hc <- hclust(d, "ave")
##' autoplot(hc) + geom_line_cutree(4)
geom_line_cutree <- function(group, linetype = "dashed", offset = 0, ...) {
    structure(list(
        group = group,
        linetype = linetype,
        offset = offset,
        ...
    ),
    class = "line_cutree"
    )
}


##' @importFrom ggplot2 ggplot_add
##' @method ggplot_add line_cutree
##' @importFrom ggplot2 geom_vline
##' @importFrom tidytree as.phylo
##' @export
ggplot_add.line_cutree <- function(object, plot, object_name) {
    group <- object$group
    hc <- as.hclust(as.phylo(plot$data))
    if (is.numeric(group) && length(group) == 1) {
        group <- cutree(hc, group)
    } 

    offset <- object$offset

    params <- object
    params$group <- NULL
    params$offset <- NULL

    n <- length(hc$order)
    k <- length(unique(group))
    height <- hc$height[n-k]/2
    params$xintercept <- (height + offset) * -1
    
    ly <- do.call(geom_vline, params)
    ggplot_add(ly, plot, object_name)
}

