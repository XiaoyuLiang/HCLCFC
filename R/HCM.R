
HCM=function(y)
{
  d=as.dist(1-cor(y))
  tree.average = hclust(d,method="average")
  LK=tree.average$height
  l_LK=length(LK)
  b_hat=which.max(LK[-1]-LK[-l_LK])
  groups=cutree(tree.average, h=LK[b_hat+1]-0.05)
  #groups=cutree(tree.average, h=LK[b_hat])
  numgro=max(groups)
  return(numgro)
}
