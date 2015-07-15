
#
# Slide 24, 25 -- portfolio performance and allocations
#

require("xts")
require("financeR")
require("fPortfolio")

data(djia2012w)
names(data)
scenarios <- dim(data)[1]
assets <- dim(data)[2]

data_ts <- as.timeSeries(data)

spec <- portfolioSpec()
setRiskFreeRate(spec) <- 0.001
setSolver(spec) <- 'solveRquadprog'
setNFrontierPoints(spec) <- 20

# constraints <- c('LongOnly')
constraints <- c('minW[1:assets]=0','maxW[1:assets]=0.5')
portfolioConstraints(data_ts,spec,constraints)

frontier <- portfolioFrontier(data_ts,spec,constraints)

tailoredFrontierPlot(frontier,col=rainbow(assets))
weightsPlot(frontier,col=rainbow(assets))

