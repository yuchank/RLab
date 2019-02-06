boxplot(Temp ~ Month, data = airquality,
        col = 'orange',
        ylim = c(55, 95),
        ylab = "Temp",
        xlab = 'Month Number',
        main = 'Different boxplots for each month')

boxplot(Wind ~ Month, data = airquality,
        col = 'yellow',
        ylim = c(2, 22),
        ylab = "Wind",
        xlab = 'Month Number',
        main = 'Different boxplots for each month')

boxplot(Ozone ~ Month, data = airquality,
        col = 'gray',
        ylim = c(0, 170),
        ylab = "Ozone",
        xlab = 'Month Number',
        main = 'Different boxplots for each month')
