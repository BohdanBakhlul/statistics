failures <- read.table("failures.txt", header = TRUE)
failures
head(failures)
print("Empirical distribution of a variable failures:")
failures_hist <- hist(failures$V1, plot = FALSE)$breaks
data.frame(cbind(frequency = table(cut(failures$V1, breaks = failures_hist)),
                 percent = prop.table(table(cut(failures$V1, breaks = failures_hist)))))

hist(failures$V1,
     main = "Empirical distribution of failure-free operation time",
     xlab = "Failure-free operation time")
hist(failures$V1,
     xlab = "Failure-free operation time",
     main = "Empirical distribution of failure-free operation time",
     probability = TRUE,
     col = "green")
lines(density(failures$V1), col = "red", lwd = 2)
boxplot(failures$V1,
        ylab = "Failure-free operation time",
        main = "Empirical distribution of failure-free operation time")
stem(failures$V1)