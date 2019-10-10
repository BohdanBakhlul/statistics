#2
x <- c(rep(TRUE, 3), rep(FALSE, 4), rep(TRUE, 2), rep(FALSE, 5))
x
y <- as.numeric(x)
y

#3
a <- c(1:20, rep(0, 10), seq(2, 40, by = 2), seq(40, 2, -2), rep(0, 10), 20:1)
a

#4
b <- letters
d <- c(b[seq(5, 25, 5)])
d

#5
g <- 1:1000
#for (i in g){
 # if (g[i] %% 2 == 0){
  #g[i] <- 1/g[i]
  #}
#}
#g

g[seq(2, 1000, 2)] <- 1/g[seq(2, 1000, 2)]
g

#6
h <- c(6,3,4,5,2,3)
h <- sort(h, decreasing = TRUE)
h

#7
i <- c(-1.876, -1.123, -0.123, 0, 0.123, 1.123, 1.876)
sign(i)
k <- round(i, digits = 2)
floor(k)

#8
time1 <- Sys.time()
l <- 1:1000000
m <- sqrt(l)
m
Sys.time() - time1

#9
n <- 1:10
sum(n)
prod(n)
mean(n)
var(n)
sd(n)
median(n)
quantile(n)
quantile(n, 0)
quantile(n, 1)

#10
library(schoolmath)
data("primlist")
primlist
