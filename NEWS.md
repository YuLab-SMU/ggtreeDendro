# ggtreeDendro 1.4.0

+ Bioconductor RELEASE_3_18 (2023-10-25, Wed)

# ggtreeDendro 1.3.2

+ update according to the change of tidytree (2023-08-18, Fri)

# ggtreeDendro 1.3.1

+ `autoplot` method for 'dendro' object (`ggdendro::dendro_data()` output) (2023-03-02, Thu)    
    - see also <https://github.com/YuLab-SMU/treeio/pull/95>

# ggtreeDendro 1.2.0

+ Bioconductor RELEASE_3_17 (2023-05-03, Wed)

# ggtreeDendro 1.1.3

+ `autoplot` method for 'genoMatriXeR' and 'multiLocalZScore' objects (both defined in the 'regioneReloaded' package) (2023-02-11, Sat)
+ `autoplot` method for 'ClusterExperiment' object (2022-11-28, Mon)

# ggtreeDendro 1.1.2

+ `plot_wgcna()` for visualizing WGCNA dendrogram (2022-11-06, Sun)
+ supports `hkmeans` object defined in the `factoextra` package (2022-11-06, Sun)
+ set default `options` to align `geom_rect_subtree()` and adjust width extension.

# ggtreeDendro 1.1.1

+ `geom_rect_subtree` layer to hilight subtrees (2022-11-03, Thu)
+ supports `bclust` object (S3) output by `e1071::bclust()` 
+ supports `hdbscan` object 

# ggtreeDendro 1.0.0

+ Bioconductor RELEASE_3_16 (2022-11-02, Wed)

## ggtreeDendro 0.99.11

+ `autoplot` method for `bclust` object (S4) (2022-10-08, Sat)
+ `scale_color_subtree` from `ggtree` package (2022-09-23, Fri)
+ `geom_line_cutree` to add a line at the position where the tree was cut by `cutree()` 
+ solve issues requested by Bioconductor review (2022-09-21, Wed)
    - <https://github.com/Bioconductor/Contributions/issues/2748#issuecomment-1249521341>
+ add paramters `label_edge` and `alpha` in `autoplot.pvclust` (2022-08-18, Thu)
+ add examples of `pvclust` in vignettes (2022-08-17, Wed)
+ `autoplot()` method for `pvclust` object (2022-08-15, Mon)
+ fixed `BiocCheck()` (2022-08-12, Fri)
+ add `biocViews` in DESCRIPTION (2022-08-12, Fri)
+ `autoplot()` methods for `linkage`, `hclust`, `dendrogram`, `agnes`, `diana` and `twins` objects (2022-08-12, Fri)
