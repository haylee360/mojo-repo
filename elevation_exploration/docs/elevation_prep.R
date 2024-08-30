
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                            Elevation Data Prep                           ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# load libraries
library(tidyverse)
library(janitor)
library(lubridate)

# Join Data


#...........................Create Data Frames...........................

# Data frame with all data, binning elevation
all_sites_df <- all_sites_df %>% 
  clean_names() %>% 
  mutate(date = ymd(sample_date),
         elevation_binned = cut(elevation, 
                                breaks=c(0, 250, 500, 672), 
                                labels = c("low", "medium", "high")))

# 10 year span containing hurricane
graph_all <- all_sites_df %>% 
  dplyr::select(sample_id, no3_n, elevation, k, date, elevation_binned) %>% 
  filter(date %in% ymd("1985-10-01"):ymd("1995-10-01")) %>%
  mutate(elevation = as.character(elevation))

# After hurricane date selection
during_data <- graph_all %>% 
  filter(date %in% ymd("1989-09-10"):ymd("1990-09-10"))

# During hurricane date selection
after_data <- graph_all %>% 
  filter(date %in% ymd("1994-09-11"):ymd("1995-09-11"))