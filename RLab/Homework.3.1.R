m <- c(10, 40, 60, 20)
f <- c(21, 60, 70, 30)
score <- cbind(m, f)

colnames(score) <- c("male", "female")

score[2,]

score[, "female"]

score[3, 2]