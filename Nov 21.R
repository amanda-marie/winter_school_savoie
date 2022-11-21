# Nov 21.R
# first full day of R course
# learning how to use ggplot
# Amanda Savoie
# November 21, 2022

library(tidyverse)
library(palmerpenguins)
install.packages("palmerpenguins")
library(palmerpenguins)
ggplot(data = penguins, aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(colour = species))
ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm)) +
  # 'island' is a column from 'penguins'
  geom_point(aes(colour = island))
View(penguins)
ggplot(data = penguins, aes(x = body_mass_g, y = bill_length_mm)) + geom_point(aes(colour = species))
View(penguins)
penguins = penguins
ggplot(data = penguins, aes(x = body_mass_g, y = sex)) + 
  geom_point(aes(colour = species))
ggplot(data = penguins, aes(x = sex, y = body_mass_g)) + 
  geom_point(aes(colour = species))
ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm, colour = species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  # Change label text
  labs(x = "Body mass (g)", y = "Bill length (mm)", colour = "Species") +
  # Change legend position
  theme(legend.position = "bottom")

ggplot(penguins, aes(x = body_mass_g, y = bill_length_mm, fill = species)) +
  geom_density_ridges() +
  theme_ridges() + 
  theme(legend.position = "none")
install.packages("ggridges")
library(ggridges)
ggplot(penguins, aes(x = body_mass_g, y = bill_length_mm, fill = species)) +
  geom_density_ridges() +
  theme_ridges() + 
  theme(legend.position = "none")
ggplot(penguins, aes(x = body_mass_g, y = species, fill = species)) +
  geom_density_ridges() +
  theme_ridges() + 
  theme(legend.position = "none")

# test 1234 ---------------------------------------------------------------

#### another test ####


# exercise 2 --------------------------------------------------------------

install.packages("ggpubr")
library(ggpubr)
penguins <- penguins

lm_1 <- ggplot(data = penguins,
               aes(x = body_mass_g, y = bill_length_mm, colour = species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~species)
ggarrange(lm_1, lm_1)

ggplot(data = penguins, 
       aes(x = body_mass_g, y = bill_length_mm, colour = species)) + 
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~gender)

ggplot(data = penguins, 
       aes(x = body_mass_g, y = bill_length_mm, colour = species)) + 
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~sex)

ggplot(penguins, aes(x=sex, y=body_mass_g)) + 
  geom_boxplot(aes(colour = species))

#trying to change the fill

ggplot(penguins, aes(x=sex, y=body_mass_g)) + 
  geom_boxplot(aes(fill = species))

#trying to facet by species

ggplot(penguins, aes(x=sex, y=body_mass_g)) + 
  geom_boxplot(aes(fill = species)) + facet_wrap(~sex)

#trying to facet wrap by island

ggplot(penguins, aes(x=sex, y=body_mass_g)) + 
  geom_boxplot(aes(fill = species)) + facet_wrap(~island)

bxp_1 <- ggplot(penguins, aes(x=sex, y=body_mass_g)) + 
  geom_boxplot(aes(fill = species)) + facet_wrap(~island)

#trying to arrange two figures in a row


grid_1 <- ggarrange(lm_1, bxp_1,
                    # Set number of rows and columns
                    ncol = 1, nrow = 1,
                    # Label each figure
                    labels = c("a)", "b)"),
                    # Create common legend
                    common.legend = TRUE,
                    # Set legend position
                    legend = "bottom")
grid_1  

grid_1 <- ggarrange(lm_1, bxp_1,
                    # Set number of rows and columns
                    ncol = 2, nrow = 1,
                    # Label each figure
                    labels = c("a)", "b)"),
                    # Create common legend
                    common.legend = TRUE,
                    # Set legend position
                    legend = "bottom")
grid_1


# starting over -----------------------------------------------------------

library(tidyverse)
library(ggpubr)
penguins <- penguins

lm_1 <- ggplot(data = penguins,
               aes(x = body_mass_g, y = bill_length_mm, colour = species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~species)
lm_1

#trying to make a boxplot

ggplot(penguins, aes(x=sex, y=body_mass_g)) + 
  geom_boxplot(aes(colour = species))

#changing the fill 

ggplot(penguins, aes(x=sex, y=body_mass_g)) + 
  geom_boxplot(aes(fill = species))

#facet by sex

ggplot(penguins, aes(x=sex, y=body_mass_g)) + 
  geom_boxplot(aes(fill = species)) + facet_wrap(~sex)

#facet by island

ggplot(penguins, aes(x=sex, y=body_mass_g)) + 
  geom_boxplot(aes(fill = species)) + facet_wrap(~island)

#giving the box plot a name

bxp_1 <- ggplot(penguins, aes(x=sex, y=body_mass_g)) + 
  geom_boxplot(aes(fill = species)) + facet_wrap(~island)

#arranging the two figures together

grid_1 <- ggarrange(lm_1, bxp_1,
                    # Set number of rows and columns
                    ncol = 2, nrow = 1,
                    # Label each figure
                    labels = c("a)", "b)"),
                    # Create common legend
                    common.legend = TRUE,
                    # Set legend position
                    legend = "bottom")
grid_1

#trying to facet by multiple categories 

ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm, colour = species))

ggplot(data = penguins, aes(x = body_mass_g, y = sex)) + 
  geom_point(aes(colour = species))

ggplot(data = penguins, aes(x = body_mass_g, y = bill_length_mm)) + 
  geom_point(aes(colour = species))

#trying to facet wrap by three categories

ggplot(data = penguins, aes(x = body_mass_g, y = bill_length_mm)) + 
  geom_point(aes(colour = species)) + facet_wrap(species~island)

ggplot(data = penguins, aes(x = body_mass_g, y = bill_length_mm)) + 
  geom_point(aes(colour = species)) + facet_wrap(species~island)

ggplot(data = penguins, aes(x = body_mass_g, y = bill_length_mm)) + 
  geom_point(aes(colour = species)) + facet_grid(species+sex~island)

ggplot(data = penguins, aes(x = body_mass_g, y = bill_length_mm)) + 
  geom_point(aes(colour = species)) + facet_grid(island+sex~species)


# colours -----------------------------------------------------------------

library(tidyverse)
library(ggpubr)
library(palmerpenguins)

# load the dataset into the local environment
penguins <- penguins

#continuous colour scales

ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(colour = bill_depth_mm))

ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(colour = bill_depth_mm)) +
  # Choose a pre-set palette
  scale_colour_distiller(palette = "Spectral")

# a different pre-set colour palette

ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(colour = bill_depth_mm)) +
  # Viridis colour palette
  scale_colour_viridis_c(option = "D")


ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(colour = bill_depth_mm)) +
  scale_colour_gradientn(colours = c("#A5A94D", "#6FB16F", "#45B19B",
                                              "#59A9BE", "#9699C4", "#CA86AD"))
                                              
#making my own colour palette

ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(colour = bill_depth_mm)) +
  scale_colour_gradientn(colours = c("#BCC159","#67B276","#389792",
                                              "#56758F","#70516C","#68363D"))


ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(colour = bill_depth_mm)) +
  scale_colour_gradientn(colours = c("#5EF3E2","#4DC7C2","#3F9DA0",
                                              "#32757C","#244F58","#152D34"))
                                              
#making a plot with a discrete colour palette

ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(colour = as.factor(year))) +
  # Choose a colour palette
  scale_colour_brewer(palette = "Set1")

ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(colour = as.factor(year))) +
  # Choose a colour palette
  scale_colour_brewer(palette = "dark2")

ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(colour = as.factor(year))) +
  # Choose a colour palette
  scale_colour_brewer(palette = "Dark2")

# t-test
compare_means(bill_length_mm~sex, data = penguins, method = "t.test")

?read.table()

#learning how to load files into R

sst_NOAA_test <- read_csv("course_material/data/sst_NOAA_test.csv")

head(sst_NOAA_test)

#quick summary
summary(sst_NOAA_test)


#trying to make my own figures with NOAA data

sst_NOAA_test <- sst_NOAA_test
view(sst_NOAA_test)

ggplot(data = sst_NOAA_test, aes(x = t, y = temp)) +
  geom_point(aes(colour = site))

#trying to make a facet grid

ggplot(data = sst_NOAA_test, aes(x = t, y = temp)) +
  geom_point(aes(colour = site)) + facet_wrap(~site)

ggplot(data = sst_NOAA_test, aes(x = t, y = temp)) +
  geom_point(aes(colour = site)) + facet_wrap(~site, ncol = 1)

#trying to make the time series look better

ggplot(data = sst_NOAA_test, aes(x = t, y = temp)) +
  geom_line(aes(colour = site)) + facet_wrap(~site, ncol = 1)

#trying to change the colours

ggplot(data = sst_NOAA_test, aes(x = t, y = temp)) +
  geom_line(aes(colour = site)) + facet_wrap(~site, ncol = 1) +
  scale_colour_viridis_c(option = "D") 

ggplot(data = sst_NOAA_test, aes(x = t, y = temp)) +
  geom_line(aes(colour = site)) + facet_wrap(~site, ncol = 1) +
  # Choose a colour palette
  scale_colour_brewer(palette = "Set1")

ggplot(data = sst_NOAA_test, aes(x = t, y = temp)) +
  geom_line(aes(colour = site)) + facet_wrap(~site, ncol = 1) +
  # Choose a colour palette
  scale_colour_brewer(palette = "Set2")
