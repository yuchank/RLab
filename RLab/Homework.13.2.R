library(mlbench)
data(BostonHousing)
head(BostonHousing)

newdata <- BostonHousing[, c(1:14)]
mod <- lm(medv ~ crim + zn + indus + chas + nox + rm + age + dis + rad + tax + ptratio + b + lstat, data = newdata)
step <- stepAIC(mod, direction = 'both')

mod2 <- lm(medv ~ crim + zn + chas + nox + rm + dis + rad + tax + ptratio + b + lstat, data = newdata)
summary(mod2)

# 2
pred <- -0.108413 * crim + 0.045845 * zn + 2.718716 * chas - 17.376023 * nox + 3.801579 * rm - 1.492711 * dis + 0.299608 * rad - 0.011778 * tax - 0.946525 * ptratio + 0.009291 * b - 0.522553 * lstat + 36.341145

-0.108413 * 0.00632 + 0.045845 * 18 + 2.718716 * 0 - 17.376023 * 0.538 + 3.801579 * 6.575 - 1.492711 * 4.09 + 0.299608 * 1 - 0.011778 * 296 - 0.946525 * 15.3 + 0.009291 * 396.9 - 0.522553 * 4.98 + 36.341145
