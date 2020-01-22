#1 The variable result in the file survey.txt describes the results of the survey of the activities
#of the president of a certain city. 100 city residents were randomly selected, and they were asked
#the following question: How would you rate the activities of the city president? The following
#answers were available: definitely good (a), good (b), wrong (c), definitely wrong (d), I have no
#opinion (e). Which type is this variable? What are its possible values?
#1. Import the data from the file survey.txt into the variable survey.
#2. Present the empirical distribution of the result variable in the form of a table.
#3. Present the empirical distribution of result variable only for persons with primary
#education in the form of a table.
#4. Illustrate the survey results using a bar chart and pie chart.
#5. Illustrate the results of the survey using a bar chart, broken down by women and men.

survey <- read.table("survey.txt", header = TRUE)
survey
results <- survey[3]
print("Empirical distribution of a variable result:")
data.frame(cbind(frequency = table(results), percent = prop.table(table(results))))

resultsMale <- survey[survey[1] == "m",]
resultsFemale <- survey[(survey[1] == "f"),]

resultsPrimary <- survey[(survey[2] == "p"),]
resultsPrimary[3]
print("Empirical distribution of a variable result(primary education):")
data.frame(cbind(frequency = table(resultsPrimary[3]), percent = prop.table(table(resultsPrimary[3]))))

barplot(table(results),
        xlab = "Answers", ylab = "Frequency",
        main = "Empirical distribution of answers", col=rainbow(5))

barplot(prop.table(table(results)),
        xlab = "Answers", ylab = "Probability",
        main = "Empirical distribution of answers", col=rainbow(5))

pie(table(results))

plot <- cbind(table(resultsFemale[3]), table(resultsMale[3]))
barplot(plot, beside = TRUE, legend = TRUE, col = rainbow(5))


#2 200 randomly selected 5-second time periods of work of a telephone exchange were examined.
#The number of calls was recorded. The results are contained in the file telephone_exchange.RData.
#Which type is this variable? What are its possible values?
#1. Import the data from the file telephone_exchange.RData.
#2. Present the empirical distribution of the number of calls in the form of a table.
#3. Illustrate the empirical distribution of the number of calls using a bar chart and pie chart.
#4. Calculate the mean of the number of calls, the median of the number of calls, the standard
#deviation of the number of calls, and the coefficient of variation of the number of calls.

load("telephone_exchange.RData")
telephone_exchange

print("Empirical distribution of a variable telephone_exchange:")
data.frame(cbind(frequency = table(telephone_exchange), percent = prop.table(table(telephone_exchange))))

barplot(table(telephone_exchange),
        xlab = "Number of calls", ylab = "Frequency",
        main = "Empirical distribution of number of calls", col=rainbow(5))
barplot(prop.table(table(telephone_exchange)),
        xlab = "Number of calls", ylab = "Probability",
        main = "Empirical distribution of number of calls", col=rainbow(5))
pie(table(telephone_exchange))

number <- telephone_exchange[,]
mean(number)
median(number)
sd(number)
sd(number) / mean(number) * 100


#3 The variable in the file failures.txt describes the results of 50 measurements of failure-free
#operation time of a given device (in hours). Which type is this variable? What are its possible values?
#1. Import the data from the file failures.txt.
#2. Present the empirical distribution of the failure-free operation time in the form of a table.
#3. Illustrate the empirical distribution of the failure-free operation time using a histogram,
#boxplot and stemplot. What are advantages and disadvantages of these charts?
#4. Calculate the mean, median, standard deviation, coefficient of variation, skewness and
#kurtosis of the failure-free operation time.

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

mean(failures$V1)
median(failures$V1)
sd(failures$V1)
sd(failures$V1) / mean(failures$V1) * 100
skewness(failures$V1)
install.packages("e1071")
library("e1071")
skewness(failures$V1)
kurtosis(failures$V1)
