require(graphics)

# 1
x <- iris[, 1:4]
cl <- kmeans(x, 3)

plot(x, col = cl$cluster) # color: cluster

# 2
new.data <- scale(state.x77)
df <- data.frame(new.data)

# random starts to help here with too many clusters
cl <- kmeans(df, 5, nstart = 25)
plot(df, col = cl$cluster)
