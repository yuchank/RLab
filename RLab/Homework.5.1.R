speed <- cars$speed
dist <- cars$dist

plot(speed, dist, pch = 19)
# Braking distance increases exponentially at higher speeds.

temperature_ <- pressure$temperature
pressure_ <- pressure$pressure
plot(temperature_, pressure_, pch = 19)
# Pressure increases exponentially at higher temperature.

vars <- c('Population', 'Income', 'Illiteracy', 'Area')
target <- state.x77[, vars]
pairs(target)

iris.2 <- iris[, 1:2]
point <- as.numeric(iris$Species)
color <- c('red', 'green', 'blue')
plot(iris.2, main = 'Iris plot', pch = c(point), col = color[point])