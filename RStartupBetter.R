# ipak function: install and load multiple R packages.
# check to see if packages are installed. Install them if they are not, then load them into the R session.

ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

#load all the packages I want/use frequently
packages <- c('ggplot2','RODBC','TraMineR','TraMineRextras','randomForest',
              'rattle','rpart','RColorBrewer','shiny','devtools','installr',
              'shiny','PKI','packrat','rsconnect',
              'plyr','reshape','gridExtra','forecast','shiny',
              'lmtest','caret','quantmod','zoo','scales','psych','mgcv','parallel',
              'ggthemes','lubridate','pheatmap','symbols',
              'flexmix','tm','wordcloud','mclust','cluster','corrplot',
              'fpc','ggdendro','ape','colorspace','corrgram','clusterGeneration','nnet',
              'Amelia','class','pROC','sqldf','RCurl','utils','treemap','ggmap',
              'digest','Matrix','survival','slam','MASS','xtable','yaml','igraph','RJSONIO','GGally',
              'googleVis','maps','rjson','lme4','DescTools','RDCOMClient','installr')

ipak(packages)
update.packages()

updateR()

#for grabbing directly from SQL
dms <- odbcConnect('dms')
dms32 <- odbcConnect('dms32_3') #for running R in 32 bit mode
hrs <- odbcConnect('hrs')
aar <- odbcConnect('aar')
icms <- odbcConnect('icms')
hom <- odbcConnect('homicide')
setwd('C:/users/concannonc/desktop')


#con usage:  fakedata <- sqlQuery(con,'select * from ##fakedata')  note double ##




substrRight <- function(x, n){
  substr(x, nchar(x)-n+1, nchar(x))
}

#make me a multiplot


multiplot <- function(..., plotlist=NULL, cols) {
  require(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # Make the panel
  plotCols = cols                          # Number of columns of plots
  plotRows = ceiling(numPlots/plotCols) # Number of rows needed, calculated from # of cols
  
  # Set up the page
  grid.newpage()
  pushViewport(viewport(layout = grid.layout(plotRows, plotCols)))
  vplayout <- function(x, y)
    viewport(layout.pos.row = x, layout.pos.col = y)
  
  # Make each plot, in the correct location
  for (i in 1:numPlots) {
    curRow = ceiling(i/plotCols)
    curCol = (i-1) %% plotCols + 1
    print(plots[[i]], vp = vplayout(curRow, curCol ))
  }
  
}



freq_bar <- function(data,var,facet=NULL){
  
  if (is.null(facet)) data=data.frame(data,var)
  else data=data.frame(data,var,facet)
  .e <- environment()
  
  g <- ggplot(data=data,aes(x=reorder(data$var,data$var,
                                      function(x)-length(x)),
                            group=data$var,fill=data$var),environment=.e)+geom_bar()
  g <- g+ ylab('Count')+
    xlab('Most Common X')+
    theme(axis.text.y=element_text(size=12))+
    theme(axis.text.x=element_text(angle=45,hjust=1,size=12))+
    theme(axis.title.y = element_text(face='bold',size=10))+
    theme(axis.title.x = element_text(face='bold',size=10))+
    scale_fill_discrete(guide= guide_legend(title='Possible Values'))
  
  if (is.null(facet)) 
  {print(g)} else
  { g <- g+facet_wrap(~facet)
    print(g)}
}
