library(RColorBrewer)
library(wordcloud)
library(pdftools)
library(stringr)

bts_text <- pdf_text('BTS_(band).pdf') # return character vector of 'pages'
bts_text <- tolower(bts_text) # return character vector
bts_text_sent <- strsplit(bts_text, split = '\\.') # return list of 'sentences'
bts_text_word <- strsplit(unlist(bts_text_sent), split = ' ') # return list of 'words'
bts_text_word <- unlist(bts_text_word) # return character vector of 'words'

bts_text_word_main <- bts_text_word[nchar(bts_text_word) > 0] # remove blank. 27582 to 15471

# remove reference section
which(str_detect(bts_text_word_main, 'references'))
bts_text_word_main <- bts_text_word_main[1:6340]

bts_text_word_freq <- sort(table(bts_text_word_main), decreasing = TRUE)

# wordcloud
wordcloud(words = names(bts_text_word_freq), freq = bts_text_word_freq, random.order = FALSE, min.freq = 5, scale = c(4, 0.3))

