library(ggplot2)
library(ggmap)
library(gridExtra)

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

# time
# preprocessing: convert char to integer columns
toint <- apply(subway2[, 5:24], 2, FUN = as.integer)
subway2[, 5:24] <- toint
subway.int = subway2
# remove NA rows
nrow(subway.int)
subway.int <- subway.int[complete.cases(subway.int),]
nrow(subway.int)

toint2 <- apply(subway2[, 26:45], 2, FUN = as.integer)
subway2[, 26:45] <- toint2
subway.int = subway2
# remove NA rows
nrow(subway.int)
subway.int <- subway.int[complete.cases(subway.int),]
nrow(subway.int)

#
chunho <- subset(subway.int, stat_name == 'ÃµÈ£')
ave.on <- colMeans(chunho[, 5:24])
avg.on <- round(avg.on, 0)
avg.off <- colMeans(chunho[, 26:45])
avg.off <- round(avg.off, 0)
plt1 <- ggplot(data.frame(on_time = 5:24, no_on = avg.on), aes(x = on_time, y = no_on, color = 'red')) + geom_line(size = 1) + xlab('½Ã°£´ë') + ylab('ÃµÈ£¿ª Æò±ÕÅ¾½Â°´¼ö') + theme(legend.position = 'none')
plt2 <- ggplot(data.frame(off_time = 26:45, no_off = avg.off), aes(x = off_time, y = no_off, color = 'blue')) + geom_line(size = 1) + xlab('½Ã°£´ë') + ylab('ÃµÈ£¿ª Æò±ÕÇÏÂ÷°´¼ö') + theme(legend.position = 'none')
grid.arrange(plt1, plt2, ncol = 2)