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