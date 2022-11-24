# making_polar_maps.R
# a workflow for making an Arctic map
# Amanda Savoie
# November 22, 2022

#load the packages that you need

#always load the tidyverse

library(tidyverse)

# load ggpubr to combine figures

library(ggpubr)

# load ggsn to make scale bars 

library(ggsn)

# load package "remotes" to get packages from GitHub

library(remotes)

#load ggOceanMaps and ggOceanMapsData to get nice projections
#these projections work well at the poles 

library(ggOceanMaps)

library(ggOceanMapsData)

#limit the map to > 60 degrees north to make a circular map of the Arctic

basemap(limits = 60)

#you can limit the map to certain co-ordinates by choosing lat and long
 
basemap(limits = c(100, 160, 20, 60)) #this gives us eastern Asia

#you can then add bathymetry data from the ggOceanMapsData

basemap(limits = c(100, 160, 20, 60), bathymetry = TRUE)

#here is a polar example, you need to rotate it to make it look nice

basemap(limits = c(-120, -100, 67, 75), rotate = TRUE)

#then add bathymetry again 

basemap(limits = c(-120, -100, 67, 75), rotate = TRUE, bathymetry = TRUE)

# Points on an Arctic map --------------------------------------

# data.frame tells R that this is a spreadsheet. 
# you can use this to list GPS coordinates
# here i am creating a data frame that is a single point 

one_dot <- data.frame(lat = 69.093384, lon = -105.296261)

# here i am adding this data point to this map 

basemap(limits = c(-120, -100, 67, 75), rotate = TRUE, bathymetry = TRUE) + 
  geom_spatial_point(data = one_dot, aes(x = lon, y = lat), color = "red")

#now i am adding a square to the map 

basemap(limits = c(-120, -100, 67, 75), rotate = TRUE, bathymetry = TRUE) + 
  geom_spatial_rect(aes(xmin = -104, xmax = -107, ymin = 68.5, ymax = 69.5),
                    fill = NA, colour = "red") +
  geom_spatial_point(data = one_dot, aes(x = lon, y = lat), color = "red")



