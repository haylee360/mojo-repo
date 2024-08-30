
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                      Data import, cleaning, and joining                    ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Load libraries and clear environment
rm(list = ls())
library(tidyverse)
library(janitor)
library(lubridate)

#...........................Import Data...........................

# Set working directory and read in data
setwd("/courses/EDS214/group_project/2024/team-mojo-jojo/raw_data")
# change this to the location of your raw data files!

BQ1 <- read_csv("QuebradaCuenca1-Bisley.csv")
BQ2 <- read_csv("QuebradaCuenca2-Bisley.csv")
BQ3 <- read_csv("QuebradaCuenca3-Bisley.csv")
PRM <- read_csv("RioMameyesPuenteRoto.csv")


#...........................Clean data...........................

# Clean data frame names and date
BQ1 <- BQ1 %>% 
  clean_names() %>% 
  mutate(date = ymd(sample_date)) 

BQ2 <- BQ2 %>% 
  clean_names() %>% 
  mutate(date = ymd(sample_date)) 

BQ3 <- BQ3 %>% 
  clean_names() %>% 
  mutate(date = ymd(sample_date)) 

PRM <- PRM %>% 
  clean_names() %>% 
  mutate(date = ymd(sample_date),
         sample_id = str_replace_all(sample_id, "MPR", "PRM")) 
# Fixed site name to match example


#...........................Join data...........................

# Bind the data frames together 
BQ12 <- rbind(BQ1, BQ2)
BQ3PRM <- rbind(BQ3, PRM)

stream_df <- rbind(BQ12, BQ3PRM)
