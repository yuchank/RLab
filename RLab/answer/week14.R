rm(list = ls())
set.seed(123)

#-------------------------------#
#      14-2주차 모범 답안       #
#-------------------------------#

# (1) iris 데이터셋에 대해 kmeans 클러스터링을 하고 결과를 그래프로 보이시오.
# iris 데이터셋에서 품종(Species) 컬럼은 제외하시오.
# 클러스터 수는 3 으로 하시오.

iris_x <- iris[,-5]
iris_cl <- iris[,5]

iris_kmc <- kmeans(iris_x, 3)
str(iris)

table(iris_cl, iris_kmc$cluster)

plot(iris_x, iris_kmc$cluster, col = iris_kmc$cluster)

plot(iris_x$Sepal.Width, iris_x$Petal.Length, col = iris_kmc$cluster)
points(iris_kmc$centers[, "Sepal.Width"],iris_kmc$centers[, "Petal.Length"], pch = "+", col = 1:3 )

plot(iris_x$Sepal.Length, iris_x$Petal.Width, col = iris_kmc$cluster)
points(iris_kmc$centers[, "Sepal.Length"], iris_kmc$centers[, "Petal.Width"], pch = 3, col = 1:3)


# (2) state.x77 데이터셋에 대해 kmeans 클러스터링을 하고 결과를 그래프로 보이시오.
# 클러스터 수는 5로 하시오.
# state.x77 은 각 컬럼의 값들의 단위가 많이 차이가 나기 때문에 다음과 같이 하여 이를 적절히 맞추어줄 필요가 있음.

new.data <- scale(state.x77)
new.data <- as.data.frame(new.data)
result <- kmeans(new.data, 5)


plot(new.data$Income , new.data$Murder, col = result$cluster)
points(result$centers[,"Income"], result$centers[,"Murder"], pch = 3, col = 1:5)

plot(new.data$Area , new.data$`Life Exp`, col = result$cluster)
points(result$centers[,"Area"], result$centers[,"Life Exp"], pch = 3, col = 1:5)

plot(new.data$Population , new.data$`Life Exp`, col = result$cluster)
points(result$centers[,"Population"], result$centers[,"Life Exp"], pch = 3, col = 1:5)




#-------------------------------#
#      14-3주차 모범 답안       #
#-------------------------------#

# 다음의 데이터셋을 이용하여 KNN 알고리즘을 테스트하시오.
# Target dataset : Breast Cancer Wisconsin (Diagnostic) Data Set

# (1) wdbc.csv 파일에 저장후 프로그램에서 읽어들인다.
# 첫번째 컬럼 : instance ID (삭제한다)
# 두번째 컬럼 : class 정보  (M,B)

wdbc <- read.csv("wdbc.data.csv", stringsAsFactors = F, fileEncoding = "UTF-8")
library(class)
ds <- wdbc[,-1]
str(ds)

cl <- as.factor(ds$M)
ds.sclae <- scale(ds[,-1])
head(ds.sclae)

# (2) 홀수번째 instance는 training data 로, 짝수번째 instance는 test data 로 이용한다.
# K = 3,5,7 로 하여 accuracy 를 비교한다.

idx <- as.integer(rownames(ds[1:ncol(ds) %% 2 != 0,] ))
trn_x <- ds.sclae[idx, ]
trn_cl <- cl[idx]
tst_x <- ds.sclae[-idx, ]
tst_cl <- cl[-idx]



md.knn <- knn(train = trn_x, test = tst_x, cl = trn_cl, k = 3)
acc = mean(md.knn == tst_cl)
acc


accs <- c()
k = c(3,5,7)

for (i in 1:length(k)) {
  md.knn <- knn(train = trn_x, test = tst_x, cl = trn_cl, k = k[i])
  acc = mean(md.knn == tst_cl)
  
  accs <- c(accs, acc)
  cat('k=', i, '|', 'accuracy=', acc, '\n')
}



#-------------------------------#
#      14-4주차 모범 답안       #
#-------------------------------#

# mlbench 패키지에 포함된 유방암 데이터셋() 에 대하여 KNN 으로 예측 정확도를 알아보되 
# 10-fold cross validation 으로 하시오. 
library(class)
library(mlbench)
data("BreastCancer")
ds <- BreastCancer

sum(is.na(ds))
ds <- ds[complete.cases(ds),-1]
sum(is.na(ds))
str(ds)

benign <- ds[ds$Class == 'benign', ]
dim(benign)
malignant <- ds[ds$Class == 'malignant', ]
dim(malignant)

ds.new <- rbind(benign, malignant)
str(ds.new)



grp1 <- cut(seq(1,444), breaks = 10, labels = F)
grp2 <- cut(seq(445,683), breaks = 10, labels = F)
fld <- c(grp1, grp2)
str(fld)

accs = c()
for (i in 1:10) {
  ds.tr <- ds.new[fld != i, 1:9]
  ds.ts <- ds.new[fld == i, 1:9]
  cl.tr <- factor(ds.new[fld != i, 10])
  cl.ts <- factor(ds.new[fld == i, 10])
  
  md <- knn(ds.tr, ds.ts, cl.tr, k = 5)
  acc = mean(md == cl.ts)
  accs = c(accs, acc)
  res = mean(accs)
  
}
res




