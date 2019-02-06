myiris <- list(Group = iris['Species'], Data = subset(iris, select = -Species))
myiris$Group
myiris$Data

weekdays <- factor(c('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'))
weekdays

as.numeric(weekdays)