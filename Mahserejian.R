## This is not interesting
## draw values form 2 distributions
## nn=number of draws
nn <- 50
v1 <- rnorm(nn)
v2 <- rexp(nn)
v1
plot(v1,v2)
plot(v2,v1)
title(main = "Main Title")
plot(v1, main = "V1 Title")

########################################################################################

## Task 1
## Histogram of 100 draws from a normal distribution with mean = 10, and sd=0.1 with a meaningful label for the x-axis
nn=100
v3 <- rnorm(nn, mean = 0, sd = 0.1)
hist(v3, xlab = "A meaningful x-axis label")

########################################################################################

## Task 2
## Find the mean/sd of cars in utah by color
# Read data
speeds <- read.table('car-speeds.csv', sep=",", header="TRUE")
# only data on cars in utah
subset(speeds, State == 'Utah')
# define a function that returns the Mean, SD, and number of terms of a vector
moments <- function(vec){
  mm <- mean(vec)
  ll <- sd(vec)
  n = length(vec)
  ret <- data.frame(mean=mm, sd=ll, length=n)
  return(ret)
}
# Use the moments function to get the mean and sd of speeds for all of the cars in Utah
moments(subset(speeds, State == 'Utah')$Speed)
# Install 'plyr' package - needed for ddply function
install.packages('plyr')
# Load the plyr package
library(plyr)
#Create dataframe by color and state
speed_summary <- ddply(speeds, c('Color', 'State'), 
                       function(df){moments(df$Speed)}
                       )
#Create dataframe by color only
speed_summary1 <- ddply(speeds, c('Color'), 
                        function(df){moments(df$Speed)}
                        )

########################################################################################

## Task 3
## Plot a histogram by State only, and by state and color
library(lattice)
summary(speeds)
histogram(~Speed|State, speeds)
histogram(~Speed|State*Color, speeds) #This can look messy

# Now, make density plots instead of histograms
install.packages('latticeExtra')
library(latticeExtra)
useOuterStrips(
  densityplot(~Speed|State*Color, speeds)
  )

########################################################################################

## Task 4 - Challenging
## Use ldply to make a dataframe that has 10 draws of rnorm each for mean=1:10,
## then use bwplot to plot results
## BONUS: *indentation, *useful variable names, *useful comments
# Define a vector of mean values to draw from
means = 1:10
# Define function to draw 10 values for a given mean value
RandVecMaker <- function(MeanVal){
  vec <- rnorm(10, mean=MeanVal)
  ret <- data.frame(mean=MeanVal, value=vec) 
  return(ret)
}
# Create dataframe with draws for each mean in separate rows
draws <- ldply(means, RandVecMaker)
# Plot results of values conditioned on mean values
bwplot(~value|factor(mean), draws)
bwplot(~value|mean, draws)

