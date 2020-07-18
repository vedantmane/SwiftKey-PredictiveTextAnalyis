tab <- data.frame()

#File Size
sizeBlogs <- file.size("./final/en_US/en_US.blogs.txt") / (1024 * 1024)
sizeNews <- file.size("./final/en_US/en_US.blogs.txt") / (1024 * 1024)
sizeTwitter <- file.size("./final/en_US/en_US.blogs.txt") / (1024 * 1024)
sizeBlogs <- paste(round(sizeBlogs, 0), "MB")
sizeNews <- paste(round(sizeNews, 0), "MB")
sizeTwitter <- paste(round(sizeTwitter, 0), "MB")

##Append Data Frame
tab <- rbind(tab, c(sizeBlogs, sizeNews, sizeTwitter))
names(tab) <- c("Blogs", "News", "Twitter")
row.names(tab)[1] <- c("Size")

source("readData.R")

#File - Number of lines
linesBlogs <- length(readBlogs)
linesNews <- length(readNews)
linesTwitter <- length(readTwitter)

##Append Data Frame
tab <- rbind(tab, c(linesBlogs, linesNews, linesTwitter))
row.names(tab)[2] <- c("Number of lines")

#File - Number of characters
charsBlogs <- sapply(readBlogs, nchar)
charsNews <- sapply(readNews, nchar)
charsTwitter <- sapply(readTwitter, nchar)

##Append Data Frame
tab <- rbind(tab, c(sum(charsBlogs), sum(charsNews), sum(charsTwitter)))
row.names(tab)[3] <- c("Number of characters")

#File - Max Number of Character in a Single Line
maxBlogs <- max(charsBlogs)
maxNews <- max(charsNews)
maxTwitter <- max(charsTwitter)

##Append Data Frame
tab <- rbind(tab, c(maxBlogs, maxNews, maxTwitter))
row.names(tab)[4] <- c("Max Characters")

tab