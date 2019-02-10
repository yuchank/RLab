# linear regression
head(state.x77)
x77 <- data.frame(state.x77)
plot(Murder ~ Illiteracy, data = x77)
model <- lm(Murder ~ Illiteracy, x77)
model
coef(model)[1] #b
coef(model)[2] #W


Illiteracy <- x77['Illiteracy']
Murder <- x77['Murder']
pred <- 4.257457 * Illiteracy + 2.396776
compare <- cbind(pred, Murder, abs(pred - Murder))
# draw hypothesis
abline(coef(model))

# 2
4.257457 * 0.5 + 2.396776
4.257457 * 1 + 2.396776
4.257457 * 1.5 + 2.396776