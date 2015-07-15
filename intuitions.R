
#
# Slides 5 and 6 -- Clarify Intuitions
#

library(ggplot2)

limit_range <- function(fun, min, max) {
  function(x) {
    y <- fun(x)
    y[x<min | x>max] <- NA
    return(y)
  }
}

curve <- function(x) {
  1 / (1 + exp(-x + 10))
}

intgrl <- 'italic(integral(f(x)*dx,a,b) * " = area under curve")'

# Set the range
p <- ggplot(data.frame(x=c(0,20)),aes(x=x))

p + stat_function(fun = limit_range(curve,0,12), geom="area", fill="blue", alpha="0.2") +
    stat_function(fun=curve) +
    annotate("text",x=0.5,y=0.9,label=intgrl,parse=T,
             family="serif",fontface="italic",colour="black",size=11,hjust=0)


curve2 <- function(x) {
  y <- 2*(x-3)^2 + 3*(x-5)^2 / (x^4 + 1)
}

drvtv <- 'italic(over(d,dx) * f(x) * " = slope of line")'


# Set the range
p <- ggplot(data.frame(x=c(-5,5)),aes(x=x))

p + stat_function(fun=curve2) +
    geom_abline(intercept=132,slope=50,color="red") +
    annotate("text",x=0.5,y=110,label=drvtv,parse=T,
             family="serif",fontface="italic",colour="black",size=11,hjust=0)



