## The third plot

# Create the plot folder if it doesn't exist
if (!file.exists('Plots')) {
  dir.create('Plots')
}

# Load the clean data
source('get_and_clean_data.R')

# Open the device
png(filename='Plots/plot3.png', width=480, height=480, units='px')

# Plot the data
line_color <- c('black', 'red', 'blue')
graph_labels <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
plot(consume$DateTime, consume$SubMetering1, type='l', col=line_color[1], xlab='', ylab='Energy sub metering')
lines(consume$DateTime, consume$SubMetering2, col=line_color[2])
lines(consume$DateTime, consume$SubMetering3, col=line_color[3])

# Add a legend
legend('topright', legend=graph_labels, col=line_color, lty='solid')

# Turn off the device
x <- dev.off()