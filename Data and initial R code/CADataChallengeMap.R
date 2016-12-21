#set path to project directory
setwd("C:/Users/avanjavakam/Desktop/R_Home/CA DATA CHALLENGE")

library(sp) #readOGR
library(shiny)
library(leaflet)
library(RColorBrewer)
library(ggplot2)
library(maps)
library(mapproj)
library(rgdal) #readOGR
library(maptools)
library(rgeos)
library(shinyjs)
library(dplyr)
library(RODBC)
library(lubridate)
library(stringr)

#Reading Shape Files
dischargepoints <- readOGR(dsn = "Outfall_Prioritization.shp", layer = "swDischargePoint")

dischargepoints <- spTransform(dischargepoints, CRS("+proj=longlat"))

dischargepoints@data$rec<-1:nrow(dischargepoints@data)

# #visualizing only discharge points
# leaflet() %>%
#   addTiles(options = providerTileOptions()) %>%
#   addCircles(data = dischargepoints)


#Reading Shape Files
tributaries <- readOGR(dsn = "Outfall_Prioritization.shp", layer = "swDischargePoint_Tributary")

tributaries <- spTransform(tributaries, CRS("+proj=longlat"))

tributaries@data$rec<-1:nrow(tributaries@data)

#visualizing only tributaries
# leaflet() %>%
#   addTiles(options = providerTileOptions()) %>%
#   addPolygons(data = tributaries)


#plotting both discharge points and tributaries linked by facility ID
leaflet() %>%
    
    addTiles(options = providerTileOptions()) %>%
    
    addPolygons(data = tributaries, 
                color = "brown",
                popup = paste0("OUTFALL_TR : ", tributaries$Outfall_Tr, "<br>"))%>%
                               #"GLOBAL ID : ", subsetTransform1$Outfall__1, "<br>",
                               #"SIZE : ", subsetTransform$SIZE1))) %>%
    
    addCircles(data = dischargepoints,
                #fillColor = ~pal(Total_ETfactor),
                #color = "#b2aeae", # you need to use hex colors
                #fillOpacity = 0.5,
                
                #smoothFactor = 0.2)
                popup = paste0("FACILITY ID : ", dischargepoints$FACILITYID, "<br>", 
                               "GLOBAL ID : ", dischargepoints$GlobalID, "<br>",
                               "SIZE : ", dischargepoints$SIZE1))


#Reading census Shape File, census usage data and
#Overlaying it with outfall data
censusdata <- read.csv("oc_census_blocks_2010/mnwd_census_block_usage.csv")
censusmapdata <- readOGR(dsn = "oc_census_blocks_2010", layer = "oc_census_blocks_2010")

censusmapdata <- spTransform(censusmapdata, CRS("+proj=longlat"))

censusmapdata@data$rec<-1:nrow(censusmapdata@data)


#joining usage data to shape files
censusmapdata@data <- left_join(censusmapdata@data, censusdata, by = c("cartodb_id"))

popup <- paste0("GEOID: ", censusmapdata$geoid10.x, "<br>", "Usage: ", censusmapdata$usage_ccf,
                "<br>", "House size: ", censusmapdata$hhsize)
pal <- colorNumeric(
  palette = "YlGnBu",
  domain = censusmapdata@data$usage_ccf
)
#Have to add a date range
map1<-leaflet() %>%
  #addTiles(options = providerTileOptions()) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(data = censusmapdata, 
              fillColor = ~pal(usage_ccf), 
              color = "#b2aeae", # you need to use hex colors
              fillOpacity = 0.7, 
              weight = 0.3, 
              smoothFactor = 0.2,
              popup = popup) %>%
  addLegend(pal = pal, 
            values = censusmapdata$usage_ccf, 
            position = "bottomright", 
            title = "Usage",
            labFormat = labelFormat(suffix = "ccf"))
#map1

map1 %>%
addPolygons(data = tributaries, 
            color = "brown",
            weight = 0.3,
            smoothFactor = 0.2,
            stroke = FALSE,
            popup = paste0("OUTFALL_TR : ", tributaries$Outfall_Tr, "<br>")) %>%
  #"GLOBAL ID : ", subsetTransform1$Outfall__1, "<br>",
  #"SIZE : ", subsetTransform$SIZE1))) %>%
  
  addCircles(data = dischargepoints,
             #fillColor = ~pal(Total_ETfactor),
             color = "#777777", # you need to use hex colors
             fillOpacity = 0.7,
             weight = 0.7,
             popup = paste0("FACILITY ID : ", dischargepoints$FACILITYID, "<br>", 
                            "GLOBAL ID : ", dischargepoints$GlobalID, "<br>",
                            "SIZE : ", dischargepoints$SIZE1))

  
# setwd("C:/Users/avanjavakam/Desktop/R_Home/CA DATA CHALLENGE/WIHMP.shp")
#   
# ######################################PLOT and WRITE FUNCTION###################################################
#   plotandwriteshapefile <- function(filename){
#     p<-list()
#     mapdata3 <- readOGR(dsn = getwd() , layer = filename)
#     
#     subsetTransform3 <- spTransform(mapdata3, CRS("+proj=longlat"))
#     
#     subsetTransform3@data$rec<-1:nrow(subsetTransform3@data)
#     
#     subsetTransform3@data
#     
#     p <- plot(subsetTransform3)
#     
#     write.csv(subsetTransform3@data, filename, row.names = FALSE)
#     #return(p)
#   }
# 
# 
# filelist = list.files(pattern = ".*.shp")
# 
# filevec <- str_replace_all(filelist, ".shp","")
# lapply(filevec, plotandwriteshapefile)



