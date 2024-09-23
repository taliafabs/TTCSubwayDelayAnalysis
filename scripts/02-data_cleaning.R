#### Preamble ####
# Purpose: Cleans the raw TTC subway delay data obtained from Open Data Toronto
# Author: Talia Fabregas
# Date: 22 September 2024
# Contact: talia.fabregas@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 01-download_data.R first
# Any other information needed? No

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data_2023 <- read_csv("data/raw_data/subway_2023.csv")

raw_data_2023 <- raw_data_2023 |>
  select(Date, Time, Day, Station, `Min Delay`, `Min Gap`, Line) 

# Remove missing values 
raw_data_2023 <- raw_data_2023 |>
  filter(!is.na(Line))

# Identify subway lines 1, 2, 3, 4
raw_data_2023 <- raw_data_2023 |>
  mutate(
    Line = 
      case_match(
        Line,
        "YU" ~ "1",
        "BD" ~ "2",
        "YU/BD" ~ "1",
        "BD/YU" ~ "2",
        "SRT" ~ "3",
        "SHP" ~ "4",
        "YU / BD" ~ "1",
        "BLOOR DANFORTH & YONGE" ~ "2",
        "YUS/BD" ~ "1",
        "BD LINE 2" ~ "2",
        "999" ~ "NA",
        "YUS" ~ "1",
        "YU & BD" ~ "1",
        "77 SWANSEA" ~ "NA"
    )
  )

# Remove the NA's that came from 999 or 77 Swansea which are not TTC subway lines
raw_data_2023 <- raw_data_2023 |>
  filter(Line != "NA")

cleaned_data_2023 <- raw_data_2023 |>
  mutate(Station = str_replace(Station, " STATION", ""))


#### Save data ####
write_csv(cleaned_data_2023, "data/analysis_data/cleaned_data_2023.csv")
