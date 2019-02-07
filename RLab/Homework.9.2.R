library(ggmap)
library(ggplot2)

register_google(key = "")

# 1
names <- c('辆肺备没', '吝备没', '侩魂备没', '己悼备没', '堡柳备没', '悼措巩备没', '吝尔备没', '己合备没',
           '碍合备没', '辑措巩备没', '畴盔备没', '篮乞备没', '档豪备没', '付器备没', '剧玫备没', '碍辑备没', '备肺备没',
           '陛玫备没', '康殿器备没', '悼累备没', '包厩备没', '辑檬备没', '碍巢备没', '价颇备没', '碍悼备没')
addr <- c('辆肺备没', '吝备没', '侩魂备没', '己悼备没', '堡柳备没', '悼措巩备没', '吝尔备没', '己合备没',
           '碍合备没', '辑措巩备没', '畴盔备没', '篮乞备没', '档豪备没', '付器备没', '剧玫备没', '碍辑备没', '备肺备没',
           '陛玫备没', '康殿器备没', '悼累备没', '包厩备没', '辑檬备没', '碍巢备没', '价颇备没', '碍悼备没')
gc <- geocode(enc2utf8(addr))
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen, maptype = 'roadmap', zoom = 10, size = c(640, 640), marker = gc)
ggmap(map)
# print names
gmap <- ggmap(map)
gmap + geom_text(data = df, aes(x = lon, y = lat), size = 5, label = df$name)

# 2
names <- c('何魂堡开矫', '措备堡开矫', '牢玫堡开矫', '堡林堡开矫', '措傈堡开矫', '匡魂堡开矫')
addr <- c('何魂堡开矫', '措备堡开矫', '牢玫堡开矫', '堡林堡开矫', '措傈堡开矫', '匡魂堡开矫')
gc <- geocode(enc2utf8(addr))
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen, maptype = 'roadmap', zoom = 7, size = c(640, 640), marker = gc)
ggmap(map)
# print names
gmap <- ggmap(map)
gmap + geom_text(data = df, aes(x = lon, y = lat), size = 5, label = df$name)