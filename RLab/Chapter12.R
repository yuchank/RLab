library(ggplot2)
library(ggmap)

Sys.setlocale("LC_ALL", "English")
# Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")

subway <- read.csv('subway.csv', header = TRUE, stringsAsFactors = FALSE, encoding = "UTF-8")

head(subway)
str(subway)

# change date format
class(subway[, 'income_date']) <- 'character'
subway[, 'income_date'] <- as.Date(subway[, 'income_date'], format = '%Y%m%d')
unique(format(subway[, 'income_date'], '%Y'))

# drop 2014
idx <- format(subway[, 'income_date'], '%Y') == '2014'
unique(format(subway[idx, 'income_date'], '%m'))
subway2 <- subset(subway, subset = format(income_date, '%Y') != '2014')

# purge () from station name
sort(unique(subway[, 'stat_name']))
idx <- grep('\\(', subway2$stat_name)
unique(subway2$stat_name[idx])
subway2$stat_name[idx] = substr(subway2$stat_name[idx], 1, nchar(subway2$stat_name[idx]) - 3)

# make year, month column
year <- format(subway2$income_date, '%Y')
month <- format(subway2$income_date, '%m')
subway2 <- cbind(subway2, year, month)
head(subway2)

subname <- read.csv('subway_latlong.csv', header = TRUE, stringsAsFactors = FALSE, encoding = "UTF-8")

#
tot <- aggregate(subway2[, 'on_tot'], by = list(stat_name = subway2$stat_name), FUN = sum)
cc <- merge(x = tot, y = subname, by.x = 'stat_name', by.y = 'STATION_NM')
df2 <- data.frame(stat_name = cc$stat_name, line_num = cc$LINE_NUM, on_tot = cc$x)
df2 <- df2[with(df2, order(line_num)),]
df2 <- df2[order(df2$line_num),]
df2$stat_name <- factor(df2$stat_name, levels = df2$stat_name)

plt <- ggplot(df2, aes(x = stat_name, y = on_tot, fill = line_num, order = line_num))
plt + theme_bw() + geom_bar(stat = 'identity', colour = 'white') + scale_x_discrete('ÁöÇÏÃ¶¿ª', labels = NULL) + ylab('Å¾½Â°´¼ö') + scale_fill_discrete(name = c('³ë¼±'))

# top 10 stations
df3 <- df2[order(-df2$on_tot),] # decreasing
df3 <- df3[1:10,]
df3$stat_name <- factor(df3$stat_name, levels = df3$stat_name)

lim <- c(0, max(df3$on_tot))
plt <- ggplot(df3, aes(stat_name, y = on_tot, fill = line_num))
plt + geom_bar(stat = 'identity', colour = 'white') + xlab('»óÀ§ 10°³ ÁöÇÏÃ¶¿ª') + scale_y_continuous('Å¾½Â°´¼ö', lim = lim) + scale_fill_discrete(name = c("³ë¼±"))

# bottom 10 stations
df4 <- df2[order(df2$on_tot),] # increasing
df4 <- df4[1:10,]
df4$stat_name <- factor(df4$stat_name, levels = df4$stat_name)

lim <- c(0, max(df4$on_tot))
plt <- ggplot(df4, aes(stat_name, y = on_tot, fill = line_num))
plt + geom_bar(stat = 'identity', colour = 'white') + xlab('ÇÏÀ§ 10°³ ÁöÇÏÃ¶¿ª') + scale_y_continuous('Å¾½Â°´¼ö', lim = lim) + scale_fill_discrete(name = c("³ë¼±"))

# top 10, year 2013
ten.station <- df3$stat_name
year.2013 <- subset(subway2, subset = stat_name %in% ten.station & year == '2013', select = c('stat_name', 'on_tot', 'month'))

# per month, per station
stat_top10_2013 <- aggregate(year.2013$on_tot, by = list(month = year.2013$month, stat_name = year.2013$stat_name), FUN = sum)
names(stat_top10_2013)[3] = 'on_tot'

plt <- ggplot(stat_top10_2013, aes(x = month, y = on_tot, colour = stat_name, group = stat_name))
plt <- plt + theme_classic() + geom_line() + geom_point(size = 6, shape = 19, alpha = 0.5)
plt + scale_x_discrete('2013³â', labels = paste0(unique(as.numeric(month)), '¿ù')) + ylab('¿ùº° Å¾½Â°´¼ö') + scale_colour_discrete(name = c('ÁöÇÏÃ¶¿ª'))

# line
subway3 <- merge(subway2, subname, by.x = 'stat_name', by.y = 'STATION_NM')
line <- aggregate(subway3[, 'on_tot'], by = list(LINE_NUM = subway3$LINE_NUM, stat_name = subway3$stat_name), FUN = sum, na.rm = TRUE)
names(line)[3] = 'on_tot'

# avg each line
line2 <- aggregate(line[, 'on_tot'], by = list(LINE_NUM = line$LINE_NUM), FUN = mean, na.rm = TRUE)
names(line2)[2] = 'on_tot'
head(line2)

col <- c('red', 'springgreen2', 'orange', 'blue', 'purple', 'brown', 'khaki', 'deeppink', 'yellow', 'deepskyblue')
pie(line2$on_tot, labels = paste0(unique(line2$LINE_NUM), 'È£¼±'), col = col, border = 'lightgray', main = '³ë¼±º° Æò±Õ ÁöÇÏÃ¶ Å¾½Â°´ ¼ö')

# area chart
yearmonth <- paste(subway3$year, subway3$month, '01', sep = '-')
yearmonth <- as.Date(yearmonth)
subway4 <- cbind(subway3, yearmonth)

subway4$LINE_NUM <- paste0(subway4$LINE_NUM, 'È£¼±')

lineyearmonth <- aggregate(subway4[, 'on_tot'], by = list(LINE_NUM = subway4$LINE_NUM, yearmonth = subway4$yearmonth), FUN = sum, na.rm = TRUE)
names(lineyearmonth)[3] = 'on_tot'

plt <- ggplot(lineyearmonth, aes(x = yearmonth, y = on_tot, fill = LINE_NUM))
plt <- plt + geom_area(colour = 'white', size = 0.2)
plt <- plt + scale_fill_manual(name = '³ë¼±', values = col)
plt + theme_classic() + xlab('¿¬µµ') + ylab('´©Àû½Â°´¼ö')

# time
# preprocessing: convert char to integer columns
toint <- apply(subway2[, 5:24], 2, FUN = as.integer)
subway2[, 5:24] <- toint
subway.int = subway2
# remove NA rows
nrow(subway.int)
subway.int <- subway.int[complete.cases(subway.int),]
nrow(subway.int)

avg.on <- colMeans(subway.int[, 5:24])
avg.on <- round(avg.on, 0)
ggplot(data.frame(on_time = 5:24, no_on = avg.on), aes(x = on_time, y = no_on, color = 'red')) + geom_line(size = 2) + xlab('½Ã°£´ë') + ylab('¿ª´ç Æò±ÕÅ¾½Â°´¼ö') + theme(legend.position = 'none')

#
seok <- subset(subway.int, stat_name == '¼®ÃÌ')
ave.on <- colMeans(seok[, 5:24])
avg.on <- round(avg.on, 0)
ggplot(data.frame(on_time = 5:24, no_on = avg.on), aes(x = on_time, y = no_on, color = 'red')) + geom_line(size = 2) + xlab('½Ã°£´ë') + ylab('¼®ÃÌ¿ª Æò±ÕÅ¾½Â°´¼ö') + theme(legend.position = 'none')

#
library(reshape2)
sub.merge <- merge(x = subway.int, y = subname, by.x = 'stat_name', by.y = 'STATION_NM')
subway.agg <- aggregate(sub.merge[, 5:24], by = list(line_num = sub.merge$LINE_NUM), FUN = mean)

melted <- melt(subway.agg, value.name = 'cnt')
names(melted)[2] <- 'time.zone'
head(subway.agg)
head(melted)

plt <- ggplot(melted, aes(x = time.zone, y = cnt, colour = line_num, group = line_num))
plt <- plt + theme_classic() + geom_line() + geom_point(size = 6, shape = 19, alpha = 0.5)
plt + scale_x_discrete('Å¾½Â½Ã°£´ë', labels = as.character(5:24)) + ylab('Æò±Õ Å¾½Â°´¼ö') + scale_colour_discrete(name = c('È£¼±'))

# draw map
library(ggmap)
register_google(key = "")
data <- subset(subway3, income_date == '2012-05-08', select = c('XPOINT_WGS', 'YPOINT_WGS', 'on_tot', 'stat_name', 'LINE_NUM'))
map_seoul <- get_map(location = c(lon = 126.97, lat = 37.55), zoom = 11, maptype = 'roadmap')
mm <- ggmap(map_seoul)
mm2 <- mm + geom_point(aes(x = YPOINT_WGS, y = XPOINT_WGS, size = on_tot, colour = as.factor(LINE_NUM)), data = data)
mm2 + scale_size_area(name = c('Å¾½Â°´¼ö')) + scale_colour_discrete(name = c('³ë¼±')) + labs(x = '°æµµ', y = 'À§µµ')

stat_top10_2013 <- subset(subway2, subset = year == '2013' & stat_name %in% ten.station)
data2 <- aggregate(stat_top10_2013[, 'on_tot'], by = list(stat_name = stat_top10_2013$stat_name), FUN = sum)
names(data2)[2] = 'on_tot'
data2 <- merge(data2, subname, by.x = 'stat_name', by.y = 'STATION_NM')
map_seoul <- get_map(location = c(lon = 126.97, lat = 37.55), zoom = 11, maptype = 'roadmap')
mm <- ggmap(map_seoul)
mm3 <- mm + geom_point(aes(x = YPOINT_WGS, y = XPOINT_WGS, size = on_tot), alpha = 0.6, colour = 'blue', data = data2)
mm3 + scale_size_area(name = c('Å¾½Â°´¼ö'), max_size = 15) + geom_text(aes(x = YPOINT_WGS, y = XPOINT_WGS, label = stat_name), colour = 'red', vjust = 3, size = 3.5, fontface = 'bold', data = data2) + labs(x = '°æµµ', y = 'À§µµ')