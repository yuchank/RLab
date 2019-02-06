st <- data.frame(state.x77)

boxplot(st$Population)  #
boxplot(st$Income)      #
boxplot(st$Illiteracy)
boxplot(st$Life.Exp)
boxplot(st$Murder)
boxplot(st$HS.Grad)
boxplot(st$Frost)
boxplot(st$Area)        #

st$Population[st$Population %in% boxplot.stats(st$Population)$out] <- NA
st$Income[st$Income %in% boxplot.stats(st$Income)$out] <- NA
st$Area[st$Area %in% boxplot.stats(st$Area)$out] <- NA
st2 <- st[complete.cases(st),]

boxplot(st2$Population) #
boxplot(st2$Income) #
boxplot(st2$Illiteracy)
boxplot(st2$Life.Exp)
boxplot(st2$Murder)
boxplot(st2$HS.Grad)
boxplot(st2$Frost)
boxplot(st2$Area) #