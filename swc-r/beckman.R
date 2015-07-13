## This is not very interesting
## This is test code to draw from two different distributions

##nn is just naming of "magic number"
nn <- 50
v1 <- rnorm(nn)
v2 <- rexp(nn)
v1 #must evaluate variable to show output below

plot(v1,v2,main = "the new title")
plot(v2,v1,main = "switched axes")

## new task: histogram of 100 draws from normal with mean = 10, std dev = .1
v3 <- rnorm(100, mean = 10, sd = .1)
hist(v3,xlab="N(10,0.1)")

#note: xlab, ylab name axes and main names the whole plot
