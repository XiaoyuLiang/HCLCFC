\name{HCM}
\alias{HCM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Hierarchical Clustering Method
}
\description{
The bottom-up hierarchical clustering method to partition a large number of phenotypes into disjoint clusters within each category.
}
\usage{
HCM(y)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{
matrix: the phenotype needs to be grouped into disjoint clusters. Each row respresents an individual; Each column represents a phenotype.
}
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
y_CL=y[[1]]
L0=HCM(y_CL)
}

