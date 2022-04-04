#### Preamble ####
# Purpose: Process the raw survey data downloaded from https://www150.statcan.gc.ca/n1/pub/56m0003x/56m0003x2020001-eng.htm
# Author: Kimlin Chin
# Data: 3 April 2022
# Contact: kimlin.chin@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().
library(memisc)
library(tidyverse)
# Read in the raw data. 

# code from https://www.jacobsonconsulting.com/index.php/r-notes/18-processing-statistics-canada-pumf-files-in-r
input_folder <- "inputs/data/SPSS"
columns_file<-"inputs/data/SPSS/CIUS2018PUMF_i.sps"

variable_labels<-"inputs/data/SPSS/CIUS2018PUMF_vare.sps"

variable_values<-"inputs/data/SPSS/CIUS2018PUMF_vale.sps"

missing_values<-"inputs/data/SPSS/CIUS2018PUMF_miss.sps"

data_file<-"inputs/data/CIUS2018PUMF.txt"

cius2018_efam <- spss.fixed.file(
  data_file,
  columns_file,
  varlab.file = variable_labels,
  codes.file = variable_values,
  missval.file = missing_values,
  count.cases = TRUE,
  to.lower = TRUE
)

print(cius2018_efam)

cius2018_efam.ds<-as.data.set(cius2018_efam)

write_html(codebook(cius2018_efam.ds),file="inputs/data/cius2018_efam_codebook.html")

outlist<-c("cius2018_efam.ds")
save(list=outlist,file="inputs/data/cius2018_efam_save.Rsave")

cius2018_efam.df<-as.data.frame(cius2018_efam.ds)
write_csv(cius2018_efam.df, "inputs/data/cius2018_efam.csv")
         

#### What's next? ####



         