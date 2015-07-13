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
