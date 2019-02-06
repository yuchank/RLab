income <- c(125000, 100000, 40000, 35000, 41000, 29000, 35000, 24000, 50000, 60000)
education <- c(19, 20, 16, 16, 18, 12, 14, 12, 16, 17)

tbl <- data.frame(cbind(income, education))
plot(income ~ education, data = tbl)

res = lm(income ~ education, data = tbl) # linear regression
abline(res) # draw a line
cor(income, education)

gpa <- c(3.1, 2.4, 2.0, 3.8, 2.2, 3.4, 2.9, 3.2, 2.7, 2.5)
tv <- c(14, 10, 20, 7, 25, 9, 15, 13, 4, 21)

tbl2 <- data.frame(cbind(gpa, tv))
plot(gpa ~ tv, data = tbl2)

res2 = lm(gpa ~ tv, data = tbl2) # linear regression
abline(res2) # draw a line
cor(gpa, tv)