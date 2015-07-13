## This is not very interesting
## This is test code to draw from two different distributions

## nn is just naming of "magic number"
nn <- 50
v1 <- rnorm(nn)
v2 <- rexp(nn)
v1 ## must evaluate variable to show output below

plot(v1,v2,main = "the new title")
plot(v2,v1,main = "switched axes")

## new task: histogram of 100 draws from normal with mean = 10, std dev = .1
v3 <- rnorm(100, mean = 10, sd = .1)
hist(v3,xlab="N(10,0.1)")

## note: xlab, ylab name axes and main names the whole plot

## now we pull in a data set, want to find particular data for certain
## subsets of that data (ie state and color)

speeds <- read.table('car-speeds.csv', sep = ",", header=TRUE)
speedsUtah <- subset(speeds,State=='Utah')
summary(subset(speedsUtah,Color=='Red'))
summary(subset(speedsUtah,Color=='White'))
summary(subset(speedsUtah,Color=='Blue'))
summary(subset(speedsUtah,Color=='Black'))
## make a function to return mean, sd, and length
moments <- function(vec) {
  mm <- mean(vec)  
  ll <- sd(vec)
  length <- length(vec)
  ret <- data.frame(mean=mm,sd=ll,NumInstances=length)
  return(ret)
}

## split up data, do moments function to each split, return in df
speed_summary1 <- ddply(speeds,c('Color','State'),function(df){moments(df$Speed)})
speed_summary2 <- ddply(speeds,c('Color'),function(df){moments(df$Speed)})

## plot via a histogram
library(lattice)
summary(speeds)
histogram(~Speed|State, speeds)
histogram(~Speed|State*Color, speeds)
## typically, you do y~x, but since histogram, no y (frequency automatic)
## gets kind of messy; latticeExtra package can help, but not doing this now

histogram(~Speed|Color, speeds)

## use ldply to make a data.frame
## that has 10 draws of rnorm each for mean = 1:10
## then use bwplot to plot results
## bonus for *indentation *useful variable names *useful comments

random <- function(integer){
  vec <- rnorm(10,mean = integer,sd=1)
  mm <- integer
  ret <- data.frame(mean=mm,values=vec)
  return(ret)
}

RandomList <- ldply(1:10,random)
bwplot(~values|factor(mean),RandomList,main='Distribution with Varying Mean')
## no y again, so nothing before ~
## condition on mean (which we make a factor)
## tell it that the information comes from data set RandomList

## other possible commands
str(speeds)
head(speeds)

