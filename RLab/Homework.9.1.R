install.packages("devtools")
library(devtools)
install_github("dkahle/ggmap", ref = "tidyup")
# install_github("dkahle/ggmap", ref = "tidyup", force = T)     # 위의 코드로 설치가 실행이 안될 경우 
library("ggmap")

register_google(key = "")

names <- c("용두암", "성산일출봉", "정방폭포",
           "중문관광단지", "한라산1100고지", "차귀도")

addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동홍동  299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동  산1-2",
          "제주시 한경면 고산리 125")

gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name = names,
                 lon = gc$lon,
                 lat = gc$lat)


cen <- c(mean(df$lon), mean(df$lat))

map <- get_googlemap(center = cen,
                     maptype = "roadma",
                     zoom = 10,
                     size = c(480, 480),
                     markers = gc)

ggmap(map)