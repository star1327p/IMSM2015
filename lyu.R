speeds <- read.table ('car-speeds.csv',
                      +   sep=",", header=TRUE)
# mean / sd of cars in Utah by color
subset(speeds,State=='Utah')
moments <- function(vec){mm <-mean(vec);
ll <-sd(vec); n <- length(vec)
ret <- data.frame(mean=mm,sd=ll)
return(ret)}
install.packages('plyr')
library(plyr)
# next step: summarize by just color,then add
## n-length(vec) to moments function
s_summary <- ddply(speeds,c('Color','State'),
                   function(df){moments(df$Speed)})
moments <gth(vec)
  ret <- d- function(vec){
  mm <-mean(vec)
  ll <-sd(vec)
  n <- lenata.frame(mean=mm,sd=ll,n=length(vec))
  return(ret)
}
library(lattice)
  summary(speeds)
  histogram(~Speed|State, speeds)
  # ugly
  histogram(~Speed|State*Color,speeds)
  ##less ugly , do not so this now
  install.packages('latticeExtra')
  library(latticeExtra)
  useOuterStrips(
    histogram(~Speed|State*Color,speeds)
  )
  ## use ldply to make a data.frame
  ## that has 10 draws of rnorm each
  ## for mean=1:10
  ## then use bwplot to plot results
  ## bonus for 
  ## * indentation 
  ## * useful variable names 
  ## * useful comments
  means <- 1:10
  y <- function(x) {
    vec <- rnorm(10,mean=x)
    ret <- data.frame(mean=x,value=vec)
    return(ret)
  }
  draws <- ldply(means,y)
  bwplot(~value|factor(mean),draws)
  
  # finish