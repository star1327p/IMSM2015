## A comment
## drawing from 2 distributions
v1 <- rnorm(50)
v2 <- rexp(50)


plot(v1, v2, main = 'plot1')
plot(v2, v1, main = 'plot2')


nn <- 100
mm <- 10
ss <- 0.1

v3 <- rnorm(nn, mean = mm, sd = ss)

hist(v3, xlab = 'Bins')

