require(ggplot2)
plotU <- ggplot(data=freqU[1:10,], aes(x=word, y=frequency,fill=frequency)) + 
    geom_bar(stat="identity")+guides(fill=FALSE)+
    theme(axis.text.x=element_text(angle=90))+
    scale_x_discrete(limits=dfU$word)+
    labs(title="Top10 Unigrams")+xlab("words")
plotB <- ggplot(data=dfB, aes(x=word, y=frequency,fill=frequency)) + 
    geom_bar(stat="identity")+guides(fill=FALSE)+
    theme(axis.text.x=element_text(angle=90))+
    scale_x_discrete(limits=dfB$word)+
    labs(title="Top10 Bigrams")+xlab("words")
plotT <- ggplot(data=dfT, aes(x=word, y=frequency,fill=frequency)) + 
    geom_bar(stat="identity")+guides(fill=FALSE)+
    theme(axis.text.x=element_text(angle=90))+
    scale_x_discrete(limits=dfT$word)+
    labs(title="Top10 Trigrams")+xlab("words")
plot_grid(plotU, plotB, plotT, nrow = 1, ncol = 3)

set.seed(5)
wordcloud(freqU$word, freqU$frequency, max.words = 200, scale = c(3, 0.1), colors = brewer.pal(8,"Dark2"))
