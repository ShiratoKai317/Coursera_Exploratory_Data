## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
## Which have seen increases in emissions from 1999-2008?

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

# Open the device
png(filename='Plots/plot3.png', width=480, height=480, units='px')

# Plot the data
ggp <- ggplot(balt_totals, aes(year, Emissions, color = type)) + 
  geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore from 1999 to 2008 (Tons)')
print(ggp)

# Turn off device
x <- dev.off()