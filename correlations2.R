
library(mvtnorm)

# Generate two random series with specified statistics - including correlation.
CorrelatedXY <- function(N, mean1, mean2, var1, var2, correlation) {
  covar <- correlation * sqrt(var1*var2)
  rmvnorm(n=N, mean=c(mean1,mean2), sigma=matrix(c(var1,covar,covar,var2),2,2))
}

dissimilarity <- 1 - abs(cor(data))
distance <- as.dist(dissimilarity)

plot(hclust(distance))

library(cluster)
plot(agnes(distance))
plot(pam(distance,6))

library(pvclust)
cluster.data <- pvclust(data,nboot=1000,method.dist="abscor")
plot(cluster.data)
pvrect(cluster.data)

