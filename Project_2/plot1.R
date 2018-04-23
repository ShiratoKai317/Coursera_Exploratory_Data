## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

# Create the plot folder if it doesn't exist
if (!file.exists('Plots')) {
  dir.create('Plots')
}

# Load the cleaned data
source('get_data.R')

# Get the aggregate emission totals
totals = aggregate(Emissions ~ year, nei, sum)

# Open the device
png(filename='Plots/plot1.png', width=480, height=480, units='px')

# Plot the data
plot(totals$year, totals$Emissions, type = "o", col = "red",
     main = expression("Total US "~ PM[2.5]~ "Emissions by Year"),
     ylab = expression("Total US "~   PM[2.5] ~ "Emissions"), xlab = "Year")

# Turn off device
x <- dev.off()