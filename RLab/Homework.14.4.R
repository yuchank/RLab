# k-fold cross validation
require('class')

library(mlbench)

data(BreastCancer)
head(BreastCancer)

table(BreastCancer$Class)

nrow(BreastCancer) # 699
BreastCancer <- BreastCancer[complete.cases(BreastCancer),]
nrow(BreastCancer) # 683

benign <- subset(BreastCancer, Class == 'benign')
nrow(benign) # 444
malignant <- subset(BreastCancer, Class == 'malignant')
nrow(malignant) # 239

BreastCancer.new <- rbind(benign, malignant)

# get fold no. for each rows: 10-fold cross validation
# 440
group.1 <- cut(seq(1, 440), breaks = 10, labels = FALSE)
# 230
group.2 <- cut(seq(441, 670), breaks = 10, labels = FALSE)

fold <- c(group.1, group.2)

acc <- c() # accuracy for each fold
for (i in 1:10) {
  ds.tr <- BreastCancer.new[fold != i, 2:10]
  ds.ts <- BreastCancer.new[fold == i, 2:10]
  cl.tr <- factor(BreastCancer.new[fold != i, 11])
  cl.ts <- factor(BreastCancer.new[fold == i, 11])
  pred <- knn(ds.tr, ds.ts, cl.tr, k = 3)
  acc[i] <- mean(pred == cl.ts)
}
acc
mean(acc)
# 97.1%