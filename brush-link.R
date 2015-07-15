
#
# Slide 13 -- brushing and linking
#

library(ggplot2)
library(grid)
library(gridExtra)
library(rggobi)
library(DescribeDisplay)

run_not_plot <- T

if(run_not_plot) {
  olive_file <-'/usr/share/ggobi/data/olive.csv'
  olive_data <- read.csv(olive_file)
  ggobi(olive_data)

} else {
  barchart1_data <- dd_load('data/brush-link1.dd')
  scatterchart_data <- dd_load('data/brush-link2.dd')
  barchart2_data <- dd_load('data/brush-link3.dd')
  parallel_data <- dd_load('data/brush-link4.dd')
  
  barchart1_chart <- ggplot(barchart1_data)
  scatterchart_chart <- ggplot(scatterchart_data)
  barchart2_chart <- ggplot(barchart2_data)
  parallel_chart <- ggplot(parallel_data)
  
  toprow <- arrangeGrob(scatterchart,barchart1_chart,barchart2_chart,nrow=1,widths=c(2,1,1))
  grid.arrange(toprow,parallel_chart,nrow=2)
}

