## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
## Which city has seen greater changes over time in motor vehicle emissions?

# Check and install "ggplot2" if needed
if (!require("ggplot2")) {
  install.packages("ggplot2")
}

# Load "ggplot2"
library(ggplot2)

# Create the plot folder if it doesn't exist
if (!file.exists('Plots')) {
  dir.create('Plots')
}

# Load the cleaned data
source('get_data.R')

# Extract all "ON-ROAD" type data from data set which pertains to Baltimore City and Los Angeles
compare <- nei[(nei$fips=="24510"|nei$fips=="06037") & nei$type=="ON-ROAD",]
total <- aggregate(Emissions ~ year + fips, compare, sum)
total$fips[total$fips=="24510"] <- "Baltimore, MD"
total$fips[total$fips=="06037"] <- "Los Angeles, CA"

# Open the device
png(filename='Plots/plot6.png', width=480, height=480, units='px')

# Plot the data
ggp <- ggplot(total, aes(factor(year), Emissions)) + facet_grid(. ~ fips) + 
  geom_bar(stat="identity")  + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from Motor Vehicles in Baltimore City and Los Angeles, CA from 1999 to 2008')
print(ggp)

# Turn off device
x <- dev.off()
