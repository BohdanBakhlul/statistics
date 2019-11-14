#1
load("telephone_exchange.RData")
telephone_exchange
calls <- (telephone_exchange[2])
calls

#2
data.frame(cbind(frequency = table(calls), percent = prop.table(table(calls))))

#3
barplot(table(calls),
        xlab = "Num of calls", ylab = "Frequency",
        main = "Empirical distribution of calls no.", col=rainbow(6))

barplot(prop.table(table(calls)),
        xlab = "Num of calls", ylab = "Probability",
        main = "Empirical distribution of calls no.", col=rainbow(6))

pie(table(calls))

#4
var <- telephone_exchange[,]
mean(var)
median(var)
sd(var)
sd(var) / mean(var) * 100
