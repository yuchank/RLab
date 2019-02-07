library(treemap)
library(ggmap)
library(ggplot2)

data('GNI2014')
head(GNI2014)

register_google(key = "")

# 1
names <- c(GNI2014$country)
addr <- c(GNI2014$country)
gc <- geocode(enc2utf8(addr))

df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))

gc <- data.frame(lon = df$long, lat = df$lat)
map <- get_googlemap(center = cen, maptype = 'roadmap', zoom = 1)
ggmap(map) + theme(axis.title.x = element_blank(),
                   axis.text.x = element_blank(),
                   axis.ticks.x = element_blank(),
                   axis.title.y = element_blank(),
                   axis.text.y = element_blank(),
                   axis.ticks.y = element_blank())
gmap <- ggmap(map)
gmap + geom_point(data = df, aes(x = gc$lon, y = gc$lat, size = GNI2014$population), alpha = 0.5)