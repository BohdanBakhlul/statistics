info <- c(862, 870, 876, 866, 871, 865, 861, 873, 871, 872)
alpha <- 0.05
shapiro.test(info)
mean(info)
t.test(info, mu = 870, alternative = "less")
qqnorm(info)
qqline(info)