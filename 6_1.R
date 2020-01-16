#1. Calculate the mean number of remembered words in each context.
#In addition, present the data obtained using a boxplot for each context individually.

data <- matrix(c(25, 11, 14, 25, 8,
                 26, 21, 15, 15, 20,
                 17, 9, 29, 23, 10,
                 15, 6, 10, 21, 7,
                 14, 7, 12, 18, 15,
                 17, 14, 22, 24, 7,
                 14, 12, 14, 14, 1,
                 20, 4, 20, 27, 17,
                 11, 7, 22, 12, 11,
                 21, 19, 12, 11, 4), ncol = 5, byrow = T )
colnames(data) <- c("Same", "Different", "Imagery", "Photo", "Placebo")
data <- as.table(data)
data

same <- data[,1]
different <- data[,2]
imagery <- data[,3]
photo <- data[,4]
placebo <- data[,5]
#meanNumber <- matrix(c("Different", mean(different), "Imagery", mean(imagery),
#                       "Photo Context", mean(photo), "Placebo", mean(placebo),
#                        "Same", mean(same)), ncol = 2, byrow = T)
#colnames(meanNumber) <- c("CONTEXT", "X")
#rownames(meanNumber) <- c(1, 2, 3, 4, 5)
#meanNumber <- as.table(meanNumber)
meanNumber <- data.frame("CONTEXT" = c("Different", "Imagery", "Photo Context", "Placebo",
                                       "Same"), X = c(mean(different), mean(imagery), mean(photo), mean(placebo), mean(same)))
meanNumber

boxplot(different, imagery, photo, placebo,  same, names = c("Different", "Imagery", "Photo Context",
                                                             "Placebo", "Same"), ylab = "Number of words")

#?????????????????????
#2. Perform an analysis of variance test to see if the number
#of words remembered depends on the context of the knowledge checking
summary(aov(as.numeric(meanNumber[,2]) ~ meanNumber[,1], data = data))


#???????????????
#3. Check the assumptions of the one-way analysis of variance model.


#4. Perform post hoc tests to see which knowledge checking contexts are different.
pairwise.t.test(meanNumber$CONTEXT, meanNumber$X, data = data)