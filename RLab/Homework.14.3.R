require('class')

# 1
wdbc <- read.csv('wdbc.data.csv', header = TRUE)

x <- wdbc[, -1]

# prepare train / test data
tr.idx <- c(1:284*2-1)
ds.tr <- x[tr.idx, 2:31]
ds.ts <- x[-tr.idx, 2:31]
cl.tr <- factor(x[tr.idx, 1])
cl.ts <- factor(x[-tr.idx, 1])

# 2 K = 3  93.7%
pred <- knn(ds.tr, ds.ts, cl.tr, k = 3, prob = TRUE)
acc <- mean(pred == cl.ts)

table(pred, cl.ts)

# 2 K = 5  94.4%
pred <- knn(ds.tr, ds.ts, cl.tr, k = 5, prob = TRUE)
acc <- mean(pred == cl.ts)

table(pred, cl.ts)

# 2 K = 7  94%
pred <- knn(ds.tr, ds.ts, cl.tr, k = 7, prob = TRUE)
acc <- mean(pred == cl.ts)

table(pred, cl.ts)
