library("ggmap")

# 1
register_google(key = "")
names <- c("서울시청")
addr <- c("서울특별시 중구 세종대로 110")
gc <- geocode(enc2utf8(addr))
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen, maptype = "roadmap", zoom = 10, size = c(800, 800), markers = gc)
ggmap(map)

# 2
names <- c("금강산")
addr <- c("금강산")
gc <- geocode(enc2utf8(addr))
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen, maptype = "hybrid", zoom = 10, size = c(640, 640), markers = gc)
ggmap(map)

# 3
cen <- c(103.867881, 1.331017)
map <- get_googlemap(center = cen, maptype = "roadmap", zoom = 9, size = c(640, 640), markers = gc)
ggmap(map)