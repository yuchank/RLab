library(ggplot2)

ggplot(data = data.frame(state.x77), aes(x = Income, y = Illiteracy)) + geom_point()

ggplot(data.frame(table(mtcars$gear)), aes(x = Var1, y = Freq)) + geom_bar(stat = 'identity', width = 0.7, fill = 'steelblue')

am <- as.numeric(airmiles)
ggplot(data.frame(am), aes(x = 1937:1960, y = am)) + geom_line(color = 'red', size = 1)

ggplot() + geom_boxplot(data = iris, aes(x = Species, y = Petal.Width, fill = Species))