## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

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

# Extract coal combustion related data
coal <- grepl("coal", merged$Short.Name, ignore.case=TRUE)
results <- merged[coal,]
coal_totals <- aggregate(Emissions ~ year, results, sum)

# Open the device
png(filename='Plots/plot4.png', width=480, height=480, units='px')

# Plot the data
ggp <- ggplot(coal_totals, aes(factor(year), Emissions)) + geom_bar(stat="identity") +
  xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions (10^5 Tons)")) + 
  ggtitle('Coal Combustion Emissions from 1999 to 2008')
print(ggp)

# Turn off device
x <- dev.off()