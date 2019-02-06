st <- data.frame(state.x77)

st

colnames(st)

rownames(st)

dim(st)

str(st)

rowSums(st)
rowMeans(st)

colSums(st)
colMeans(st)

st['Florida',]

st[, 'Income']

st['Texas', 'Area']

st['Ohio', c('Population', 'Income')]

subset(st, Population >= 5000)

subset(st[,c('Population', 'Income', 'Area')], Population >= 4500)

nrow(subset(st, Income >= 4500))

subset(st, Area >= 10000 & Frost >= 120)

subset(st, Area >= 10000 & Frost >= 120)

colMeans(subset(st, Illiteracy >= 2.0)['Income'])

colMeans(subset(st, Illiteracy < 2.0)['Income']) - colMeans(subset(st, Illiteracy >= 2.0)['Income'])

subset(st, Life.Exp == max(st[, c('Life.Exp')]))['Life.Exp']

subset(st, Income > st['Pennsylvania', 'Income'])
