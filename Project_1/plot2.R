## The second plot

# Create the plot folder if it doesn't exist
if (!file.exists('Plots')) {
  dir.create('Plots')
}

# Load the clean data
source('get_and_clean_data.R')

# Open the device
png(filename='Plots/plot2.png', width=480, height=480, units='px')

# Plot the data
plot(consume$DateTime, consume$GlobalActivePower, ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Turn off the device
x <- dev.off()