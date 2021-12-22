\name{CLC}
\alias{CLC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Clustering Linear Combination Method
}
\description{
The clustering linear combination method is used to combine test statistics within each category based on the phenotypic clusters and obtain p-values from each phenotypic category.
}
\usage{
CLC(x,y,L)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{numeric: the genotypic score of n individuals at a genetic variant of interest, where the element can be 0, 1, 2 is the number of minor alleles that the i^th individual carries at athe genetic variant.}
  \item{y}{matrix: the phenotype needs to be grouped into disjoint clusters. Each row respresents an individual; Each column represents a phenotype.}
  \item{L}{numeric: number of clusters estimated by Hierarchical Clustering Method in step 1.}
}
\references{
Sha, Q., et al. A clustering linear combination approach to jointly analyze multiple phenotypes for GWAS. Bioinformatics 2019;35(8):1373-1379.
}
\examples{
## Generate both genotype and phenotype data
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
x=sample(c(0:2),size=n,replace=TRUE,prob=c((1-maf)^2,2*maf*(1-maf),maf^2))
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

## Partition a large number of phenotypes into disjoint clusters within each category.
y_CL=y[[10]]
L0=HCM(y_CL)
## Use CLC to calculate p-value for each phenotypic category
CLC(x,y_CL,L0)
}

