#Loading dataset
load("dataset.RData")

#Buinding the Corpora
require(tm)
print("Building corpus...")
corpus <- VCorpus(VectorSource(c(blogs, news, twitter)), readerControl = list(reader = readPlain, language = "en"))

#Analysing spaces and replacements
spacing <- content_transformer(function(charVec, paTTern) gsub(pattern = paTTern, replacement = " ", x = charVec))
corpus <- tm_map(corpus, FUN = spacing, "-")
corpus <- tm_map(corpus, FUN = spacing, "_")
corpus <- tm_map(corpus, FUN = spacing, "(f|ht)tp(s?)://(.*)[.][a-z]+")
corpus <- tm_map(corpus, FUN = spacing, "@[^\\s]+")

#Performing Transformations
print("Transforming corpus...")
corpus <- tm_map(corpus, content_transformer(tolower))
#corpus <- tm_map(corpus, removeWords, stopwords("en"))
print("removing unwanted things")
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, PlainTextDocument)
print("preparing stem document")
corpus <- tm_map(corpus, stemDocument)
print("Done...")

save(corpus, file = "bigcorpus.RDS")

stopCluster(ncores)
rm(list = ls())
gc()
require(doParallel)
ncores <- makeCluster(detectCores() - 1)
registerDoParallel(cores = ncores)
getDoParWorkers()
