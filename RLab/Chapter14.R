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

# k-fold cross validation
require('class')

# get fold no. for each rows: 5-fold cross validation
group.1 <- cut(seq(1, 50), breaks = 5, labels = FALSE)
group.2 <- cut(seq(51, 100), breaks = 5, labels = FALSE)
group.3 <- cut(seq(101, 150), breaks = 5, labels = FALSE)
fold <- c(group.1, group.2, group.3)

acc <- c() # accuracy for each fold
for (i in 1:5) {
  ds.tr <- iris[fold != i, 1:4]
  ds.ts <- iris[fold == i, 1:4]
  cl.tr <- factor(iris[fold != i, 5])
  cl.ts <- factor(iris[fold == i, 5])
  pred <- knn(ds.tr, ds.ts, cl.tr, k = 3)
  acc[i] <- mean(pred == cl.ts)
}
acc
mean(acc)