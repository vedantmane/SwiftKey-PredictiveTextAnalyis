#Loading dataset
load("dataset.RData")

#Buinding the Corpora
require(tm)
corpus <- VCorpus(VectorSource(c(blogs, news, twitter)), readerControl = list(reader = readPlain, language = "en"))

#Analysing spaces and replacements
spacing <- content_transformer(function(charVec, paTTern) gsub(pattern = paTTern, replacement = " ", x = charVec))
corpus <- tm_map(corpus, FUN = spacing, "-")
corpus <- tm_map(corpus, FUN = spacing, "_")

#Performing Transformations
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, PlainTextDocument)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stemDocument)
