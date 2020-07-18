# Tokenizing for n-grams
tokenUniGram <- function(x) {
    NGramTokenizer(x, control = Weka_control(min = 1, max = 1))
}
tokenBiGram <- function(x) {
    NGramTokenizer(x, control = Weka_control(min = 2, max = 2))
}
tokenTriGram <- function(x) {
    NGramTokenizer(x, control = Weka_control(min = 3, max = 3))
}

# Constructing the Document Term Matrix
dtmU <- DocumentTermMatrix(corpus, control = list(tokenize = tokenUniGram))
dtmB <- DocumentTermMatrix(corpus, control = list(tokenize = tokenBiGram))
dtmT <- DocumentTermMatrix(corpus, control = list(tokenize = tokenTriGram))

# Finding terms with particular threshold
unigram <- findFreqTerms(dtmU, lowfreq = 200)
bigram <- findFreqTerms(dtmB, lowfreq = 50)
trigram <- findFreqTerms(dtmT, lowfreq = 50)

# Calculating Frequency Terms
freqUni <- colSums(as.matrix(dtmU[,unigram]))
freqBi <- colSums(as.matrix(dtmB[,bigram]))
freqTri <- colSums(as.matrix(dtmT[,trigram]))

# Constructing data frames of n-grams
freqU <- data.frame(word = names(freqUni), frequency = freqUni, row.names = NULL)
freqB <- data.frame(word = names(freqBi), frequency = freqBi, row.names = NULL)
freqT <- data.frame(word = names(freqTri), frequency = freqTri, row.names = NULL)

#Filtering the Top 10 n-grams
dfU <- freqU[order(-freqU$frequency),][1:10,]
dfB <- freqB[order(-freqB$frequency),][1:10,]
dfT <- freqT[order(-freqT$frequency),][1:10,]
