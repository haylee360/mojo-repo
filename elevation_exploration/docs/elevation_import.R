
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                   Elevation Data Import, Clean, and Join                 ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Clear environment
# Load libraries
library(tidyverse)
library(janitor)
library(lubridate)

# Create vector of site names
sites_id <- c( "Q1",  "Q2",  "Q3",  "QG",  
               "QPA", "QPB",  "QP",  "QS", 
               "QT",  "RI",  "MG", "MPR")

# Create filenames
filenames = dir("/courses/EDS214/group_project/2024/team-mojo-jojo/raw_data/", 
                pattern="*.csv")

# Assign abbreviated file names to imported .csv files
for (i in seq_along(filenames)){
  assign(sites_id[i], 
         read_csv(paste0("/courses/EDS214/group_project/2024/team-mojo-jojo/raw_data/",
                         filenames[i])
         )
  )
}

# Create site elevation data frame
site_elevation = data.frame(Sample_ID = c( "QS",  "QT",  "RI",  "MG",  
                                           "Q1",  "Q2",  "Q3", "QPA", 
                                           "QPB",  "QP", "MPR",  "QG"),
                            elevation = c(  326,   270,   620,    22, 
                                            218,   218,   198,   672, 
                                            662,   444,   140,   640)
)

# Bind data together
all_sites_df <- do.call("rbind", list(Q1, Q2, Q3, Q3, QG, QP, MG, MPR, QPA, QPB, QS, QT, RI))
