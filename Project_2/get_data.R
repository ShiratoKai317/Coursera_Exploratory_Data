## Download and unzip the NEI data if it has not already been done

# Set strings to track relevant download information
zipfile <- "NEI_data.zip"
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
dir <- "Source Data"

# Check if subdirectory "Source Data" has been made and create if it isn't
if (!file.exists(dir)) {
  dir.create(dir)
  download.file(url, zipfile, mode="wb")
  unzip(zipfile, files=NULL, exdir="./Source Data")
}

# Read both RDS files
nei <- readRDS("Source Data/summarySCC_PM25.rds")
scc <- readRDS("Source Data/Source_Classification_Code.rds")

# Merge the datasets
merged <- merge(nei, scc, by="SCC")

# Extract only Baltimore's emissions
balt_nei <- subset (nei, fips == "24510")

# Get Baltimore's emission totals
balt_totals = aggregate(Emissions ~ year + type, balt_nei, sum)