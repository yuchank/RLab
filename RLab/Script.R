# matrix
z <- matrix(1:20, nrow = 4, ncol = 5, byrow = T)

# vector
x <- 1:4
y <- 5:8

m1 <- cbind(x, y)
m2 <- rbind(x, y)
m3 <- rbind(m2, x)
m4 <- cbind(m1, x)

rownames(z) <- c("row1", "row2", "row3", "row4")
colnames(z) <- c("col1", "col2", "col3", "col4", "col5")

Q <- iris["Species"]
is.data.frame(Q)
is.matrix(Q)
class(iris)
class(state.x77)
iris$Species

dim(iris)
nrow(iris)
ncol(iris)
names(iris) # column names
head(iris) # returns the first or last parts of a vector
tail(iris)

str(iris)
unique(iris[, 5])
table(iris[, "Species"]) # instance count

colSums(iris[, -5])
colMeans(iris[, -5])
rowSums(iris[, -5])
rowMeans(iris[, -5])

# transpose
t(iris)

IR.1 <- subset(iris, Species == 'setosa')
IR.2 <- subset(iris, Sepal.Length > 5.0 & Sepal.Width > 4.0)

a <- matrix(1:20, 4, 5)
b <- matrix(21:40, 4, 5)
# element-wise
a + b
b - a
b / a
a * b
3 * a
b - 5
2 * a + 3 * b
# matrix
a %*% t(b)

iris.m <- as.matrix(iris[, 1:4])
head(iris.m)
class(iris.m)

st <- data.frame(state.x77)
head(st)
class(st)

setwd(getwd())
asset <- read.csv('asset-v1.csv', header = TRUE, encoding = "UTF-8")
write.csv(asset, "result.csv", row.names = F, quote = F)
choose <- read.csv(file.choose(), header = TRUE)

x <- c("12", "34", "56")
write.csv(x, "result.csv", row.names = F, quote = F)

member <- list(name = 'kim', address = 'pusan', tel = '010-1234-5678', age = 20, married = FALSE)
member[[1]]
member$name

blood.vec <- c('A', 'A', 'AB', 'O', 'B')
blood.type <- factor(c('A', 'A', 'AB', 'O', 'B'))
is.factor(blood.type)
blood.type[6] <- 'D'
levels(blood.type)
levels(blood.type)[2]
as.numeric(blood.type)

library(ggplot2)
scatter <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
scatter + geom_point(aes(color = Species, shape = Species)) + xlab('Sepal Length') + ylab('Sepal Width') + ggtitle('Sepal Length-Width')

View(iris)

ans = c('Y', 'Y', 'N', 'Y', 'Y')
table(ans)
table(ans) / length(ans)
table(iris$Species)

favorite.color <- c('red', 'green', 'yellow', 'red', 'green', 'red', 'red')
sum <- table(favorite.color)
par(mfrow = c(1, 1))
barplot(sum, main = 'Favorite color')
pie(sum, main = 'Favorite color')

head(mtcars)
carb <- mtcars[, 'carb']
table(carb)
par(mfrow = c(1, 3))
barplot(table(mtcars$carb), main = 'Barplot of Carburetors', xlab = '#of carburetors', ylab = 'frequency', col = 'blue')
barplot(table(mtcars$cyl), main = 'Barplot of Cylinders', xlab = '#of cylinders', ylab = 'frequency', col = 'red')
barplot(table(mtcars$gear), main = 'Barplot of Gears', xlab = '#of gears', ylab = 'frequency', col = 'green')

mydata = c(50, 60, 100, 75, 200)
mydata.big = c(mydata, 50000)
mean(mydata)
mean(mydata.big)
median(mydata)
median(mydata.big)
mean(mydata, trim = 0.2)
mean(mydata.big, trim = 0.2)
quantile(mydata)
quantile(mydata, (0:10) / 10)
summary(mydata)
fivenum(mydata)

boxplot(iris$Petal.Width, ylab = "Petal.Width")
boxplot(Petal.Width ~ Species, data = iris, ylab = "Petal.Width")

st.income <- state.x77[, 'Income']
hist(st.income, main = 'Histogram for Income', xlab = 'income', ylab = 'frequency', border = 'blue', col = 'green', las = 2, breaks = 5)

score <- c(40, 55, 90, 75, 59, 60, 63, 65, 69, 71)
stem(score, scale = 2)

paste('Good', 'Morning', 'Tom', sep = ' ')
paste('Good', 'Morning', 'Tom', sep = '/')
paste(1:10, 'is good', sep = ' ')

str <- 'Good Morning'
substr(str, 1, 4)
substr(str, 6, nchar(str))

gsub('Good', 'nice', str)
str <- gsub(' ', '/', str)

wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt, mpg, main = 'Car Weight-mpg', xlab = 'Car Weight', ylab = 'Miles Per Gallon', col = 'red', pch = 19)

vars <- c('mpg', 'disp', 'drat', 'wt')
target <- mtcars[, vars]
pairs(target, main = 'multi plots')

iris.2 <- iris[, 3:4]
point <- as.numeric(iris$Species)
color <- c('red', 'green', 'blue')
plot(iris.2, main = 'Iris plot', pch = c(point), col = color[point])

beers <- c(5, 2, 9, 8, 3, 7, 3, 5, 3, 5)
bal <- c(0.1, 0.03, 0.19, 0.12, 0.04, 0.0095, 0.07, 0.06, 0.02, 0.05)
tbl = data.frame(cbind(beers, bal))
plot(bal ~ beers, data = tbl)
# plot(tbl)
# plot(tbl[, 1], tbl[, 2])

res = lm(bal~beers, data = tbl) # linear regression
abline(res) # draw a line
cor(beers, bal)

cor(iris[, 1:4])

month <- 1:12
late1 <- c(5, 8, 7, 9, 4, 6, 12, 13, 8, 6, 6, 4)
late2 <- c(4, 6, 5, 8, 7, 8, 10, 11, 6, 5, 7, 3)
# plot(month, late1, main = 'Late students', type = 'l', lty = 1, lwd = 1, xlab = 'Month', ylab = 'Late cnt')
plot(month, late1, main = 'Late students', type = 'b', lty = 1, lwd = 1, col = 'red', xlab = 'Month', ylab = 'Late cnt', ylim = c(2, 14))
# plot(month, late1, main = 'Late students', type = 's', lty = 1, lwd = 1, xlab = 'Month', ylab = 'Late cnt')
# plot(month, late1, main = 'Late students', type = 'o', lty = 1, lwd = 1, xlab = 'Month', ylab = 'Late cnt')
# plot(month, late1, main = 'Late students', type = 'h', lty = 1, lwd = 1, xlab = 'Month', ylab = 'Late cnt')
# plot(month, late1, main = 'Late students', type = 'S', lty = 1, lwd = 1, xlab = 'Month', ylab = 'Late cnt')
lines(month, late2, type = 'b', col = 'blue')

for (i in 1:10) {
  cat('2 *', i, '=', 2 * i, '\n')
}

subset(iris, Sepal.Length >= 5.0 & Sepal.Length <= 6.0)[, 1:2]

idx <- c()
for (i in 1:nrow(iris)) {
  if (iris[i, 'Sepal.Length'] >= 5.0 & iris[i, 'Sepal.Length'] <= 6.0) {
    idx <- c(idx, i)
  }
}
print(idx)
iris[idx, c('Sepal.Length', 'Sepal.Width')]

ls()

library(KoNLP)
useNIADic()

mymax <- function(x, y = 10) {
  return (ifelse(x >= y, x, y))
}
mymax(12, 10)

myfunc <- function(x, y) {
  return (list(sum = x + y, mul = x * y))
}

res <- myfunc(5, 8)
res$sum
res$mul

source('printF.R')
printF()

for (i in 1:4) {
  mean(iris[, i])
}

apply(iris[, 1:4], 2, mean)
apply(iris[, 1:4], 1, mean)
lapply(iris[, 1:4], mean)

abc <- list(mtcars[, 1], mtcars[, 2], mtcars[, 3], mtcars[, 4])
lapply(abc, mean)
lapply(abc, mean)[[1]]

sapply(iris[, 1:4], mean) # vector
sapply(iris[, 1:4], mean, simplify = F) # list

myminmax <- function(x) {
  return (max(x) - min(x))
}
sapply(iris[, 1:4], myminmax)

num <- round(runif(1) * 100, digits = 0)
guess <- -1
cat('Guess a number between 0 and 100.\n')

while (guess != num) {
  guess <- readline(prompt = "Guess number: ")  # character type
  guess <- as.integer(guess)
  if (guess == num) {
    cat("Conguraturations,", num, "is right.\n")
  } 
  else if (guess < num) {
    cat("It's smaller!\n")
  }
  else if (guess > num) {
    cat("It's bigger!\n")
  }
}

sd    # view source
apply

# save file
sink('test.txt', append = T)
for (i in 1:100) {
  print(i)
}
sink()

seq(1, 5, by = 2)
rep(1:5, times = 3)
rep(1:5, each = 3)

fruits <- c('Apple', 'Grape', 'Pear', 'Mango')
sort(fruits)
fruits[1:2]
fruits[-1]
fruits[-1:-3]
fruits[fruits == 'Apple']
fruits[fruits %in% c('Apple', 'Kiwi')]

hello <- c('hello', 'world')
paste(hello, collapse = ',')
hello_paste <- paste(hello, collapse = ' ')
str_split <- strsplit(hello_paste, split = ' ') # list
class(str_split)
str_split[[1]][1]
str_paste <- paste(str_split[[1]], collapse = ' ')
toupper(str_paste)
tolower(str_paste)

nchar('data')
nchar(hello)

? c
help.search('split')
help(package = 'stringr')

obj1 <- c('a', 'b', 'c')
obj2 <- c('d', 'e', 'f')
list1 <- list(obj1, obj2)
paragraph <- paste(list1[[1]], list1[[2]], collapse = ' ')
class(paragraph)  # character vector
para_list <- strsplit(paragraph, split = ' ')
class(para_list) # list
para_vector <- unlist(para_list) # character vector

library(stringr)

str1 <- c('I', 'am', 'a', 'student')
str2 <- paste(str1, collapse = ' ')

length(str1)
nchar(str1)
str_length(str1)
str_length(str1)[1:4]
str1[str_length(str1) > 3][1:20]

strsplit(str2, split = ' ')
str_split(str2, pattern = ' ')

str_c(str1, collapse = ' ')

str_detect(str1, 'a')
which(str_detect(str1, 'a'))

str_view(str1, 'a')
str_view_all(str1, 'a')

str_trim(str2)
str_which(str2, 't')
grep('t', str2)

# stringr summary
str_r1 <- c('This', 'is', 'an', 'apple')
str_r2 <- c('This is an apple')
str_r3 <- c(' This is an apple ')

str_length(str_r1) # 4 2 2 5
str_split(str_r2, ' ')  # 'This' 'is' 'an' 'apple'
str_c(str_r1, collapse = ' ') # 'This is an apple'
str_detect(str_r1, 'a') # FALSE FALSE TRUE TRUE
str_detect(str_r2, 'a') # TRUE
str_view(str_r1, 'a')
str_view_all(str_r2, 'a')
str_trim(str_r3) # 'This is an apple'
str_which(str_r1, 's')  # 1 2
str_which(str_r1, 'a')  # 3 4
str_extract(str_r1, 'a')  # NA NA 'a' 'a'
str_extract_all(str_r2, 'a')  # return list: 'a' 'a'  
str_replace(str_r1, 'a', 'z') # 'This' 'is' 'zn' 'zpple'
str_replace_all(str_r2, 'a', 'z') # 'This is zn zpple'

library(RColorBrewer)
library(wordcloud)
library(pdftools)
library(stringr)

bts_text <- pdf_text('BTS_(band).pdf') # return character vector of 'pages'
bts_text <- tolower(bts_text) # return character vector

unlist(str_extract_all(bts_text[1], pattern = ' ')) # return list length:1696
bts_text_token <- unlist(str_split(bts_text[1], ' ')) # return list. words including ' '
# bts_text_token[bts_text_token > 0]
bts_sent_trim <- bts_text_token[str_length(bts_text_token) > 0] # words

unlist(str_extract_all(bts_text[1], pattern = ' the ')) # return list. 48
unlist(str_extract_all(bts_text[1], pattern = '2016')) # return list. 6

# RegEx
unique(unlist(str_extract_all(bts_sent_trim, 't.e'))) # 'the' 'tte' 'tle'

dot_words <- c('e.g', 'eng', 'e g', 'e-g')
unlist(str_extract_all(dot_words, 'e.g')) # 'e.g' 'eng' 'e g' 'e-g'
unlist(str_extract_all(dot_words, 'e\\.g')) # 'e.g'

# [abc] character set
fns <- c('fan', 'fen', 'fin', 'fon', 'fun')
fnx <- c('fan', 'fen', 'fun', 'f0n', 'f.n', 'f1n', 'fain')
unlist(str_extract_all(fns, 'f[aeiou]n'))
unlist(str_extract_all(fnx, 'f[aeiou]n'))
unlist(str_extract_all(fnx, 'f\\.n'))
unlist(str_extract_all(fnx, 'f[.]n'))

# {} + $ ^ {,}
triplets <- c('bts', 'the', 'BTS', 'The', '010', '070', ':~)', '^^;')
unlist(str_extract_all(triplets, '[a-z][a-z][a-z]')) # 'bts' 'the'
unlist(str_extract_all(triplets, '[A-Z]{3}')) # 'BTS'
unlist(str_extract_all(triplets, '[A-Z][a-z]+')) # 'The'
unlist(str_extract_all(triplets, '[0-9]+$')) # '010' '070'
unlist(str_extract_all(triplets, '[^a-zA-Z0-9]{1,}')) # ':~)' '^^;' , min time match, until max time
unlist(str_extract_all(triplets, '[a-zA-Z0-9^]+')) # 

# character class
ch_cls <- c('ABab12! _')
unlist(str_extract_all(ch_cls, '\\d')) # '1' '2'  number
unlist(str_extract_all(ch_cls, '[0-9]')) # '1' '2'
unlist(str_extract_all(ch_cls, '\\D')) # 'A' 'B' 'a' 'b' '!' ' ' '_' not number
unlist(str_extract_all(ch_cls, '[^0-9]')) # 'A' 'B' 'a' 'b' '!' ' ' '_'
unlist(str_extract_all(ch_cls, '\\w')) # 'A' 'B' 'a' 'b' '1' '2' '_' alphabet, number and _
unlist(str_extract_all(ch_cls, '[a-zA-z0-9_]')) # 'A' 'B' 'a' 'b' '1' '2' '_'
unlist(str_extract_all(ch_cls, '\\W')) # '!' ' ' not (alphabet, number and _)
unlist(str_extract_all(ch_cls, '[^a-zA-z0-9_]')) # '!' ' '
unlist(str_extract_all(ch_cls, '\\s')) # ' ' space
unlist(str_extract_all(ch_cls, '[ \t]')) # ' ' tab
unlist(str_extract_all(ch_cls, '[ \r]')) # ' ' carrage return
unlist(str_extract_all(ch_cls, '[ \n]')) # ' ' line(Mac)
unlist(str_extract_all(ch_cls, '[ \r\n]')) # ' ' line(Windows)
unlist(str_extract_all(ch_cls, '[ \v]')) # ' ' vertical tab
unlist(str_extract_all(ch_cls, '[ \f]')) # ' ' page
unlist(str_extract_all(ch_cls, '[ \f\n\r\t\v]')) # ' '
unlist(str_extract_all(ch_cls, '\\S')) # 'A' 'B' 'a' 'b' '1' '2' '!' '_' not space
unlist(str_extract_all(ch_cls, '[^ \f\n\r\t\v]')) # 'A' 'B' 'a' 'b' '1' '2' '!' '_'

ch_cls2 <- c('12345')
unlist(str_extract_all(ch_cls2, '\\d{3}')) # '123'

unlist(str_extract_all(triplets, '\\D+')) # not number
unlist(str_extract_all(triplets, '\\w+')) # word
unlist(str_extract_all(triplets, '\\W+')) # not word
unlist(str_extract_all(triplets, '\\s+')) # space
unlist(str_extract_all(triplets, '\\S+')) # not space

# POSIX
unlist(str_extract_all(ch_cls, '[[:alnum:]]')) # 'A' 'B' 'a' 'b' '1' '2'
unlist(str_extract_all(ch_cls, '[a-zA-Z0-9]')) # 'A' 'B' 'a' 'b' '1' '2'
unlist(str_extract_all(ch_cls, '[[:alpha:]]')) # 'A' 'B' 'a' 'b'
unlist(str_extract_all(ch_cls, '[a-zA-Z]')) # 'A' 'B' 'a' 'b'
unlist(str_extract_all(ch_cls, '[[:lower:]]')) # 'a' 'b'
unlist(str_extract_all(ch_cls, '[a-z]')) # 'A' 'B' 'a' 'b'
unlist(str_extract_all(ch_cls, '[[:upper:]]')) # 'A' 'B'
unlist(str_extract_all(ch_cls, '[A-Z]')) # 'A' 'B'
unlist(str_extract_all(ch_cls, '[[:word:]]')) # 'A' 'B' 'a' 'b' '1' '2' '_'
unlist(str_extract_all(ch_cls, '[a-zA-Z0-9_]')) # 'A' 'B' 'a' 'b' '1' '2' '_'
unlist(str_extract_all(ch_cls, '[[:blank:]]')) # ' ' space tab
unlist(str_extract_all(ch_cls, '[ \t]')) # ' '
unlist(str_extract_all(ch_cls, '[[:space:]]')) # ' ' all space case
unlist(str_extract_all(ch_cls, '[ \f\n\r\t\v]')) # ' '
unlist(str_extract_all(ch_cls, '[[:punct:]]')) # '!' '_' puctuation(.), symbol including underscore, not including ~ ^
unlist(str_extract_all(ch_cls, '[[:graph:]]')) # printable not including blank
unlist(str_extract_all(ch_cls, '[[:alnum:][:punct:]]')) # equals to graph
unlist(str_extract_all(ch_cls, '[[:print:]]')) # printable including blan
unlist(str_extract_all(ch_cls, '[[:alnum:][:punct:][:space:]]')) # equals to print
unlist(str_extract_all(ch_cls, '[[:ascii:]]')) # ASCII

unlist(str_extract_all(triplets, '[[:lower:]]+')) # 'bts' 'the' 'he'
unlist(str_extract_all(triplets, '[[:alpha:]]+')) # 'bts' 'the' 'BTS' 'The'
unlist(str_extract_all(triplets, '[[:digit:]]{1,3}')) # '010' '070'
unlist(str_extract_all(triplets, '[[:punct:]~^]+')) # ':~)' '^^;'
unlist(str_extract_all(triplets, '[[:lower:][:punct:]]')) # 'b' 't' 's' 't' 'h' 'e' 'h' 'e' ':' ')' ';'

# remove blank
str_trim(ch_cls)
str_replace_all(ch_cls, '\\s+', '')
str_replace_all(ch_cls, '[[:space:]]', '')
str_replace_all(ch_cls, '[^[:word:][:punct:]~^]', '')
str_replace_all(triplets, '[^[:word:][:punct:]~^]', '')

smile <- c('^^;;')
unlist(str_extract_all(smile, '[^^;;]')) # null
unlist(str_extract_all(smile, '[;^]{4}')) # 
unlist(str_extract_all(smile, '[^\\w\\d\\s]{4}')) # 
unlist(str_extract_all(smile, '[[:punct:]^]{4}')) # 
unlist(str_extract_all(smile, '[\\^\\^\\;\\;]{4}')) # 

today <- c('Today is April 26th in 2018!')
unlist(str_extract_all(today, '[^[:punct:][:space:]]+')) # 'Today' 'is' 'April' ' 26th' 'in' '2018'
unlist(str_extract_all(today, '[[:word:]]{1,}')) # 'Today' 'is' 'April' ' 26th' 'in' '2018'
unlist(str_extract_all(today, '[[:alpha:]]{5}')) # 'Today' 'April'
unlist(str_extract_all(today, '[[:upper:]]+[[:alpha:]]+')) # 'Today' 'April'
unlist(str_extract_all(today, '[[:digit:]]+[[:alpha:]]+')) # '26th'

colors <- c('yellow', 'green')
colors[c(1, 2)]
unique(colors)[c(1, 2)]
colors[which(str_detect(colors, 'green'))]

library(readr)
library(stringr)

# bts_exam <- str_c(read_lines('bts_exam.txt'))
# bts_exam_vec <- paste(bts_exam, collapse = ' ')
# sum(str_length(bts_exam_vec))
# sum(str_length(bts_exam)) + length(bts_exam) - 1 # windows
# sum(str_length(bts_exam)) # unix
# sum(nchar(bts_exam)) # unix

bts_exam <- str_c(read_lines('bts_exam.txt'), collapse = ' ')

sum(str_length(bts_exam)) # unix
sum(nchar(bts_exam)) # unix
str_count(bts_exam, '')

# location
str_locate_all(bts_exam, 'BTS')

# 4 digits
length(unlist(str_extract_all(bts_exam, '\\w{10,}')))
length(unlist(str_extract_all(bts_exam, '\\d{4}')))

# exclude alphabet
unlist(str_extract_all(bts_exam, '[[:digit:]]+[[:punct:]]+')) # 
unlist(str_extract_all(bts_exam, '[[:digit:]]+[[:punct:]]{1,}')) # 
unlist(str_extract_all(bts_exam, '\\d+[^\\w\\s]+')) # 
unlist(str_extract_all(bts_exam, '\\d+[[:punct:]]+')) # 

str_count(bts_exam, '[[:punct:]~^]+') # 

# bts #2 token
library(RColorBrewer)
library(wordcloud)
library(pdftools)
library(stringr)

bts_text <- pdf_text('BTS_(band).pdf') # return character vector of 'pages'

# method 1
bts_text <- tolower(bts_text) # return character vector
bts_string <- str_c(bts_text, collapse = ' ') # long line
str_locate_all(bts_string, 'references')
bts_trunc <- str_trunc(bts_string, 45745, side = 'right') # truncate 'references'

# method 2
bts_string_line <- unlist(str_split(bts_string, '\r\n'))  # Windows
str_which(bts_string_line, 'References')  # 102 462 ...
bts_trunc <- str_c(bts_string_line[1:461], collapse = ' ') # long line

bts_nospace <- str_replace_all(bts_trunc, '[[:space:]]{1,}', ' ') # reduce space to 1
bts_eng <- str_replace_all(bts_nospace, '[^[:ascii:]]+', ' ') # only ascii
bts_eng_lower <- tolower(bts_eng)

unlist(str_extract_all(bts_eng_lower, '[[:graph:]]*[[:punct:]]{1,}[[:graph:]]+')) # * means more than 0 times
bts_noapos <- str_replace_all(bts_eng_lower, "\\'s", ' ') # 's ' '
bts_noapos <- str_replace_all(bts_eng_lower, "['][sS] ", ' ')
bts_usa <- str_replace_all(bts_noapos, 'u\\.s\\.', 'usa') # u.s. usa
bts_rnb <- str_replace_all(bts_usa, 'r\\&b', 'rnb') # r&b rnb

unlist(str_extract_all(bts_rnb, '\\[\\d+\\]|\\(\\d+\\)')) # numbers
unlist(str_extract_all(bts_rnb, '\\[[[:digit:]]+\\]|\\([[:digit:]]+\\)')) # numbers
bts_notice <- str_replace_all(bts_rnb, '\\[[[:digit:]]+\\]|\\([[:digit:]]+\\)', '')

bts_punct <- str_replace_all(bts_rnb, '[[:punct:]~^]+', '')
bts_digit <- str_replace_all(bts_rnb, '[[:digit:]]+', '')

bts_nospace <- str_replace_all(bts_notice, '[[:space:]]{1,}', ' ') # reduce space to 1
bts_tidy_word <- unlist(str_split(bts_nospace, ' '))
bts_tidy_word_freq <- sort(table(bts_tidy_word), decreasing = TRUE)
bts_tidy_word_freq[1:10]

# dplyr package: pipe operator
bts_tidy_word <- str_c(bts_text, collapse = ' ') %>% # long line
  str_trunc(45745, side = 'right') %>%  # remove reference
  str_replace_all('[[:space:]]{1,}', ' ') %>% # remove space
  str_replace_all('[^[:ascii:]]+', ' ') %>% # ascii only
  tolower() %>%
  str_replace_all("['][sS] ", ' ') %>%  # 's 'S
  str_replace_all('u\\.s\\.', 'usa') %>%  # u.s.
  str_replace_all('r\\&b', 'rnb') %>% # r&b
  str_replace_all('\\[[[:digit:]]+\\]|\\([[:digit:]]+\\)', '') %>%  #[2018] or (2018)
  str_replace_all('[[:punct:]~^]+', '') %>% # symbols
  str_replace_all('[[:digit:]]+', '') %>% # numbers
  str_replace_all('[[:space:]]{1,}', ' ') %>% # space
  str_split(' ') %>%
  unlist()
bts_tidy_word_freq <- bts_tidy_word %>% table() %>% sort(decreasing = TRUE)
bts_tidy_word_freq[1:10]

library(RColorBrewer)
library(wordcloud)
library(NLP)
library(tm)

stopwords('en') # 174
stopwords('SMART') # 571

bts_words_nostop <- bts_tidy_word[!bts_tidy_word %in% stopwords('SMART')]
bts_tidy_word_freq <- sort(table(bts_words_nostop), decreasing = TRUE)[1:50]

pal <- brewer.pal(8, 'Dark2')
set.seed(405)
wordcloud(words = names(bts_tidy_word_freq),
          freq = bts_tidy_word_freq,
          min.freq = 5, # at least 5
          max.words = 500,  # 500 words
          random.order = FALSE,
          rot.per = 0.1,  # plot
          scale = c(4, 0.3),  # words size 
          colors = pal) # color of word

# developer.twitter.com/en/apps or apps.twitter.com 
# create a developer account

# rtweet callback URL: http://127.0.0.1:1410
# 18000 tweets per 15 minutes.
library(httpuv)
library(rtweet)
library(dplyr)
library(stringr)

# authenticate via web browser
token <- create_token(app = 'Coo Mining', consumer_key = 'vMvc7ArLMVBvyCMDGGf4qwgy9', consumer_secret = 'TOFEHjuCWorN7zM9zVRqDXw349XkXBYCctvL5WiRcgfvroJpPn')
bts_rtweet <- search_tweets('#BTS', n = 5000, include_rts = FALSE, lang = 'en', geocode = lookup_coords('usa')) # hashtag #BTS
save(bts_rtweet, file = 'bts_rtweet.Rdata')

# from file
load('bts_rtweet.RData')
head(bts_rtweet)
names(bts_rtweet)

class(bts_rtweet$user_id) # character
class(bts_rtweet$text) # character
bts_rtweet$text[1:10]
bts_text <- bts_rtweet %>% select(status_id, created_at, text) # select column 
dim(bts_text)
bts_text_unique <- bts_text %>% filter(!duplicated(text)) # filter row
dim(bts_text_unique)

# tidytext
library(tidytext)

bts_text_unique %>% arrange(created_at) %>% unnest_tokens(word, text, token = 'words') %>% slice(11:30)
bts_text_unique %>% arrange(created_at) %>% unnest_tokens(word, text, token = 'regex', pattern = ' ') %>% slice(11:30)  # includes \n 
unnest_token <- '[^[:word:]#@]' # remove all but word, #@
bts_text_unique %>% arrange(created_at) %>% unnest_tokens(word, text, token = 'regex', pattern = '[^[:word:]#@]') %>% slice(11:30)
bts_word_count <- bts_text_unique %>% arrange(created_at) %>% unnest_tokens(word, text, token = 'regex', pattern = unnest_token) %>% count(word, sort = TRUE)
bts_word_count[1:10,]
bts_word_count[41:50,]
remove_regex <- 'https?://[[:word:]./]+|www.\\.[[:word:]./]+|&amp;|&lt;|&gt;|&quot;'  # remove URL. ? means it may exist or not
bts_text_unique %>% mutate(text = str_replace_all(text, remove_regex, ''))
bts_text_unique %>% mutate(text = str_replace_all(text, '[#@]?[^[:ascii:]]', '')) # remove non-ascii including hashtag and twitter handle

bts_tidy <- bts_text_unique %>% mutate(text = str_replace_all(text, remove_regex, '')) %>% # remove URL
  mutate(text = str_replace_all(text, '[#@]?[^[:ascii:]]', '')) %>% # remove non-ascii
  unnest_tokens(word, text, token = 'regex', pattern = unnest_token) %>% # remove all but word, #@
  filter(!word %in% stop_words$word) # filter row, equals to anti_join(stop_words)
bts_tidy_count <- bts_tidy %>% count(word, sort = TRUE)

save(bts_tidy, file = 'bts_tidy.RData')

pal <- brewer.pal(8, 'Dark2')
set.seed(816)
wordcloud(words = bts_tidy_count$word,
          freq = bts_tidy_count$n,
          max.words = 200, # 200 words
          random.order = FALSE,
          rot.per = 0.1, # plot
          scale = c(4, 0.4), # words size 
          colors = pal) # color of word

# dictionary of tidytext
# AFINN Bing Loughran NRC
library(dplyr)
library(tidytext)
library(ggplot2)

bing <- get_sentiments('bing') # 

text <- data_frame(word = c('holidays', 'make', 'me', 'happy', 'but', 'this', 'song', 'is', 'sad'))
lexicon <- data_frame(word = c('happy', 'sad', 'holiday', 'funeral'), sentiment = c('positive', 'negative', 'positive', 'negative'))
inner_join(text, lexicon) # joining by 'word'. intersection

bts_tidy %>% inner_join(bing) %>% count(sentiment, sort = TRUE)
bts_tidy %>% inner_join(bing) %>% group_by(sentiment) %>% count(word, sort = TRUE) %>% top_n(10) %>%
  ggplot(aes(reorder(word, n), n, fill = sentiment)) +
  geom_bar(stat = 'identity', show.legend = FALSE) +
  facet_wrap(~sentiment, scales = 'free_y') +
  labs(y = 'Contribution to sentiment', x = NULL) +
  coord_flip()

# sentiment visualization
# luburidate package: floor_date
# tidyr package: spread

library(dplyr)
library(lubridate)
library(ggplot2)
library(tidytext)
library(tidyr)

save(bts_text_unique, file = 'bts_text_unique.RData')
load('bts_text_unique.RData')
bts_text_unique %>%
  mutate(time_floor = floor_date(created_at, unit = 'hour')) %>%
  count(time_floor) %>%
  ggplot(aes(x = time_floor, y = n)) +
  geom_line() +
  labs(x = NULL, y = 'Hourly Sum', title = 'Tracing #BTS salience on Twitter', subtitle = 'Tweets (N=4,704) were aggreated in 1 hour intervals, Retweets were excluded.')

load('bts_tidy.RData')
bts_tidy %>%
  filter(!word %in% c('fake', 'love')) %>% # fake love
  inner_join(get_sentiments('bing')) %>%
  count(sentiment, word, sort = TRUE) %>%
  group_by(sentiment) %>%
  top_n(10) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_bar(stat = 'identity', show.legend = FALSE) +
  facet_wrap(~sentiment, scales = 'free_y') +
  coord_flip()

bts_tidy %>%
  filter(!word %in% c('fake', 'love')) %>%
  mutate(time_floor = floor_date(created_at, unit = 'hour')) %>%
  inner_join(get_sentiments('bing')) %>%
  count(time_floor, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative) %>%
  ggplot(aes(x = time_floor, y = sentiment)) +
  geom_col() +
  scale_x_datetime(breaks = '1 day', date_labels = '%B %d')
  
# rtweet callback URL: http://127.0.0.1:1410
# 18000 tweets per 15 minutes.
library(httpuv)
library(rtweet)
library(dplyr)
library(stringr)

# authenticate via web browser
token <- create_token(app = 'Coo Mining', consumer_key = '', consumer_secret = '')
# security_rtweet <- search_tweets('#Security', n = 5000, include_rts = FALSE, lang = 'ko', geocode = lookup_coords('kor')) # hashtag #Security
security_rtweet <- search_tweets('#Security', n = 5000, include_rts = FALSE, lang = 'ko') # hashtag #Security
save(security_rtweet, file = 'security_rtweet.Rdata')
load('security_rtweet.Rdata')

bts_text <- security_rtweet %>% select(status_id, created_at, text) # select column 
bts_text_unique <- bts_text %>% filter(!duplicated(text)) # filter row

# final exam
bts_tidy <- data_frame(text = bts) %>% unnest_tokens(word, text)
bts_tidy %>%
  filter(!word %in% stop_words$word) %>%
  count(word, sort = TRUE)

load('sg_rtweet_606.RData')

internet_regex <- "[#@]?[^[:ascii:]]+|[']s|(https?://)[[:word:]./]+|(www\\.)[[:word:]./]+|&amp;|&lt;|&gt;|&quot;"
unnest_regex <- '[^[:word:]#@]' 

sg_rtweet_tidy <- sg_rtweet %>%
  mutate(text = str_remove_all(text, internet_regex)) %>%
  select(text, created_at) %>%
  unnest_tokens(word, text, token = 'regex', pattern = unnest_regex) %>%
  anti_join(stop_words) %>%
  filter(!str_detect(word, '[#@]'))

count(sg_rtweet_tidy, word, sort = TRUE)

sg_rtweet_tidy %>%
  inner_join(get_sentiments('bing')) %>%
  count(sentiment, word, sort = TRUE) %>%
  group_by(sentiment) %>%
  top_n(5)

sg_rtweet_tidy_hours <- sg_rtweet_tidy %>%
  mutate(time_floor = floor_date(created_at, unit = "hour")) %>%
  inner_join(get_sentiments("bing")) %>%
  count(time_floor, sentiment) %>%
  group_by(sentiment) %>%
  summarise(sum = sum(n))

sg_rtweet_tidy_hours <- sg_rtweet_tidy %>%
  mutate(time_floor = floor_date(created_at, unit = "hour")) %>%
  inner_join(get_sentiments("bing")) %>%
  count(time_floor, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative) %>%
  ggplot(aes(x = time_floor, y = sentiment)) +
  geom_col() +
  scale_x_datetime(date_breaks = "1 day", date_labels = "%B/%d")

hospital <- read.csv('hospital.csv')
head(hospital)
table(hospital)
mosaicplot(~freq + stay, data = hospital, color = c('green', 'blue', 'red'), main = '병원내원빈도 vs 치료기간')

tbl <- table(hospital)
mosaicplot(tbl, color = TRUE, main = '병원내원빈도 vs 치료기간')

mosaicplot(Titanic, main = 'Survival on Titanic', color = c('red', 'green'), off = 1)

library(ggplot2)

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) + geom_point()
ggplot() + geom_point(data = iris, aes(x = Petal.Length, y = Petal.Width))
ggplot() + geom_point(data = iris, aes(x = Petal.Length, y = Petal.Width), color = 'red', size = 4)
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) + geom_point(aes(color = Species, shape = Species), alpha = 0.5, size = 2)

gp <- ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) + geom_point(aes(color = Species, shape = Species), alpha = 0.5, size = 2)
gp2 <- gp + ggtitle('IRIS data') + theme(plot.title = element_text(size = 14, face = 'bold', color = 'blue', hjust = 0.5))

ggplot(mtcars, aes(x = wt, y = mpg)) + geom_line(color = 'red', size = 1)

df = data.frame(table(mtcars$carb))
df
ggplot(df, aes(x = Var1, y = Freq)) + geom_bar(stat = 'identity', width = 0.7, fill = 'steelblue')

ggplot() + geom_boxplot(data = iris, aes(x = Species, y = Petal.Length, fill = Species))

library(ggmap)
gc <- geocode(enc2utf8('용인'))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen)
ggmap(map)

gc <- geocode(enc2utf8('설악산'))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen, zoom = 8, size = c(640, 480), maptype = 'hybrid')
ggmap(map)

cen <- c(-118.233248, 34.085015)  # LA
map <- get_googlemap(center = cen, zoom = 8, size = c(640, 480), maptype = 'hybrid')
ggmap(map)

# method 2
library(googleway)
mykey <- 'AIzaSyCmTXqqYR4T_1Gt1DLG5ndfUBt7zoJ_8SQ' # invalid for now
gc <- NULL
addr <- c(enc2utf8('용인'))
for (i in 1:length(addr)) {
  df <- google_geocode(addr[i], key = mykey)
  gc = rbind(gc, df$result$geometry$location)
}

library(OpenStreetMap)
library(rgdal)
map <- openmap(c(70, -179), c(-70, 179))
plot(map)

# marker
library(ggmap)
gc <- geocode(enc2utf8('용인'))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen, maptype = 'roadmap', marker = gc)
ggmap(map)

# marker
library(ggmap)
library(ggplot2)
names <- c('용두암', '성산일출봉', '정방폭포', '중문관광단지', '한라산1100고지', '차귀도')
addr <- c('제주시 용두암길 15',
          '서귀포시 성산읍 성산리',
          '서귀포시 동홍동 299-3',
          '서귀포시 중문동 2624-1',
          '서귀포시 색달동 산1-2',
          '제주시 한경면 고산리 125')
gc <- geocode(enc2utf8(addr))
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen, maptype = 'roadmap', zoom = 10, size = c(640, 480), marker = gc)
ggmap(map)
# print names
gmap <- ggmap(map)
gmap + geom_text(data = df, aes(x = lon, y = lat), size = 5, label = df$name)

head(quakes)

library(ggplot2)
library(ggmap)

df <- head(quakes, 100)
cen <- c(mean(df$long), mean(df$lat))
gc <- data.frame(lon = df$long, lat = df$lat)
gc$lon <- ifelse(gc$lon > 180, - (360 - gc$lon), gc$lon)
map <- get_googlemap(center = cen, maptype = 'roadmap', zoom = 4, markers = gc)
ggmap(map) + theme(axis.title.x = element_blank(),
                   axis.text.x = element_blank(),
                   axis.ticks.x = element_blank(),
                   axis.title.y = element_blank(),
                   axis.text.y = element_blank(),
                   axis.ticks.y = element_blank())

map <- get_googlemap(center = cen, maptype = 'roadmap', zoom = 5)
gmap <- ggmap(map)
gmap + geom_point(data = df, aes(x = long, y = lat, size = mag), alpha = 0.5)

library(RColorBrewer)
library(wordcloud)
library(KoNLP)

useSejongDic()
pal2 <- brewer.pal(8, 'Dark2')
text <- readLines(file.choose())
noun <- sapply(text, extractNoun, USE.NAMES = FALSE)

noun2 <- unlist(noun)
wordcount <- table(noun2)
sortword <- sort(wordcount, decreasing = TRUE)[1:10]
sortword <- sortword[-1]
barplot(sortword, las = 2, names.arg = names(sortword), col = 'lightblue', main = 'Most frequent words', ylab = 'Word frequencies')

# rot.per 90도 회전 표시 단어 빈도 수
wordcloud(names(wordcount), freq = wordcount, scale = c(6, 0.7), min.freq = 3, random.order = FALSE, rot.per = .1, colors = pal2)

mergeUserDic(data.frame(c('정치'), c('ncn')))
noun <- sapply(text, extractNoun, USE.NAMES = FALSE)
noun2 <- unlist(noun)
noun2 <- noun2[nchar(noun2) > 1] # one character
noun2 <- gsub('국민', '', noun2)  # remove '국민'
noun2 <- gsub('여러분', '', noun2)
wordcount <- table(noun2)
wordcloud(names(wordcount), freq = wordcount, scale = c(6, 0.7), min.freq = 3, random.order = FALSE, rot.per = .1, colors = pal2)

# Google API key
#https://cloud.google.com/billing/docs/how-to/manage-billing-account?hl=ko (구글 결제계정등록 관련)
remove.packages("ggmap")
remove.packages("tibble")
# 아래와 같은 error 메세지가 뜨는 경우, 해당 R 프로그램을 종료하고, 해당 라이브러리들이 저장되어 있는 파일에 가서 삭제 (ppt 3p 참고)
# 예시) Error: package or namespace load failed for ‘devtools’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]): ‘ggplot2’이라고 불리는 패키지가 없습니다
# 예시) Error: package or namespace load failed for ‘devtools’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]): ‘rlang’이라고 불리는 패키지가 없습니다
# 예시) Error: package or namespace load failed for ‘devtools’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):‘Rcpp’이라고 불리는 패키지가 없습니다
# 삭제 및 패키치 설치 후, ggmap 패키지 설치 재실행 
# 예시) install.packages("Rcpp") 
# 예시) install.packages("rlang")
# ggmap 패키지 설치 재실행 
# 최신 버전의 패키지로의 업데이트에 관해 묻는 메세지 창이 뜨면, 모두 업데이트 시키고 싶을 경우 all에 해당하는 번호를, 업데이트 시키지 않고자 할 경우 none에 해당하는 
# 번호를 콘솔창에 입력

install.packages("devtools")
library(devtools)
install_github("dkahle/ggmap", ref = "tidyup")
# install_github("dkahle/ggmap", ref = "tidyup", force = T)     # 위의 코드로 설치가 실행이 안될 경우 

library("ggplot2")
library("ggmap")

register_google(key = "")

names <- c("용두암", "성산일출봉", "정방폭포", "중문관광단지", "한라산1100고지", "차귀도")
addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동홍동  299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동  산1-2",
          "제주시 한경면 고산리 125")
gc <- geocode(enc2utf8(addr))
df <- data.frame(name = names,
                 lon = gc$lon,
                 lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 10,
                     size = c(480, 480),
                     markers = gc)
ggmap(map)

# missing value
x <- c(1, 2, 3, NA, 5, 8)
sum(x)
sum(x, na.rm = TRUE)
is.na(x)
sum(is.na(x))
x[is.na(x)] <- 0

x <- c(1, 2, 3, NA, 5, 8)
y <- as.vector(na.omit(x))

# 2-dimension NA
x <- iris
x[1, 2] <- NA
x[1, 3] <- NA
x[2, 3] <- NA
x[3, 4] <- NA
head(x)

col_na <- function(y) {
  return (sum(is.na(y)))
}
na_count <- sapply(x, FUN = col_na) # sapply: input each column
na_count

is.na(x)
rowSums(is.na(x))
sum(rowSums(is.na(x)) > 0)

head(x)
x[!complete.cases(x),]
y <- x[complete.cases(x),]
head(y)

library(mice)
md.pattern(x)

result <- mice(x, m = 5, maxit = 50, method = 'pmm', seed = 500)
impute_x <- complete(result, 2)
head(x)
head(impute_x)
head(iris)

# find outlier
st <- data.frame(state.x77)
boxplot(st$Income)
out.val <- boxplot.stats(st$Income)$out
st$Income[st$Income %in% out.val] <- NA
st$Income
new.data <- st[complete.cases(st), ]  # No NA


v1 <- c(1, 7, 6, 8, 4, 2, 3)
order(v1)
v1 <- sort(v1)
v1 <- sort(v1, decreasing = TRUE)


head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length), ]
iris[order(iris$Sepal.Length, decreasing = TRUE), ]
iris[order(iris$Species, iris$Sepal.Length),]


v3 <- c(1, 7, 2, 5)
order(v3)
rank(v3)


sp <- split(iris, iris$Species) # list
summary(sp)
class(sp)
sp$setosa

subset(iris, Species == 'setosa')
subset(iris, Sepal.Length > 5.1)
subset(iris, Sepal.Length > 5.1 & Sepal.Width > 3.9)
subset(iris, Sepal.Length > 5.1, select = c(Petal.Length, Petal.Width))

x <- c(3, 1, 7, 8, 5, 9, 4)
which(x > 5)
which(iris$Species == 'setosa') # return index
which.max(iris$Sepal.Length)    # return index
which.min(iris$Sepal.Width) # return index


# sampling
x <- 1:100
y <- sample(x, size = 10, replace = FALSE) # 

idx <- sample(nrow(iris), size = 50, replace = FALSE)
iris.50 <- iris[idx, ]
head(iris.50)

# combination
combn(5, 3)
x = c('red', 'green', 'blue', 'black', 'white')
com <- combn(x, 2)

for (i in 1:ncol(com)) {
  cat(com[, i], "\n")
}


# aggregate
agg <- aggregate(iris[, -5], by = list(iris$Species), FUN = mean)
agg <- aggregate(iris[, -5], by = list(iris$Species), FUN = sd)

head(mtcars)
agg <- aggregate(mtcars, by = list(mtcars$cyl, mtcars$vs), FUN = max)
agg <- aggregate(mtcars, by = list(cyl = mtcars$cyl, vs = mtcars$vs), FUN = max) # print group names 'cyl' 'vs'

# attach, detach
attach(mtcars)
agg <- aggregate(mtcars, by = list(cyl, vs), FUN = max)
detach(mtcars)

# merge
x <- data.frame(name = c('a', 'b', 'c'), math = c(90, 80, 40))
y <- data.frame(name = c('a', 'b', 'd'), korean = c(75, 60, 90))
merge(x, y, by = c('name')) # intersection
merge(x, y, all.x = T)
merge(x, y, all.y = T)
merge(x, y, all = T)
y <- data.frame(sname = c('a', 'b', 'd'), korean = c(75, 60, 90))
merge(x, y, by.x = c('name'), by.y = c('sname'))


# Google Geocoding API
install.packages("devtools")
library(devtools)
install_github("dkahle/ggmap", ref = "tidyup")
# install_github("dkahle/ggmap", ref = "tidyup", force = T)     # 위의 코드로 설치가 실행이 안될 경우 
library("ggmap")
register_google(key = "")
names <- c("용두암", "성산일출봉", "정방폭포",
           "중문관광단지", "한라산1100고지", "차귀도")
addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동홍동  299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동  산1-2",
          "제주시 한경면 고산리 125")
gc <- geocode(enc2utf8(addr))
gc
df <- data.frame(name = names,
                 lon = gc$lon,
                 lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 10,
                     size = c(480, 480),
                     markers = gc)
ggmap(map)


# linear regression
head(cars)
plot(dist ~ speed, data = cars)
model <- lm(dist ~ speed, cars)
model
coef(model)[1] #b
coef(model)[2] #W

speed <- cars[, 1]
pred <- 3.932 * speed - 17.579
compare <- cbind(pred, cars[, 2], abs(pred - cars[, 2]))
# draw hypothesis
abline(coef(model))

#  multi variable
library(car)
head(Prestige)

newdata <- Prestige[, c(1:4)]
plot(newdata, pch = 16, col = 'blue', main = 'Matrix Scatterplot')  # pch 16 is a circle

mod <- lm(income ~ education + prestige + women, data = newdata)
summary(mod)

income = 177.199 * education + 141.435 * prestige - 50 * women - 253.85

# find feature
library(MASS)
newdata2 <- Prestige[, c(1:5)]
head(newdata2)
mod2 <- lm(income ~ education + prestige + women + census, data = newdata2)
step <- stepAIC(mod2, direction = 'both')

mod3 <- lm(income ~ prestige + women, data = newdata2)
summary(mod3)

# logistic regression
head(iris)
# must be integer type
mod4 <- glm(as.integer(Species) ~ ., data = iris)
summary(mod4)

# Sepal.Length: 5.1
# Sepal.Width 3.5
# Petal.Length: 1.4
# Petal.Width: 0.2
pred <- -0.11191 * 5.1 - 0.04008 * 3.5 + 0.22865 * 1.4 + 0.60925 * 0.2 + 1.18650
# pred is 0.917439. 1 is setosa
unique(iris$Species)
as.integer(unique(iris$Species))

# multiple input
unknown <- data.frame(rbind(c(5.1, 3.5, 1.4, 0.2)))
names(unknown) <- names(iris)[1:4]
pred <- predict(mod4, unknown) # predict function

test <- iris[, 1:4]
pred <- predict(mod4, test)
pred <- round(pred, 0) # find nearest integer

# confirm result: 97.3%
acc <- mean(pred == as.integer(iris[, 5]))
