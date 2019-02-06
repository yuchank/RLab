electorate <- read.csv('국회의원_선거구_유권자_수.csv')
head(electorate)
treemap(electorate,
        index = c('시도', '선거구명'),
        vSize = '선거인.수', # size of tiles
        vColor = '선거인.수',
        type = 'value',
        bg.labels = 'yellow')

electorate.a <- aggregate(electorate[,5], by = list(electorate$`시도`), sum)
treemap(electorate.a,
        index = c('Group.1'),
        vSize = 'x', # size of tiles
        vColor = 'x',
        type = 'value',
        bg.labels = 'yellow')