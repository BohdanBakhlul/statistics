load("telephone_exchange.RData")
telephone_exchange
nums <- unlist(telephone_exchange)
unname(nums)
m <- 200
mu_est <- mean(nums)
mu_est
(p_est <- mean(nums) / m)
probs <- dbinom(sort(unique(nums)), size = m, prob = p_est)
counts <- matrix(c(prop.table(table(nums)), probs), nrow = 2, byrow = TRUE)
rownames(counts) <- c("empirical", "theoretical")
colnames(counts) <- sort(unique(nums))
counts
barplot(counts, 
        xlab = "Number of mistakes", ylab = "Probability",
        main = "Empirical and theoretical distributions of number of mistakes",
        col = c("red", "blue"), legend = rownames(counts), beside = TRUE)

qqplot(rbinom(length(nums), size = m, prob = p_est), nums)
qqline(nums, distribution = function(probs) { qbinom(probs, size = m, prob = p_est) })

# empirical
mean(nums < 4)

# theoretical
(sigma_est <- sd(nums))
pnorm(4, mu_est, sigma_est)

install.packages("EnvStats")
library(EnvStats)
enorm(nums,
      method = "mvue",
      ci = TRUE, ci.type = "two-sided", conf.level = 0.96, ci.param = "mean")

enorm(nums,
      method = "mle",
      ci = TRUE, ci.type = "two-sided", conf.level = 0.96, ci.param = "mean")

enorm(nums,
      method = "mme",
      ci = TRUE, ci.type = "two-sided", conf.level = 0.96, ci.param = "mean")