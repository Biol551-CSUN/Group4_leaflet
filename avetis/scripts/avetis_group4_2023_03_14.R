### My fourth tidytuesday of week 7 ####
### Created by: Avetis Mishegyan #############
### Created on: 2023-03-12 ####################


#### Load Libraries ######
library(tidytuesdayR)
library(leaflet) # package for interactive maps


### Load data ######
tuesdata <- tidytuesdayR::tt_load('2023-01-10') # reads in data using the tidytuesdayR package

feederwatch <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-01-10/PFW_2021_public.csv')
View(feederwatch) # view opens a new window to view the data
glimpse(feederwatch) # glimpse allows us to inspect the data

site_data <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-01-10/PFW_count_site_data_public_2021.csv')
View(site_data)
glimpse(site_data)


### Data Analysis ######
map <- leaflet() %>%
  addTiles() %>% # function adds default OpenStreetMap tile layer (ie. basemap)
  addProviderTiles(providers$OpenStreetMap, group = "OpenStreetMap") %>% # function adds third-party tiles (ie. basemaps)
  addProviderTiles(providers$CartoDB.DarkMatter, group = "CartoDB.DarkMatter") %>% # providers$ argument names third-party basemap
  addProviderTiles(providers$NASAGIBS.ViirsEarthAtNight2012, group = "NASAGIBS.ViirsEarthAtNight2012") %>% # group argument is the name of the group the newly created layers belong to
  addProviderTiles(providers$Esri.WorldImagery, group = "Esri.WorldImagery") %>% 
  addLayersControl(baseGroups = c("OpenStreetMap", # function adds layer controls to hide/show map layers,
                                  # and baseGroups argument creates character vector where each element is the name of a group
                                  "CartoDB.DarkMatter",
                                  "NASAGIBS.ViirsEarthAtNight2012",
                                  "Esri.WorldImagery"),
                   position = "topleft") %>%
  addControl(html = "#TidyTuesday(2023-01-10) - Bird FeederWatch Data", # function adds text box, and html argument displays text
             position = "bottomright") # position argument moves text box to any corner
map # prints map