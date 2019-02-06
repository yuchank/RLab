st <- data.frame(state.x77)

# 1
split(st, state.region)

# 2
subset(st, Area > st['Alabama', 'Area'] & Area < st['California', 'Area'], select = c(Income, Area))

# 3
idx <- sample(nrow(iris), 40, replace = FALSE)
iris.40 <- iris[idx, ]
iris.110 <- iris[-idx,]
iris.40
iris.110

# 4
combn(unique(iris$Species), 2)