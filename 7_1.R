year <- c(1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002)
num_of_cases <- c(39.7, 38.2, 34.7, 33.1, 30.1, 28.4, 26.3, 24.7)
newdata <- data.frame(year = year, num_of_cases = num_of_cases)
plot(newdata, main = "Scatter diagram", pch = 20)
model <- lm(num_of_cases ~ year, data = newdata)
model
abline(model, col = "red", lwd = 2)
coef(model)
confint(model)
summary(model)
fitted(model)
residuals(model)

temp_year <- data.frame(year = seq(min(newdata$year) - 10, 
                                         max(newdata$year) + 10, 
                                         length = 100))
pred <- predict(model, temp_year, interval = "prediction")
plot(newdata, main = "Scatter diagram", pch = 16)
abline(model, col = "red", lwd = 2)
lines(temp_year$year, pred[, 2], lty = 2, col = "red")
lines(temp_year$year, pred[, 3], lty = 2, col = "red")

new_year <- data.frame(year = c(2003, 2004, 2005, 2006, 2007))
a <- predict(model, new_year, interval = 'prediction')
plot(newdata, main = "Scatter diagram", pch = 20, xlim = c(1995, 2007), ylim = c(10, 40))
abline(model, col = "red", lwd = 2)
points(c(2003, 2004, 2005, 2006, 2007), a[ ,1], col = "blue", pch = 20)
temp_year <- data.frame(year = seq(min(c(newdata$year, 2003, 2004, 2005, 2006, 2007)) - 10, 
                                   max(c(newdata$year, 2003, 2004, 2005, 2006, 2007)) + 10, 
                                   length = 100))
pred <- predict(model, temp_year, interval = "prediction")
lines(temp_year$year, pred[, 2], lty = 2, col = "red")
lines(temp_year$year, pred[, 3], lty = 2, col = "red")
