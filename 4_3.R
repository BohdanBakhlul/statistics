failures <- read.table("failures.txt")
failures$V1

m <- 50
mu_est <- mean(failures$V1)
mu_est
(p_est <- mean(failures$V1) / m)