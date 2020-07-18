#Reading Files
readBlogs <- readLines("./final/en_US/en_US.blogs.txt", 
                       skipNul = TRUE, encoding = "UTF-8", warn = FALSE)
readNews <- readLines("./final/en_US/en_US.news.txt", 
                      skipNul = TRUE, encoding = "UTF-8", warn = FALSE)
readTwitter <- readLines("./final/en_US/en_US.twitter.txt", 
                         skipNul = TRUE, encoding = "UTF-8", warn = FALSE)
