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

# Task 1
# Histogram of 100 draws from a normal distribution with mean = 10, and sd=0.1 
# with a meaningful label for the x-axis
nn=100
v3 <- rnorm(nn, mean = 0, sd = 0.1)
hist(v3, xlab = "A meaningful x-axis label")
