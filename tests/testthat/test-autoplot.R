context('autoplot for hclust class')

library(ggtree)
library(ggtreeDendro)

data(USArrests)
d <- dist(USArrests)
hc <- hclust(d, 'ave')

test_that('autoplot support hclust class', {
    p <- autoplot(hc)
    expect_true(inherits(p, 'ggtree'))
})
