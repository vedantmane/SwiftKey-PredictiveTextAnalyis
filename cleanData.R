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
#chars_en <- sapply(list(readBlogs_en, readNews_en, readTwitter_en),nchar)
#newChars_en <- sapply(chars_en,sum)

#Percentage of removed characters
#rmChars <- ave(1 - as.integer(newChars_en) / as.integer(tab[3,]))[1]

#Sampling the huge dataset
set.seed(66)
blogs <- sample(readBlogs_en, length(readBlogs) * 0.05)
news <- sample(readNews_en, length(readNews) * 0.05)
twitter <- sample(readTwitter_en, length(readTwitter) * 0.05)

save(blogs, news, twitter, file = "dataset.RData")

#Removing unwanted variables
rm(readBlogs, readBlogs_en, readNews, readNews_en, readTwitter, readTwitter_en)

#.rs.restartR()
# rm(list = ls())
# gc()

