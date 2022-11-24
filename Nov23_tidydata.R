# Nov23_tidydata.R
# learning how to make tidy data
# Amanda Savoie
# November 23, 2022

# today we need tidyverse and lubridate

library(tidyverse)
library(lubridate)

# now we are loading spreadsheets to use as examples of messy data
# this is an R data file that has many spreadsheets inside it 

load("course_material/data/OISST_mangled.RData")

# take a peek at the first spreadsheet, this is tidy data

head(OISST1)

# we can make a simple line plot of this data

ggplot(data = OISST1, aes(x = t, y = temp)) +
  geom_line(aes(colour = site)) +
  labs(x = NULL, y = "Temperature (°C)", colour = "Site") +
  theme_bw()

# the second spreadsheet 

head(OISST2)

# this spreadsheet is not tidy
# temperature is one variable and should not take up more than one column
# this spreadsheet is too wide and we want to make it longer
# we want to use pivot_longer to squish columns together
# we need to make a new name for this spreadsheet too 

OISST2_tidy <- OISST2 %>% 
  pivot_longer(cols = c(Med, NW_Atl, WA), names_to = "site", 
               values_to = "temp")

# check that it worked and all the temp values are in one column 

head(OISST2_tidy)

# keep going on the slides here before lunch

head(OISST3)

# this spreadsheet is also not tidy
# data are too long with individual observations in multiple rows
# we have two or more variables stored within the same column
# we want to make it wider using pivot_wider 

# note the necessity of an "idx" column to identify individual samples

OISST3_tidy <- OISST3 %>% 
  pivot_wider(id_cols = idx, names_from = type, values_from = name)

head(OISST3_tidy)

#it worked!

head(OISST4a)

# this spreadsheet has two variables in one column
# we need to separate them
# we need to use the separate() function
# we use sep = " " to indicate they are separated by a space

OISST4a_tidy <- OISST4a %>% 
  separate(col = index, into = c("site", "t"), sep = " ")

head(OISST4a_tidy)

#it worked! 

head(OISST4b)

# this spreadsheet has the date separated into 3 columns 
# we need to unite the columns using the unite() function

OISST4b_tidy <- OISST4b %>% 
  unite(year, month, day, col = "t", sep = "-")

head(OISST4b_tidy)

# it worked! 

# for tidy data we want one complete data set per dataframe
# we want to join OISST4a and OISST4b bc they are each missing columns
# we can tell R which columns are the same
# we will use the left_join() function, which matches columns from L to R

OISST4_tidy <- left_join(OISST4a_tidy, OISST4b_tidy, by = c("site", "t"))

head(OISST4_tidy)


# part 2 of lectures ------------------------------------------------------

# now we are learning to filter
# make sure to use == unless we are asking it to do math 

OISST1 %>% 
  filter(site == "Med")

#another example of filtering
# we also use the pipe symbol
# we use | to indicate "or" 

OISST1_sub <- OISST1 %>% 
  filter(site == "Med", month(t) == 12 | month(t) == 1)

head(OISST1_sub)
tail(OISST1_sub)
