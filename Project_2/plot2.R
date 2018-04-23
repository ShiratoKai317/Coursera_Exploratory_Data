## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?

# Create the plot folder if it doesn't exist
if (!file.exists('Plots')) {
  dir.create('Plots')
}

# Load the cleaned data
source('get_data.R')

# Open the device
png(filename='Plots/plot2.png', width=480, height=480, units='px')

# Plot the data
plot(balt_totals$year, balt_totals$Emissions, type = "o",
     main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"),
     xlab = "Year", ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"), col = "red")

# Turn off device
x <- dev.off()