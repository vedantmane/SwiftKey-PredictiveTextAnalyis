#Task 1 - Getting and cleaning the data

#Loading the dataset
source("readData.R")

#Removing text not in English Language
readBlogs_en <- sapply(readBlogs, 
                       function(word) 
                           iconv(word, from = "latin1", to = "ASCII", sub = ""))
readNews_en <- sapply(readNews, 
                       function(word) 
                           iconv(word, from = "latin1", to = "ASCII", sub = ""))
readTwitter_en <- sapply(readTwitter, 
                       function(word) 
                           iconv(word, from = "latin1", to = "ASCII", sub = ""))

#Counting number of characters in this new data
chars_en <- sapply(list(readBlogs_en, readNews_en, readTwitter_en),nchar)
newChars_en <- sapply(chars_en,sum)

#Percentage of removed characters
1 - as.integer(newChars_en) / as.integer(tab[3,])

#Sampling the huge dataset
set.seed(123)
blogs <- sample(readBlogs_en, length(readBlogs_en) * 0.05)
set.seed(456)
news <- sample(readNews_en, length(readNews_en) * 0.05)
set.seed(789)
twitter <- sample(readTwitter_en, length(readTwitter_en) * 0.05)

save(blogs, news, twitter, file = "dataset.RData")

#Removing unwanted variables
rm(readBlogs, readBlogs_en, readNews, readNews_en, readTwitter, readTwitter_en)

.rs.restartR()

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





