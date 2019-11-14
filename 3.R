#1

survey <- read.table("survey.txt", header = TRUE)
survey
result <- (survey[3])

#2
data.frame(cbind(frequency = table(result), percent = prop.table(table(result))))

#3
install.packages("tidyverse")
library(tidyverse)
results <- (survey %>% filter(V2 == "p"))
results <- results[3]
data.frame(cbind(frequency = table(results), percent = prop.table(table(results))))

#second way
#resultsPrimary <- survey[(survey[2] == "p"),]
#resultsPrimary[3]
#data.frame(cbind(frequency = table(resultsPrimary[3]), percent = prop.table(table(resultsPrimary[3]))))

#4
barplot(table(result),
        xlab = "Answers", ylab = "Frequency",
        main = "Empirical distribution of answers", col=rainbow(5))

barplot(prop.table(table(result)),
        xlab = "Answers", ylab = "Probability",
        main = "Empirical distribution of answers", col=rainbow(5))

pie(table(result))

resultsM <- survey[survey[1] == "m",]
resultsF <- survey[survey[1] == "f",]
myplot <- cbind(table(resultsF[3]), table(resultsM[3]))
barplot(myplot, xlab = "F        |        M", beside = TRUE, legend = TRUE, col = rainbow(5))