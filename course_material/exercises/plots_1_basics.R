# Script name
# Author
# Date


# Libraries ---------------------------------------------------------------

library(tidyverse)
library(palmerpenguins)


# Data --------------------------------------------------------------------

# Load the dataset into the local environment
penguins <- penguins


# Example -----------------------------------------------------------------

# The basic plot
ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(colour = species))


# Exercise 1 --------------------------------------------------------------

# Create a basic plot with different x and y axes


# Exercise 2 --------------------------------------------------------------

# Change the aes() arguments


# Exercise 3 --------------------------------------------------------------

# Change the labels


# BONUS -------------------------------------------------------------------

# Create a ridgeplot

