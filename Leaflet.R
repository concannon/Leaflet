
#install.packages(c('htmlwidgets','devtools','ggmap','rmarkdown'))
#devtools::install_github('rstudio/leaflet')
library(leaflet)
library("rmarkdown")
library(ggmap)

m <- leaflet() %>% addTiles() %>% 
  setView(-73.974188,40.732358,zoom=11 ) %>%
  addPopups(-73.911,40.762,'Home!') %>%
  addPopups(-73.987,40.770,'Jack"s BirthPlace') %>%
  addPopups(-74.00,40.71,'Work') %>%
  addPopups(-73.923,40.764,"Doctor's Office")

m

