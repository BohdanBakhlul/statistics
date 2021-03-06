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
ab <- primlist<1000
max(primlist[ab])
ac <- primlist>100 & primlist<500
length(primlist[ac])

#11
vec1 <- c("a", "b")
vec2 <- c(1,2,3)
paste(rep(vec1, each = length(vec2)), vec2, sep="")

#12
vec3 <- 1:30
vec4 <- c("X", "Y", "Z")
vec5 <- paste(vec3, vec4, sep=".")

#13
install.packages("carData")
install.packages("car")
library(car)
library(carData)
ae <- c('a', 'b','c','d', 'e')
af <- sample(ae, 100, replace= TRUE)
recode(af, "c('a','b') = 1; c('c','d') = 2; 'e' = 3")

#14
xx <- c(NA, 3, 14, NA, 33, 17, NA, 41)
sum(is.na(xx))
mean(xx, na.rm = TRUE)
xb <- xx[!is.na(xx)]
xb
xx[is.na(xx)] <- 11
xx

#15
(myList <- list(c("Bohdan", "Bakhlul"), 3.14, unique, seq(0, 1, 0.1)))
myList[[3]] <- NULL
myList[[1]] <- NULL
myList
Listva <- c(gamma(myList[[1]]), gamma(myList[[2]]))
Listva

#16
vector1 <- 1:100
sqrvector1 <- vector1^2
sqrvector1
ftable(sqrvector1 %% 10)

#17
numers <- 1:5
outer(numers, numers, '*')

#18
library(matlib)
library(Matrix)
(matr <- matrix(c(1, 2, 1, 5, 0, 2, 3, 5, 1), nrow = 3, ncol = 3))
rankMatrix(matr)
det(matr)
matr2 <- solve(matr)
eigen(matr)
colMeans(matr)
rowMeans(matr)
colSums(matr)
rowSums(matr)
matr3 <- matr * matr2
matr3

#19
install.packages("MASS")
library(MASS)
data("birthwt")
fac <- birthwt[, "ftv"]
fac_factor <- factor(fac)
fac_factor
p <- levels(fac_factor)
p
factor(fac, levels = c("0", "1", "2 or more"))


#20
data("Cars93")
f <- sapply(Cars93, is.factor)
f
table(Cars93[, "Origin"], Cars93[, "Type"])

#21
install.packages("tidyverse")
library(tidyverse)
even_indexes<-seq(2,96,2)
abcd <- read.csv(file="data_cancer.csv", header=TRUE, sep=",")
abcd.new = abcd[seq(2,96,2), ]
abcd.new
abcd %>% filter(age > 50, lymph_nodes == 1)
length(colnames(abcd))

#23
toRad <- function(angle) {
  (angle * pi)/180
}

angles <- c(0, 30, 45, 60, 90)
toRad(angles)


anglesData <- data.frame(sin(toRad(angles)), cos(toRad(angles)), tan(toRad(angles)), atan(toRad(angles)))
colnames(anglesData) <- c("sin", "cos", "tg", "ctg")
anglesData

#24
x <- 1:5
product <- 1
for (i in x) {
  product <- product * i
}
product

product <- 1
i <- 1
while(i <= length(x)) {
  product <- product * i
  i <- i + 1
}
product

product <- 1
i <- 1
repeat {
  if(i > length(x)){
    break
  }
  product <- product * i
  i <- i + 1
}
product

#25
n <- 2:100
r <- 1:99
count <- 0
for(i in n){
  for(j in r){
    if(i < j){
      break
    }
    combination <- choose(i, j)
    if(combination > 1000000) {
      count <- count + 1
    }
  }
}
count

#26
vectt<-c(1,2,1)
nice <- "nice"
if (all(vectt==rev(vectt)) == TRUE) {print("Palindrome")}
