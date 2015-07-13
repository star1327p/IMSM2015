## This is not very interesting
## draw from 2 distributions
## number of draws
nn <- 50
v1 <- rnorm(nn)
v2 <- rexp(nn)
plot(v1,v2,main="Title 1")
plot(v2,v1,main="Title 2")

## Do this
## historgram of 100 draws from a normal with mean of 10 and sd of 0.1
## with x-axis has a meaningful label
x <- rnorm(100,mean=10,sd=0.1)
hist(x,xlab="values")

# ---------------------------------------------------------------

## Example Data
speeds <- read.table('car-speeds.csv',
                     sep=",",header=TRUE
                     )
summary(speeds) # first step to look at the data!
head(speeds)    # shows the top 6 lines of the data frame
str(speeds)     # structure

speeds$state

gen = subset(speeds,State=='Utah')
aggregate(gen$Speed,list(gen$Color), mean)
aggregate(gen$Speed,list(gen$Color), sd)
tapply(gen$Speed,gen$Color,mean)
tapply(gen$Speed,gen$Color,sd)

## mean / sd of cars in Utah by color
moments <- function(vec) {
  mm <- mean(vec)
  ll <- sd(vec)
  nn <- length(vec)
  ret <- data.frame(mean=mm, sd=ll,n=nn)
  return(ret)
}

moments(subset(speeds, State=='Utah')$Speed)

library(plyr)
speed_summary <- ddply(
  speeds, c('Color','State'),function(df){
    moments(df$Speed)
})

## next step:
## summarize by just color
## then add n=length(vec) to moments function
speed_summary <- ddply(
  speeds, c('Color'),function(df){
    moments(df$Speed)
  })

library(lattice)
summary(speeds)
histogram(~Speed|State,speeds)
## ugly
histogram(~Speed|State*Color,speeds)
## less ugly
library(latticeExtra)
## don't do this now
useOuterStrips(
  histogram(~Speed|State*Color,speeds)
)
useOuterStrips(
  densityplot(~Speed|State*Color,speeds)
)

# -----------------------------------------------------------

## use ldply to make a data.frame 
## that has 10 draws of rnorm each for mean = 1:10
## then use bwplot to plot results
## bonus for 
## *indentation
## *useful variable names
## *useful comments


tot <- 10
means <- 1:10

my_data <- ldply(
  means, function(x){
    data.frame(mean = x,draws = rnorm(tot,mean=x))}
) # parse "means" into "x"

# new_data = t(my_data) # transposed

bwplot(~draws|factor(mean), my_data)

bwplot(draws~factor(mean), my_data)
