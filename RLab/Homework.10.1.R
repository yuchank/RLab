library(RColorBrewer)
library(wordcloud)
library(KoNLP)

useSejongDic()
pal2 <- brewer.pal(8, 'Dark2')
text <- readLines(file.choose())

noun <- sapply(text, extractNoun, USE.NAMES = FALSE)
noun2 <- unlist(noun)
noun2 <- noun2[nchar(noun2) > 1] # one character
noun2 <- gsub('����', '', noun2) # remove '����'
noun2 <- gsub('�츮', '', noun2) # remove '�츮'
wordcount <- table(noun2)
wordcloud(names(wordcount), freq = wordcount, scale = c(6, 0.7), min.freq = 3, random.order = FALSE, rot.per = .1, colors = pal2)
