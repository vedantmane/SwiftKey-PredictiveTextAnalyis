zip <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
dir.create("./data")
download.file(zip, destfile = "./data/data.zip")
unzip("./data/data.zip")