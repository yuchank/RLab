library(lubridate)

x <- read.csv('subway.csv', header = TRUE, sep = ",", encoding = "UTF-8")
y <- read.csv('subway_latlong.csv', header = TRUE)

date <- as.character(x$income_date)
x$income_date <- paste(substr(date, 1, 4), "-", substr(date, 5, 6), "-", substr(date, 7, 8), sep = '')

# 1
subway.tot <- merge(x, y, by.x = c('X.U.FEFF.station'), by.y = c('STATION_CD')) # intersection

# 2
agg <- aggregate(subset(subway.tot, select = c('on_tot', 'off_tot')), by = list(subway.tot$stat_name, subway.tot$income_date), FUN = mean)

# 3
agg <- aggregate(subset(subway.tot, year(income_date) == '2011', select = c('on_tot', 'off_tot')), by = list(subway.tot$stat_name), FUN = sum)

# 4
agg <- aggregate(subset(subway.tot, year(income_date) == '2011', select = c('on_tot', 'off_tot')), by = list(subway.tot$LINE_NUM), FUN = sum)
