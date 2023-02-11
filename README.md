This package offers `autoplot` methods to allow automatically visualizing tree objects (`hclust`, `dendrogram`, etc.) using `ggtree`. 




Coverage:

<a href="https://www.routledge.com/Data-Integration-Manipulation-and-Visualization-of-Phylogenetic-Trees/Yu/p/book/9781032233574"><img src="https://yulab-smu.top/treedata-book/9781032233574_cover_review.png" style="width:200px;border:2px solid black;" align="right"/></a>


+ `agnes` object defined in `cluster` package
+ `bclust` object defined in `flexclust` (S4) or `e1071` (S3) package
+ `ClusterExperiment` object defined in `ClusterExperiment` package
+ `dendrogram` object defined in `stats` package
    - `FCPS::HierarchicalDBSCAN()[['Dendrogram']]`
    - `FCPS::HierarchicalClustering()[['Dendrogram']]`
    - `BHC::bhc()`
+ `diana` object defined in `cluster` package
+ `genoMatriXeR` object defined in the `regioneReloaded` package
+ `hclust` object defined in `stats` package
    - `amap::hcluster()`
    - `fastcluster::hclust()`
    - `genieclust::gclust()` 
    - `FactoClass::ward.cluster()` 
    - `goSTAG::performHierarchicalClustering()`
    - `HGC::HGC.dendrogram()`
+ `hdbscan` object defined in `dbscan` package
+ `hkmeans` object defined in `factoextra` package
+ `linkage` object defined in the `mdendro` package
+ `multiLocalZScore` object defined in the `regioneReloaded` package
+ `protoclust` object defined in `protoclust` package
+ `pvclust` object defined in `pvclust` package
+ `twins` object defined in `cluster` package



It also provides `plot_xx` functions to visualize analysis output that is stored using R's built-in data type (e.g., `list`).

+ `plot_wgcna()` for `WGCNA::blockwiseModules()` output

