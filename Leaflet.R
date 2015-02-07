
install.packages(c('htmlwidgets','devtools','ggmap'))
devtools::install_github('rstudio/leaflet')
library(leaflet)
library(ggmap)

m <- leaflet() %>% addTiles() %>% 
  setView(-73.974188,40.732358,zoom=11 ) %>%
  addPopups(-73.911,40.762,'Home!') %>%
  addPopups(-73.987,40.770,'Jack"s BirthPlace')

m

getwd()
