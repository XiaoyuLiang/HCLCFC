
CLC=function(x,y,L)
{
  n=nrow(y)
  K=ncol(y)
  yvar=apply(y,2,var)
  Tstat=n*cov(y,x)/sqrt(n*yvar*var(x))
  Sigma=cor(y)
  dist=1-Sigma
  hc=hclust(as.dist(dist),method="average")
  index=cutree(hc,L)
  B=sapply(1:L, function(t) as.numeric(index==t))
  W=ginv(t(B)%*%ginv(Sigma)%*%B)%*%t(B)%*%ginv(Sigma)
  U=t(W)%*%ginv(W%*%Sigma%*%t(W))%*%W
  CLC=t(Tstat)%*%U%*%Tstat
  pv0=1-pchisq(CLC,L)
  return(pv0)
}
