## Ensure the "Individual household electric power consumption Data Set" has been downloaded and cleaned

# Check and install "data.table" if needed
if (!require("data.table")) {
  install.packages("data.table")
}

# Check and install "lubridate" if needed
if (!require("lubridate")) {
  install.packages("lubridate")
}

# Load the "data.table" and "lubridate" packages
library(data.table)
library(lubridate)

# Set strings to track relevant download information
zipfile <- "household_power_consumption.zip"
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dir <- "Source Data"

# Checks to see if the dataset is downloaded already
if (!file.exists(zipfile)) {
  download.file(url, zipfile, mode = "wb")
}

# Unzip the dataset if it hasn't been yet
if (!file.exists(dir)) {
  unzip("household_power_consumption.zip", files = NULL, exdir = "./Source Data")
}

# Read the data and restrict to "1/2/2007" and "2/2/2007" where "dd/mm/yyyy"
data_class <- c(rep('character', 2), rep('numeric', 7))
consume <- read.table('Source Data/household_power_consumption.txt', header=TRUE, sep=';',na.strings='?',colClasses=data_class)
consume <- consume[consume$Date == '1/2/2007' | consume$Date=='2/2/2007',]

# Clean the data and convert the date/time fields
headers <- c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
             'SubMetering1','SubMetering2','SubMetering3')
colnames(consume) <- headers
consume$DateTime <-dmy(consume$Date) + hms(consume$Time)
consume <- consume[,c(10,3:9)]

# Write the clean data to "clean_data.txt"
write.table(consume, file='Source Data/clean_data.txt',sep='|',row.names=FALSE)