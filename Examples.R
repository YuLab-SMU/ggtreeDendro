
## flexclust

library(flexclust)
data(iris)
bc1 <- bclust(iris[,1:4], 3, base.k=5)
autoplot(bc1)

