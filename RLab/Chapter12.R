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
