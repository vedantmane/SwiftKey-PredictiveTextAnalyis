load("bigcorpus.RDS")

require(tm)

#NGRAMS
print("Processing ngrams...")
mydfm<-data.frame(text=unlist(sapply(corpus, `[`, "content")), stringsAsFactors=F) #turn corpus to dataframe
corpus = mydfm[,1] 

#Unigrams
print("Processing 1-grams...")
unigram <- dfm(tokens_ngrams(tokens(corpus), 1, concatenator = " "), verbose = FALSE)
freqUni <- colSums(unigram)
freqUni <- sort(freqUni, decreasing=TRUE) 
dfU <- data.frame(word=names(freqUni), frequency=freqUni)
freqU <- data.frame(as.character(dfU$word))
names(freqU) <- c("word")
freqU$frequency <- dfU$frequency

#Bigrams
print("Processing 2-grams...")
bigram <- dfm(tokens_ngrams(tokens(corpus), 2, concatenator = " "), verbose = FALSE)
freqBi <- colSums(bigram)
freqBi <- sort(freqBi, decreasing=TRUE) 
dfB <- data.frame(word=names(freqBi), frequency=freqBi)
freqB <- data.frame(as.character(dfB$word))
names(freqB) <- c("word")
freqB$frequency <- dfB$frequency
head(freqB)

#Trigrams
print("Processing 3-grams...")
trigram <- dfm(tokens_ngrams(tokens(corpus), 3, concatenator = " "), verbose = FALSE)
freqTri <- colSums(trigram)
freqTri <- sort(freqTri, decreasing=TRUE) 
dfT <- data.frame(word=names(freqTri), frequency=freqTri)
freqT <- data.frame(as.character(dfT$word))
names(freqT) <- c("word")
freqT$frequency <- dfT$frequency
head(freqT)

#Quadgrams
print("Processing 4-grams...")
quadgram <- dfm(tokens_ngrams(tokens(corpus), 4, concatenator = " "), verbose = FALSE)
freqQuad <- colSums(quadgram)
freqQuad <- sort(freqQuad, decreasing=TRUE) 
dfQ <- data.frame(word=names(freqQuad), frequency=freqQuad)
freqQ <- data.frame(as.character(dfQ$word))
names(freqQ) <- c("word")
freqQ$frequency <- dfQ$frequency
head(freqQ)

#Pentagrams
print("Processing 5-grams...")
pentagram <- dfm(tokens_ngrams(tokens(corpus), 5, concatenator = " "), verbose = FALSE)
freqPenta <- colSums(pentagram)
freqPenta <- sort(freqPenta, decreasing=TRUE) 
dfP <- data.frame(word=names(freqPenta), frequency=freqPenta)
freqP <- data.frame(as.character(dfP$word))
names(freqP) <- c("word")
freqP$frequency <- dfP$frequency
head(freqP)

save(freqU, freqB, freqT, freqQ, freqP, file = "ngrams.RData")
# stopCluster(ncores)
# rm(list = ls())
# gc()
# require(doParallel)
# ncores <- makeCluster(detectCores() - 1)
# registerDoParallel(cores = ncores)
# getDoParWorkers()
