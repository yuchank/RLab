library(treemap)
data(GNI2014)
str(GNI2014)

treemap(GNI2014,
        index = c('continent', 'iso3'),
        vSize = 'population', # size of tiles
        vColor = 'GNI',
        type = 'value',
        bg.labels = 'yellow')

GNI2014$GNI.total <- GNI2014$population * GNI2014$GNI

GNI2014.a <- aggregate(GNI2014[,4:6], by = list(GNI2014$continent), sum)
GNI2014.a$GNI.percap <- GNI2014.a$GNI.total / GNI2014.a$population
treemap(GNI2014.a,
        index = c('Group.1'),
        vSize = 'population', # size of tiles
        vColor = 'GNI.percap',
        type = 'value',
        bg.labels = 'yellow')

library(MASS)
head(UScrime)
radius <- sqrt(UScrime$Pop)
symbols(UScrime$U2, UScrime$y,  # x, y
        circles = radius,
        inches = 0.4,
        fg = 'white',
        bg = 'lightgray',
        lwd = 1.5,
        xlab = 'unemployment 35-39 males',
        ylab = 'crime data',
        main = 'UScrime Data')
text(UScrime$U2, UScrime$y,
     1:nrow(UScrime),
     cex = 0.8,
     col = 'brown')

ds <- read.csv('seoul_temp_2017.csv')
head(ds)
summary(ds$avg_temp)

boxplot(ds$avg_temp,
        col = 'yellow',
        ylim = c(-20, 40),
        xlab = '서울1년기온',
        ylab = "기온")

month.avg <- aggregate(ds$avg_temp, by = list(ds$month), median)[2]
odr <- rank(-month.avg)
boxplot(avg_temp~month, data = ds,
        col = heat.colors(12)[odr],
        ylim = c(-20, 40),
        ylab = "기온",
        xlab = '월',
        main = '서울 월별기온분포(2017)')