# logistic regression
ucla <- read.csv('ucla_admit.csv', header = TRUE)

# 1
mod <- glm(admit ~ ., data = ucla)
summary(mod)

# 2 
data <- ucla[, 2:4]
pred <- predict(mod, data)
pred <- round(pred, 0) # find nearest integer
pred
ucla[, 1]

# 3
acc <- mean(pred == ucla[, 1])
acc
# 70.5%

