# HCLC-FC: a Novel Statistical Method for Phenome-Wide Association Studies

The R package HCLCFC is a novel tool that allows users to transform an image into a simulated dataset that can be used to extract and analyze the complex information in biomedical and biological research. The package also includes three novel and efficient methods for image clustering based on finding minimum spanning tree by Prim's algorithm, detecting communities by modularity optimization, and finding the branches of the backbone of minimum spanning tree.

The package can be used for generating data sets for

1. image clustering
2. biomedical and biological research
3. 2D and 3D data set visualization


## 1. Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("EBImage")
BiocManager::install("igraph")
```

### Installation
Clone this repo to your local machine using `https://github.com/XiaoyuLiang/i2d`

You can install i2d package from Github, with the devtools package:
```
devtools::install_github("XiaoyuLiang/i2d")
```
Once i2d is installed, it can be loaded by the following command.
```
library("i2d")
```

## 2. Running the tests
```
data(i2d_Example,package="i2d")
image.dat <- i2d(image=i2d_Example, p.n=5000)
```

## 3. Bug reports and feature requests
Bug reports, feature requests, or any other issues with the package should be reported at [issues](https://github.com/XiaoyuLiang/i2d/issues).

## 4. Contributions
Please read [CONTRIBUTING](https://github.com/XiaoyuLiang/i2d/blob/master/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## 5. Authors
* **Ying Hu** - yhu@mail.nih.gov
* **Chunhua Yan** - yanch@mail.nih.gov
* **Xiaoyu Liang** - xiaoyu.liang@yale.edu

## 6. Acknowledgments
Ying Hu designed research and wrote R package.
