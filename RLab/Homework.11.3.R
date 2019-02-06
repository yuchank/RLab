st <- data.frame(state.x77)

# 1
st[order(st$Population),]

# 2
st[order(st$Income, decreasing = TRUE), ]

# 3
st2 <- subset(st[order(st$Illiteracy),], select = c(Illiteracy))
st2 <- subset(st[order(st$Illiteracy),])
subset(st2[1:10,], select = c(Illiteracy))