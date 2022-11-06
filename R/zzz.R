##' @importFrom utils packageDescription
.onAttach <- function(libname, pkgname) {
  pkgVersion <- packageDescription(pkgname, fields="Version")
  #msg <- paste0(pkgname, " v", pkgVersion, "  ",
  #              "For help: https://guangchuangyu.github.io/software/", pkgname, "\n\n")
  msg <- "\n"
  
  citation <- paste0("If you use ", pkgname, " in published research, please cite:\n",
                     "Guangchuang Yu. (2022). ",
                     "Data Integration, Manipulation and Visualization of Phylogenetic Trees (1st edition). ",
                     "Chapman and Hall/CRC. doi:10.1201/9781003279242") 

  packageStartupMessage(paste0(msg, citation))
  
  options(clade_width_extend = 0.35)
  options(clade_align = TRUE)

}



