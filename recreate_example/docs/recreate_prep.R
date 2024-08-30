
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                  Data Prep                               ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Load libraries
library(tidyverse)
library(skimr)


## Explore data

summary(stream_df)
names(stream_df)
skim(stream_df)

#.....................Get data ready to plot.....................

# Data for the Nitrate plot
plot1_df <- stream_df %>% 
  select(date, k, no3_n, sample_id) %>% 
  mutate(year = year(date)) %>% 
  filter(year %in% 1988:1994)

# Data for the K plot
kplot <- plot1_df %>% 
  filter(date %in% ymd("1988-10-01"):ymd("1992-03-01"))
# used filter here to subset the time frame we wanted

