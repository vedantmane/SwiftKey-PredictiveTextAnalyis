#Data Science Capstone - Week 1 Quiz

#Q1 File Size of en_US.blogs.txt
print(file.size("./final/en_US/en_US.blogs.txt") / (1024 * 1024))

#Q2 Number of Lines in en_US.twitter.txt
read <- readLines("./final/en_US/en_US.twitter.txt", skipNul = TRUE, encoding = "UTF-8")
length(read)

#Q3 Length of longest line in any of the three en_US data sets
readBlogs <- readLines("./final/en_US/en_US.blogs.txt", skipNul = TRUE, encoding = "UTF-8")
readNews <- readLines("./final/en_US/en_US.news.txt", skipNul = TRUE, encoding = "UTF-8")
readTwitter <- readLines("./final/en_US/en_US.twitter.txt", skipNul = TRUE, encoding = "UTF-8")
charsBlogs <- sapply(readBlogs, nchar)
charsNews <- sapply(readNews, nchar)
charsTwitter <- sapply(readTwitter, nchar)
maxBlogs <- max(charsBlogs)
maxNews <- max(charsNews)
maxTwitter <- max(charsTwitter)
data <- data.frame(c("Blogs", "News", "Twitter"), c(maxBlogs, maxNews, maxTwitter))
names(data) <- c("Source", "Max")
row <- which.max(data[,"Max"])
data[row,]

#Q4 Number of lines where the word "love" (all lowercase) occurs 
#   by the number of lines the word "hate" (all lowercase) occurs
#   in the en_US Twitter dataset 
loveLines <- sum(grepl(pattern = "love", fixed = TRUE, ignore.case = FALSE, x = readTwitter[1:length(readTwitter)]))
hateLines <- sum(grepl(pattern = "hate", fixed = TRUE, ignore.case = FALSE, x = readTwitter[1:length(readTwitter)]))
loveLines/hateLines

#Q5 Tweet about biostats in the dataset
readTwitter[which(grepl(pattern = "biostats", fixed = TRUE, 
                        ignore.case = FALSE, x = readTwitter[1:length(readTwitter)]))]

#Q6 "A computer once beat me at chess, but it was no match for me at kickboxing" phrase in dataset
phrase <- "A computer once beat me at chess, but it was no match for me at kickboxing"
sum(grepl(pattern = phrase, fixed = TRUE, ignore.case = FALSE, x = readTwitter[1:length(readTwitter)]))
