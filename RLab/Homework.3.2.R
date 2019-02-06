id <- c(10, 20, 30, 40, 50)
name <- c('John', 'Tom', 'Paul', 'Jane', 'Grace')
score <- c(95, 46, 98, 74, 85)

df <- data.frame(id, name, score)

df$score == df[, 3]
df$score == df[, 'score']

df[, c('id', 'score')]

df[2:3,]

df[2,3]