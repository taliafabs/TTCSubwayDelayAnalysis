#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Talia Fabregas
# Date: 22 September 2024
# Contact: talia.fabregas@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
# install.packages("readxl")
library(readxl)

#### Download data ####

# subway_2018 <- list_package_resources("996cfe8d-fb35-40ce-b569-698d51fc683b") |>
#   filter(name == "ttc-subway-delay-data-2018")
# 
# subway_2019 <- list_package_resources("996cfe8d-fb35-40ce-b569-698d51fc683b") |>
#   filter(name == "ttc-subway-delay-data-2019")
# 
# subway_2020 <- list_package_resources("996cfe8d-fb35-40ce-b569-698d51fc683b") |>
#   filter(name == "ttc-subway-delay-data-2020")
# 
# subway_2021 <- list_package_resources("996cfe8d-fb35-40ce-b569-698d51fc683b") |>
#   filter(name == "ttc-subway-delay-data-2021")
# 
# subway_2022 <- list_package_resources("996cfe8d-fb35-40ce-b569-698d51fc683b") |>
#   filter(name == "ttc-subway-delay-data-2022")

subway_2023 <- list_package_resources("996cfe8d-fb35-40ce-b569-698d51fc683b") |>
  filter(name == "ttc-subway-delay-data-2023") |>
  get_resource()




#### Save data ####
write.csv(subway_2023, "data/raw_data/subway_2023.csv") 

         
