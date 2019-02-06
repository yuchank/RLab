# 14 weeks homework
library(tidytext)
library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)
library(ggplot2)

load('dt_rtweet.RData')

dt_text <- dt_rtweet %>% select(status_id, created_at, text) # select column 
dt_text_unique <- dt_text %>% filter(!duplicated(text)) # filter row

unnest_token <- '[^[:word:]#@]' # remove all but word, #@
remove_regex <- 'https?://[[:word:]./]+|www.\\.[[:word:]./]+|&amp;|&lt;|&gt;|&quot;' # remove URL. ? means it may exist or not

dt_tidy <- dt_text_unique %>% mutate(text = str_replace_all(text, remove_regex, '')) %>% # remove URL
  mutate(text = str_replace_all(text, '[#@]?[^[:ascii:]]', '')) %>% # remove non-ascii
  unnest_tokens(word, text, token = 'regex', pattern = unnest_token) %>% # remove all but word, #@
  filter(!word %in% stop_words$word) # filter row

dt_tidy %>%
  filter(!word %in% c('fake', 'love')) %>%
  mutate(time_floor = floor_date(created_at, unit = 'hour')) %>%
  inner_join(get_sentiments('bing')) %>%
  count(time_floor, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative) %>%
  ggplot(aes(x = time_floor, y = sentiment)) +
  geom_col() +
  scale_x_datetime(breaks = '1 day', date_labels = '%b %d')