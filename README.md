This package offers `autoplot` methods to allow automatically visualizing tree objects (`hclust`, `dendrogram`, etc.) using `ggtree`. 


Coverage:

+ `agnes` object defined in `cluster` package
+ `bclust` object defined in `flexclust` (S4) or `e1071` (S3) package
+ `dendrogram` object defined in `stats` package
    - `FCPS::HierarchicalDBSCAN()[['Dendrogram']]`
    - `FCPS::HierarchicalClustering()[['Dendrogram']]`
+ `diana` object defined in `cluster` package
+ `hclust` object defined in `stats` package
    - `amap::hcluster()`
    - `fastcluster::hclust()`
    - `genieclust::gclust()` 
    - `FactoClass::ward.cluster()` 
+ `hdbscan` object defined in `dbscan` package
+ `hkmeans` object defined in `factoextra` package
+ `linkage` object defined in the `mdendro` package
+ `protoclust` object defined in `protoclust` package
+ `pvclust` object defined in `pvclust` package
+ `twins` object defined in `cluster` package



It also provides `plot_xx` functions to visualize analysis output that is stored using R's built-in data type (e.g., `list`).

+ `plot_wgcna()` for `WGCNA::blockwiseModules()` output

