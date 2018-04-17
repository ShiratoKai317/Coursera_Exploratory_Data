## The first plot

# Create the plot folder if it doesn't exist
if (!file.exists('Plots')) {
  dir.create('Plots')
}

# Load the cleaned data
source('get_and_clean_data.R')

# Open the device
png(filename='Plots/plot1.png', width=480, height=480, units='px')

# Plot the data
hist(consume$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Turn off device
x <- dev.off()