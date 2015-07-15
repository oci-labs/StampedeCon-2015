
#
# Slides 9, 10 -- Anscombe data
#

library(ggplot2)
library(gridExtra)

# Subset and group the Anscombe data for viewing.
ansdata=with(anscombe,
             data.frame(X=c(x1,x2,x3,x4),
                        Y=c(y1,y2,y3,y4),
                        Group=gl(4,
                                 labels=c('Scattered','Curved','Linear','Stack'),
                                 nrow(anscombe))))

# Plot without regression lines.
bare <- ggplot(ansdata,aes(x=X, y=Y)) + geom_point() + facet_wrap(~Group)

# Plot with regression lines.
plt <- ggplot(ansdata,aes(x=X, y=Y)) + geom_point() +
  geom_smooth(method=lm, se=F) + facet_wrap(~Group)

# Tabluate the mean and standard deviation information by group.
mean_tbl <- tableGrob(aggregate(.~Group,data=ansdata,mean),
                      show.rownames = F,
                      cols=c('Mean Values','X','Y'))
sd_tbl   <- tableGrob(aggregate(.~Group,data=ansdata,sd),
                      show.rownames = F,
                      cols=c('Standard Deviation Values','X','Y'))

# Generate panes for the tables and the plot to be arranged.
pcell <- arrangeGrob(mean_tbl,sd_tbl,nrow=2,as.table = F,heights=c(1,1))
dcells <- arrangeGrob(plt,pcell,nrow=1)

# Title for the diagrams.
title <- textGrob(label="Anscombe's Quartet",just="top",
              gp=gpar(fontsize=24,fontface="bold",lineheight=1.2))

# Create the diagrams.
grid.arrange( bare, main=title)
grid.arrange( dcells, main=title, nrow=1)

