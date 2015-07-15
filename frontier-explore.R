
require("xts")
require("financeR")
require("fPortfolio")

Data = SMALLCAP.RET
Data = Data[,1:20]
samples <- dim(Data)[1]
assets <- dim(Data)[2]

spec <- portfolioSpec()
setSolver(spec) <- 'solveRquadprog'
setNFrontierPoints(spec) <- 20

constraints <- c('minW[1:assets]=0','maxW[1:assets]=0.5')
portfolioConstraints(Data,spec,constraints)

type <- 'frontier'
# type <- 'weights'

plotfunction <- function(rfr,window) {
  setRiskFreeRate(spec) <- rfr
  frontier <- portfolioFrontier(Data[(samples-window+1):samples,],spec,constraints)
  switch(type,
         'frontier' = tailoredFrontierPlot(frontier,col=rainbow(assets)),
         'weights'  = weightsPlot(frontier,col=rainbow(assets))
  )
}

library(manipulate)

manipulate(plotfunction(RiskFreeRate,Window),
           RiskFreeRate=slider(0.00,0.04,step=0.001),
           Window=slider(assets+1,samples,initial=samples,step=1))