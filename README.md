# HCLC-FC: a Novel Statistical Method for Phenome-Wide Association Studies

We derived a novel and powerful multivariate method, which we referred to as HCLC-FC (Hierarchical Clustering Linear Combination with False discovery rate Control), to test the association between a genetic variant with multiple phenotypes for each phenotypic category in phenome-wide association studies (PheWAS). The R package HCLCFC is a novel tool that (1) allows users to partition a large number of phenotypes into disjoint clusters; (2) applicable to electronic medical records (EMR)-based PheWAS.

The proposed method involves three steps. 

**Step 1.** We apply the bottom-up hierarchical clustering method to partition a large number of phenotypes into disjoint clusters within each category.

**Step 2.** The clustering linear combination method is used to combine test statistics within each category based on the phenotypic clusters and obtain p-values from each phenotypic category.

**Step 3.** We propose a false discovery rate (FDR) control approach based on a large-scale association testing procedure with theoretical guarantees for FDR control under flexible correlation structures. 


## 1. Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("MASS")
BiocManager::install("stats")
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
n=200
K=100
maf=0.3
c2=0.5
rho_fa=0.2
rho=0.3
beta=0.012
M=10
k=K/M
lm0=beta*seq(k)
lambda=rbind(matrix(0,M-1,k),lm0)
Ha=100
x=sample(c(0:2),size=n,replace=T,prob=c((1-maf)^2,2*maf*(1-maf),maf^2))
Sigma_fa=(1-rho_fa)*diag(M)+rho_fa*matrix(rep(1,M^2),M)
Sigma=matrix(NA,k,k)
for (i in 1:k){
  for (j in 1:k){
    Sigma[i,j]=rho^(abs(i-j))
  }
}
y=matrix(NA,n,K)
for (i in 1:n){
  f=mvrnorm(1,rep(0,M),Sigma_fa)
  y0=matrix(NA,M,k)
  for (m in 1:M){
    E=mvrnorm(1,rep(0,k),Sigma)
    y0[m,]=x[i]*lambda[m,]+sqrt(c2)*f[m]*rep(1,k)+sqrt(1-c2)*E
  }
  y1=t(y0)
  y[i,]=c(y1)
}
ysplit=rep(1:M, times=rep(k,M))
tmp=split.data.frame(t(y),ysplit)
y=lapply(tmp,t)

y_CL=y[[10]]
L0=HCM(y_CL)
CLC(x,y_CL,L0)
```

## 3. Bug reports and feature requests
Bug reports, feature requests, or any other issues with the package should be reported at [issues](https://github.com/XiaoyuLiang/HCLCFC/issues).

## 4. Authors
* **Xiaoyu Liang** - xliang10@uthsc.edu
* **Xuewei Cao** -xueweic@mtu.edu
* **Qiuying Sha** - qsha@mtu.edu
* **Shuanglin Zhang** - shuzhang@mtu.edu

## 5. Acknowledgments
S. Z. and Q. S. designed research, X. L. and S. Z. performed the statistical analysis, X. C. performed real data analysis, and X. L., X. C., Q. S., and S. Z. wrote the manuscript.
