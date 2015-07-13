speeds <- read.table('car-speeds.csv', sep =",", header = TRUE)

speeds_UT <- subset(speeds, State == 'Utah')

moments <- function(vec){
  mm <- mean(vec)
  ll <- sd(vec)
  n <- length(vec)
  ret <- data.frame(mean = mm, sd = ll, vec_length  = n)
  return(ret)
}

tapply(speeds_UT$Speed, speeds_UT$Color, moments)

tapply(speeds_UT$Speed, speeds_UT$Color, mean)
tapply(speeds_UT$Speed, speeds_UT$Color, sd)

moments(speeds_UT$Speed)

ddply(speeds, c('Color', 'State'), function(df){moments(df$Speed)})

ddply(speeds_UT, c('Color'), function(df){moments(df$Speed)})

ddply(speeds, c('Color'), function(df){moments(df$Speed)})

ddply(speeds, .(Color), function(df){moments(df$Speed)})



library(lattice)
summary(speeds)
histogram(~Speed|State*Color, speeds)


# library(latticeExtra)
# useOuterStrips(
#     histogram(~Speed|State*Color, speeds)
# )

# useOuterStrips(
#     densityplot(~Speed|State*Color, speeds)
# )



#ldply to make a data.frame with 10 draws of rnorm each for mean = 1:10
#then use bwplot to plot results

#this is the end of the means vector and the length
tot <- 10

#starting point of means vector
start <- 1

#creating a vector with 1, 2, 3,...,10
means <- start:tot

#creating a data.frame with the draws
my_data <- ldply(
  means, function(x){
    data.frame(mean = x, draws = rnorm(tot, mean = x))
  }
)

#t_my_data <- t(my_data)

bwplot(~draws|factor(mean), my_data)

bwplot(draws~factor(mean), my_data)
