# HCLC-FC: a Novel Statistical Method for Phenome-Wide Association Studies

The R package HCLCFC is a novel tool that allows users to transform an image into a simulated dataset that can be used to extract and analyze the complex information in biomedical and biological research. The package also includes three novel and efficient methods for image clustering based on finding minimum spanning tree by Prim's algorithm, detecting communities by modularity optimization, and finding the branches of the backbone of minimum spanning tree.

We derived a novel and powerful multivariate method, which we referred to as HCLC-FC (Hierarchical Clustering Linear Combination with False discovery rate Control), to test the association between a genetic variant with multiple phenotypes for each phenotypic category. The R package HCLCFC is a novel tool that allows users to 

The proposed method involves three steps. 

Step 1. We apply the bottom-up hierarchical clustering method to partition a large number of phenotypes into disjoint clusters within each category.

Step 2. The clustering linear combination method is used to combine test statistics within each category based on the phenotypic clusters and obtain p-values from each phenotypic category.

Step 3. We propose a false discovery rate (FDR) control approach based on a large-scale association testing procedure with theoretical guarantees for FDR control under flexible correlation structures. 


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
Clone this repo to your local machine using `https://github.com/XiaoyuLiang/HCLCFC`

You can install HCLCFC package from Github, with the devtools package:
```
devtools::install_github("XiaoyuLiang/HCLCFC")
```
Once HCLCFC is installed, it can be loaded by the following command.
```
library("HCLCFC")
```

## 2. Running the tests
```
data(i2d_Example,package="i2d")
image.dat <- i2d(image=i2d_Example, p.n=5000)
```

## 3. Bug reports and feature requests
Bug reports, feature requests, or any other issues with the package should be reported at [issues](https://github.com/XiaoyuLiang/HCLCFC/issues).

## 4. Authors
* **Ying Hu** - yhu@mail.nih.gov
* **Chunhua Yan** - yanch@mail.nih.gov
* **Xiaoyu Liang** - xiaoyu.liang@yale.edu

## 5. Acknowledgments
Ying Hu designed research and wrote R package.
