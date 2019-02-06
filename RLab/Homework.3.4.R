st <- data.frame(state.x77)
write.csv(subset(st, Income >= 5000), 'rich_state.csv')

ds <- read.csv('rich_state.csv', T)
ds