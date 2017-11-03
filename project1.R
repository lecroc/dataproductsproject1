# Developing Data Products

# Project 1

# load library

library(leaflet)

# load data with team info

d1<-read.csv("MNSports.csv")

# Create data frame of lat long points to plot

latlong<-d1[,3:4]

latlong$rec<-c(1,2,3,4)

# Create sport logo icons for custom markers

Icons <- icons(
         ifelse(latlong$rec==1,
                   "if_baseball_63116.png",
                ifelse(latlong$rec==2,
                       "Sport-basketball-icon.png",
                       ifelse(latlong$rec==3,
                              "Sport-american-football-icon.png", "nhl-icon.png"))))
                   
# Create pop up labels

teamsites <- c(
  "<a href='https://www.mlb.com/twins'>Minnesota Twins</a>",
  "<a href='https://dunkingwithwolves.com/'>Minnesota Timberwolves</a>",
  "<a href='http://www.vikings.com/'>Minnesota Vikings</a>",
  "<a href='https://www.nhl.com/wild'>Minnesota Wild</a>"
  )

map<-leaflet(data=latlong) %>%
  addTiles() %>%
  addMarkers(label=d1$Team, popup=teamsites, clusterOptions=markerClusterOptions(),
             icon=Icons)
map