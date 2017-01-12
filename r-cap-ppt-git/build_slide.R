library(slidify)



slidify("index.Rmd")


# Local
browseURL("index.html")


# Remote
#publish(user="vasuji", repo="R-cap-Presentation", host='github')

