# Developing Data Products
# Project 1


# load library

library(leaflet)

# load data with team info

d1<-read.csv("MNSports.csv")

# Create data frame of lat long points to plot

latlong<-d1[,3:4]

# Create team logo icons for custom markers

map<-leaflet(data=latlong) %>%
  addTiles() %>%
  addMarkers(label=d1$Team, popup=as.character(d1$website), clusterOptions=markerClusterOptions())
map