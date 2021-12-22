
FDR_Control=function(pv,alpha0=0.05){
  M=length(pv)
  pv_sort=sort(pv)
  ro=alpha0/M
  b0=min(pv_sort,ro)
  b=rep(NA, (M-1))
  for (s in 1:(M-1)){
    if (ro*s<pv_sort[s]) {
      b[s]=0
    } else if (ro*s>=pv_sort[s] & ro*s<=pv_sort[s+1]) {
      b[s]=ro*s
    } else if (ro*s>=pv_sort[s+1]) {
      b[s]=pv_sort[s+1]
    }
  }
  cut=max(c(b0,b))
  return(cut)
}
