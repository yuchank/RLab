require(graphics)

# create a 2-dimensional example
x <- rbind(matrix(rnorm(100, sd = 0.3), ncol = 2), matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2))
colnames(x) <- c('x', 'y')
cl <- kmeans(x, 2)

plot(x, col = cl$cluster) # color: cluster
points(cl$centers, col = 1:2, pch = 8, cex = 2)

# random starts to help here with too many clusters
cl <- kmeans(x, 5, nstart = 25)
plot(x, col = cl$cluster)
points(cl$centers, col = 1:5, pch = 8)


require('class')

# prepare train / test data
tr.idx <- c(1:25, 51:75, 101:125)
ds.tr <- iris[tr.idx, 1:4]
ds.ts <- iris[-tr.idx, 1:4]
cl.tr <- factor(iris[tr.idx, 5])
cl.ts <- factor(iris[-tr.idx, 5])

pred <- knn(ds.tr, ds.ts, cl.tr, k = 3, prob = TRUE)
acc <- mean(pred == cl.ts)

table(pred, cl.ts)