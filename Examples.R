

## `hclust` and `dendrogram` objects

# genieclust::gclust() also output `hclust` object
# amap::hcluster() also output `hclust` object
# FactoClass::ward.cluster() also output `hclust` object


d <- dist(USArrests)

hc <- hclust(d, "ave")
den <- as.dendrogram(hc)

p1 <- autoplot(hc) + geom_tiplab()
p2 <- autoplot(den) + geom_rect_subtree(4)
plot_list(p1, p2, ncol=2)



## `linkage` object


library("mdendro")
lnk <- linkage(d, digits = 1, method = "complete")
autoplot(lnk, layout = 'circular') + geom_tiplab() + 
  scale_color_subtree(4) + theme_tree()


## `agnes`, `diana` and `twins` objects

library(cluster)
x1 <- agnes(mtcars)
x2 <- diana(mtcars)

p1 <- autoplot(x1) + geom_tiplab()
p2 <- autoplot(x2) + geom_tiplab()
plot_list(p1, p2, ncol=2)



## `pvclust` object


library(pvclust)
data(Boston, package = "MASS")

set.seed(123)
result <- pvclust(Boston, method.dist="cor", method.hclust="average", nboot=1000, parallel=TRUE)
autoplot(result, label_edge=TRUE, pvrect = TRUE) + geom_tiplab()


## `bclust` object

### S4
library(flexclust)
data(iris)
bc1 <- bclust(iris[,1:4], 3, base.k=5)
autoplot(bc1)

### S3
library(e1071)
bc2 <- bclust(iris[,1:4], 3, base.centers=5)
autoplot(bc2)

## `protoclust` object

library(protoclust)
data(Boston, package = "MASS")
d <- dist(Boston)
pc <- protoclust(d)
plotwithprototypes(pc)
autoplot(pc)


## `hdbscan` object

library(dbscan)
res <- hdbscan(moons, minPts = 5)
autoplot(res)


## `hkmeans` object

library(factoextra)
# Load data
data(USArrests)
# Scale the data
df <- scale(USArrests)

# Compute hierarchical k-means clustering
res.hk <-hkmeans(df, 4)

hkmeans_tree(res.hk, cex = 0.6)
fviz_dend(res.hk, cex = 0.6)

library(ggtreeDendro)
autoplot(res.hk) + geom_rect_subtree(4, color=c("red", "blue", "green", "purple"))
autoplot(res.hk$hclust) + scale_color_subtree(4)
