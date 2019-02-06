library(MASS)

radius <- sqrt(UScrime$Pop)


st <- data.frame(state.x77)
head(st)
symbols(st$Income, st$Illiteracy, # x, y
        circles = st$Population,
        inches = 0.6,
        fg = 'white',
        bg = 'green',
        lwd = 1.5,
        xlab = 'Income',
        ylab = 'Illiteracy',
        main = 'US State Data')
text(st$Income, st$Illiteracy,
     rownames(st),
     cex = 0.8,
     col = 'black')