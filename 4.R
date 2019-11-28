brakes <- read.table("brakes.txt", dec = ",")
brakes

brakehist <- brakes$V1
brakehist
hist(brakehist, 
     main = "Empirical and theoretical distributions of braking distance",
     xlab = "Braking distance",
     ylab = "Density",
     probability = TRUE)

sd(brakehist)

lines(density(brakes$V1), col = "red", lwd = 2)
(mu_est <- mean(brakes$V1))
(sigma_est <- sd(brakes$V1))
curve(dnorm(x, mu_est, sigma_est), 
      add = TRUE, col = "blue", lwd = 3)
curve(dnorm(x, mu_est, sigma_est), 
      add = TRUE, col = "green", lwd = 2)

legend("topleft", legend = c("S", "MLE", "MVUE"), col = c("blue", "green", "pink"), lwd = 2)