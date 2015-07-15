
#
# Slide 23 -- covariance
#

require("xts")
require("financeR")
require("fPortfolio")
Data = SMALLCAP.RET
Data = Data[,1:20]

library(corrplot)
M <- cor(Data)

marvalues <- c(1.1,0.5,2.1,0.5)

corrplot(M,method='ellipse',type='upper',order='hclust',
         mar=marvalues,
         tl.col='black',tl.srt=45)

cor.mtest <- function(mat,...) {
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat <- matrix(NA,n,n)
  diag(p.mat) <- 0
  for(i in 1:(n-1)) {
    for(j in (i+1):n) {
      tmp <- cor.test(mat[,i],mat[,j],...)
      p.mat[i,j] <- p.mat[j,i] <- tmp$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}

p.mat <- cor.mtest(Data)
corrplot(M,method='ellipse',
         type='upper',order='hclust',
         p.mat=p.mat, sig.level=0.01, insig = 'blank',
         mar=marvalues,
         tl.col='black',tl.srt=45)
