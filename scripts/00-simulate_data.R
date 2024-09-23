#### Preamble ####
# Purpose: Simulates TTC Subway Delays in 2023
# Author: Talia Fabregas
# Date: 11 21 September 2024
# Contact: talia.fabregas@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
set.seed(304)

#### Simulate Data

# Define a start and end date for 2023
start_date <- as.Date("2023-01-01")
end_date <- as.Date("2023-12-31")

subway_stations <- c(
  "Vaughan Metropolitan Centre", "Hwy 407", "Pioneer Village", "York University",
  "Finch West", "Downsview Park", "Sheppard West", "Wilson", "Yorkdale",
  "Lawrence West", "Glencairn", "Eglington West", "St. Clair West", "Dupont",
  "Spadina", "St. George", "Museum", "Queen's Park", "St. Patrick", "Osgoode",
  "St. Andrew", "Union", "King", "Queen", "Dundas", "College", "Wellsley", 
  "Bloor Yonge", "Summerhill", "Rosedale", "St. Clair", "Davisville",
  "Eglington", "Lawrence", "York Mills", "Sheppard Yonge", "Finch")

delay_reasons <- c("Mechanical Issue", "Trespasser on Tracks", "Weather",
                   "Operational Issue", "Signal Issue", "Power Outage")
num_sims = 500

simulated_data <- tibble(
  # Simulate 500 subway delays
  date = sample(seq.Date(start_date, end_date, by = "day"), num_sims, replace=TRUE),
  station = sample(subway_stations, num_sims, replace=TRUE),
  start_time = sprintf("%02d:%02d", sample(0:23, num_sims, replace=TRUE), sample(0:59, num_sims, replace=TRUE)),
  duration = sample(2:60, num_sims, replace = TRUE),
  reason = sample(delay_reasons, num_sims, replace=TRUE)
)

