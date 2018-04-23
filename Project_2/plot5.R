## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

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

# Extract all "ON-ROAD" type data from Baltimore data set
on_road <- aggregate(Emissions ~ year, balt_totals[balt_totals$type=="ON-ROAD",], sum)

# Open the device
png(filename='Plots/plot5.png', width=480, height=480, units='px')

# Plot the data
ggp <- ggplot(on_road, aes(factor(year), Emissions))+ geom_bar(stat="identity") +
  xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from Motor Vehicles in Baltimore City from 1999 to 2008')
print(ggp)

# Turn off device
x <- dev.off()

