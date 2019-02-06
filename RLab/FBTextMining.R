# install.packages('Rfacebook', 'RCurl')

library(Rfacebook)
library(RCurl)

fbAuth = fbOAuth(app_id = "", app_secret = "", extended_permissions = FALSE)
getUsers('me', token = fbAuth)

getPage(page = 'huffpostkorea', token = fbAuth, n = 30)