set.seed(123)
rm(list = ls())

#--------------------------------#
#       13-1주차 모범 답안       #
#--------------------------------#

# (1) state.x77 데이터셋에서 문맹률(Illiteracy)을 가지고 살인범죄율(Murder) 을 예측하는 회귀 모델을 만드시오.
st <- data.frame(state.x77)
str(st)

md <- lm(formula = Murder ~ Illiteracy, data = trn)
summary(md)

# 회귀식 도출
# Murder  = 2.786 + 3.863*Illiteracy



# (2) 회귀 모델을 이용하여 문맹률이 0.5, 1.0, 1.5 일때 살인범죄율을 예측하여 보시오. 

Illiteracy = c(0.5, 1.0, 1.5)

for (i in 1:length(x)) {
  Murder  = 2.786 + 3.863*Illiteracy
  cat('Illiteracy =', Illiteracy[i], '|', 'Murder =', Murder[i], '\n')
}




#------------------------------#
#       13-2주차 모범 답안     #
#------------------------------#

# (1) mlbench 패키지의 BostonHousing 데이터셋은 보스턴 지역의 지역정보 및 평균주택 가격 (medv) 정보를 담고 있다. 
# 다른 변수들을 이용하여 medv 를 예측하는 모델을 만드시오. (medv 를 예측하는데 도움이 되는 변수들만 사용할 것)

library(mlbench)
data(BostonHousing)
ds <- BostonHousing
str(ds)
md <- lm(formula = medv ~ ., data = ds)
summary(md)


## summary(md)의 coefficients란의 별표 기준으로 변수 선택 ( *표시가 없는 변수 제거)
md2 <- lm(formula = medv ~. -indus -age, data = ds )
summary(md2)




## MASS패키지의 stepAIC() 함수를 이용한 변수 선택 
library(MASS)


## forward
forward <- stepAIC(md, direction = 'forward')

## backward
backward <- stepAIC(md, direction = 'backward')

## both
both <- stepAIC(md, direction = 'both')
## direction = 'both' 결과를 중심으로 변수 선택: age, indus 선택 제외



md2 <- lm(formula = medv ~. -indus -age, data = ds )
summary(md2)



# (2) 만들어진 모델로 부터 임의의 데이터에 대한 medv 값을 예측하여 보시오.

## 임의값을 각 열의 평균값으로 계산 
ds$chas <- as.numeric(ds$chas)
rd <- colMeans(ds)

ds <- rbind(ds, rd)
ds$chas[507] <- 1 # chas의 type = factor
ds$chas <- as.factor(ds$chas)

pred2 <- predict(md2, ds[507,])
pred2 # 임의의 데이터에 대한 md2의 예측값 = 25.06347


#-------------------------------#
#      13-3주차 모범 답안       #
#-------------------------------#

 
# (1) ucla_admit.csv 의 데이터셋으로 부터 gre, gpa, rank 를 가지고 
# 합격여부 (admit) 를 예측하는 로지스틱 모델을 만드시오. (0: 불합격, 1:합격)

ds <- read.csv('admit.csv')
idx <- sample(1:nrow(ds), round(.7*nrow(ds)))
trn <- ds[idx, ]
tst <- ds[-idx, ]

md <- glm(admit ~ ., data = trn)
summary(md)

# (2) 만들어진 모델에 대해 ucla_admit.csv 의 데이터를 넣어 합격여부를 예측하고 실제값과 예측값을 보이시오.
pred <- round(predict(md, tst[,-1]))
compare <- cbind(pred, tst$admit, abs(pred - tst$admit))
compare

# (3) 만들어진 모델의 예측 정확도를 보이시오.
acc = mean(pred == tst$admit)
acc





