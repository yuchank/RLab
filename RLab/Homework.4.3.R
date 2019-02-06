score <- c(90, 85, 73, 80, 85, 65, 78, 50, 68, 96)
names(score) <- c('KOR', 'ENG', 'MATH', 'HIST', 'SOC', 'MUSIC', 'BIO', 'EARTH', 'PHY', 'ART')

score

mean(score)

median(score)

sd(score)

max(score)

score[score == max(score)]

boxplot(score)

hist(score, main = "Hong's score", col = 'purple', breaks = 5)

mean(mtcars$wt)
median(mtcars$wt)
mean(mtcars$wt, trim = 0.15)

summary(mtcars$wt)

table(mtcars$cyl)

barplot(table(mtcars$cyl))

par(mfrow = c(1, 3))
hist(mtcars$wt)
barplot(mtcars$cyl)
barplot(mtcars$gear)

par(mfrow = c(1, 1))
boxplot(mtcars$wt)
# mean value 3.2xx
# Q1, Q2, Q3 values
# 2 outliers 

boxplot(mtcars$disp)
# mean value 19x.xxx
# Q1, Q2, Q3 values
# no outliers 