
#
# Slide 11 -- data exploration
#

library(datasets)
data(swiss)
require(stats)
require(graphics)

pairs(swiss,panel = panel.smooth, main="Swiss Data", col=3+(swiss$Catholic>50))
