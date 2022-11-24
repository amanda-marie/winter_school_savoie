# Nov22_maps.R
# learning how to make maps
# Amanda Savoie
# November 22, 2022

#every day I need to load packages
library(tidyverse)

# to combine figures
library(ggpubr)

# to make scale bars 
library(ggsn)

# need to install ggsn package

install.packages(ggsn)

# need to always put package name in quotation marks

install.packages ("ggsn")

# load package

library(ggsn)

library(palmerpenguins)

#demonstrating the global map and naming it earth_1

earth_1 <- ggplot() +
  # The global shape file
  borders(fill = "grey70", colour = "black") +
  # Equal sizing for lon/lat 
  coord_equal()
1

#downloaded package maps

library(maps)

#trying again to make a global map

earth_1 <- ggplot() +
  # The global shape file
  borders(fill = "grey70", colour = "black") +
  # Equal sizing for lon/lat 
  coord_equal()

earth_1

#how to crop a section of the global map and calling it green_1

green_1 <- ggplot() +
  borders(fill = "grey70", colour = "black") +
  # Force lon/lat extent
  coord_equal(xlim = c(-75, -10), ylim = c(58, 85)) 

green_1

#trying to make a map of Canada, extracting the data from the global map

map_data_Canada <- map_data('world') %>% 
  filter(region == "Canada")

#taking a peep at the data

head(map_data_Canada)

#trying to make a map

Canada_1 <- ggplot(data = map_data_Canada, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group), 
               fill = "chartreuse4", colour = "black")

Canada_1

#trying to filter by subregion

map_data_vic_island <- map_data('world') %>% 
  filter(subregion == "Victoria Island")

head(map_data_vic_island)

#trying to make a map

vic_island <- ggplot(data = map_data_vic_island, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group), 
               fill = "chartreuse4", colour = "black")

vic_island


# Making maps with style --------------------------------------------------

install.packages("marmap")
library(marmap)

# download bathymetry data for Western Australia
# important - make sure you always put the smaller value first
# we are naming the data set bathy_WA

bathy_WA <-  getNOAA.bathy(lon1 = 111, lon2 = 117, 
                           # NB: smaller value first, i.e. more negative
                           lat1 = -36, lat2 = -19, 
                           # In degree minutes
                           resolution = 4)

# Convert to data.frame for use with ggplot2

bathy_WA_df <- fortify.bathy(bathy_WA) %>% 
  # Remove altimetry data
  filter(z <= 0) 

# Save
save(bathy_WA_df, file = "course_material/data/bathy_WA_df.RData")

# making a basic bathymetry map

ggplot(data = earth_1, aes(x = lon, y = lat)) +
  geom_polygon(aes(group = group), colour = "black", fill = "grey60") +
  # Add 200 m contour
  geom_contour(data = bathy_WA_df, 
               aes(x = x, y = y, z = z),
               breaks = c(-200), 
               linewidth = c(0.3), colour = "grey") +
  coord_cartesian(xlim = c(111, 117), 
                  ylim = c(-36, -19), expand = FALSE)

#doesn't work, going back a few steps

ggplot() +
  borders(fill = "grey70", colour = "black") +
  coord_equal()

#fixing the x axis problem

map_global_fix <- map_data('world') %>% 
  rename(lon = long) %>% 
  # Why +2000?
  mutate(group = ifelse(lon > 180, group+2000, group),
         lon = ifelse(lon > 180, lon-360, lon))

map_global_fix

#above is just the data, now we need to make the map

ggplot(data = map_global_fix, aes(x = lon, y = lat)) +
  geom_polygon(aes(group = group), colour = "black", fill = "grey60") +
  # The default coordinate system, with specific limits
  coord_cartesian(xlim = c(-180, 180), ylim = c(-90, 90), expand = FALSE)

#now i want to make a basic bathymetry map

ggplot(data = map_global_fix, aes(x = lon, y = lat)) +
  geom_polygon(aes(group = group), colour = "black", fill = "grey60") +
  # Add 200 m contour
  geom_contour(data = bathy_WA_df, 
               aes(x = x, y = y, z = z),
               breaks = c(-200), 
               linewidth = c(0.3), colour = "grey") +
  coord_cartesian(xlim = c(111, 117), 
                  ylim = c(-36, -19), expand = FALSE)

#adding multiple contour lines

ggplot(data = map_global_fix, aes(x = lon, y = lat)) +
  geom_polygon(aes(group = group), colour = "black", fill = "grey60") +
  # Add 200 and 2000 m contours
  geom_contour(data = bathy_WA_df, 
               aes(x = x, y = y, z = z),
               breaks = c(-200, -2000), 
               linewidth = c(0.3), colour = "grey") +
  coord_cartesian(xlim = c(111, 117), 
                  ylim = c(-36, -19), expand = FALSE)


#going back to basics and practising cropping maps 

green_1 <- ggplot() +
  borders(fill = "grey70", colour = "black") +
  # Force lon/lat extent
  coord_equal(xlim = c(-75, -10), ylim = c(58, 85)) 
green_1

#trying to crop a map of Cambridge Bay

west_arctic <- ggplot() +
  borders(fill = "grey70", colour = "black") +
  # Force lon/lat extent
  coord_equal(xlim = c(-95, -110), ylim = c(58, 85)) 
west_arctic

west_arctic_1 <- ggplot() +
  borders(fill = "grey70", colour = "black") +
  # Force lon/lat extent
  coord_equal(xlim = c(-95, -110), ylim = c(65, 85)) 

west_arctic_1 <- ggplot() +
  borders(fill = "grey70", colour = "black") +
  # Force lon/lat extent
  coord_equal(xlim = c(-95, -110), ylim = c(68, 85)) 


# Arctic Mapping ----------------------------------------------------------

install.packages(ggOceanMaps) #doesn't work 

remotes::install_github("MikkoVihtakari/ggOceanMapsData")

#didn't work because i need to install the package "remotes" 

install.packages("remotes")
library(remotes)

install.packages("install.packages")

remotes::install_github("MikkoVihtakari/ggOceanMapsData")

install.packages("ggOceanMaps")

#the package ggOceanMaps is important for polar mapping

citation("r")

citation("base")

library(ggOceanMapsData)

basemap(limits = 60)

library(ggOceanMaps)

basemap(limits = 60)

basemap(limits = c(100, 160, -20, 30), bathymetry = TRUE)

basemap(limits = c(-160,-100, 60, 80))

# to rotate, write rotate = TRUE

basemap(limits = c(-160,-100, 60, 80), rotate = TRUE)

#then add bathymetry data

basemap(limits = c(-140, -100, 60, 80), rotate = TRUE, bathymetry = TRUE)

#trying to reduce map size

basemap(limits = c(-120, -100, 70, 80), rotate = TRUE, bathymetry = TRUE)

basemap(limits = c(-120, -100, 60, 70), rotate = TRUE, bathymetry = TRUE)

basemap(limits = c(-120, -100, 65, 70), rotate = TRUE, bathymetry = TRUE)



# Points on an Arctic map --------------------------------------

# data.frame tells R that this is a spreadsheet. 
# you can use this to list GPS coordinates
# here i am creating a data frame that is a single point 

one_dot <- data.frame(lat = 69.093384, lon = -105.296261)

# here i am adding this data point to this map 

basemap(limits = c(-120, -100, 65, 70), rotate = TRUE, bathymetry = TRUE) + 
  geom_spatial_point(data = one_dot, aes(x = lon, y = lat), color = "red")


# now i want two dots

two_dots <- data.frame(lat = c(69.093384, 69.105581), 
                       lon = c(-105.296261, -105.385357))

basemap(limits = c(-120, -100, 65, 70), rotate = TRUE, bathymetry = TRUE) + 
  geom_spatial_point(data = two_dots, aes(x = lon, y = lat), color = "red")

# now i'm making the map smaller

basemap(limits = c(-110, -100, 66, 70), rotate = TRUE, bathymetry = TRUE) + 
  geom_spatial_point(data = two_dots, aes(x = lon, y = lat), color = "red")

# now i want to make a really small map

basemap(limits = c(-107, -103, 68, 70), rotate = TRUE, bathymetry = TRUE) + 
  geom_spatial_point(data = two_dots, aes(x = lon, y = lat), color = "red")

basemap(limits = c(-107, -103, 68, 69.5), rotate = TRUE, bathymetry = TRUE) + 
  geom_spatial_point(data = two_dots, aes(x = lon, y = lat), color = "red")

# looking for other maps

shapefile_list("all")

basemap(limits = c(-107, -103, 68, 69.5), rotate = TRUE, bathymetry = TRUE) + 
  geom_spatial_point(data = two_dots, aes(x = lon, y = lat), color = "red")


#making a square

basemap(limits = c(-107, -103, 68, 69.5), rotate = TRUE, bathymetry = TRUE) + 
  geom_spatial_rect(aes(xmin = -105, xmax = -106, ymin = 68.5, ymax = 69.5),
                    fill = NA, colour = "red") +
    geom_spatial_point(data = two_dots, aes(x = lon, y = lat), color = "red")


# making a square on a bigger map

basemap(limits = c(-110, -103, 66, 70), rotate = TRUE, 
        bathymetry = TRUE) + 
  geom_spatial_rect(aes(xmin = -105, xmax = -106, ymin = 68.5, ymax = 69.5),
                    fill = NA, colour = "red") +
  geom_spatial_point(data = two_dots, aes(x = lon, y = lat), color = "red")


