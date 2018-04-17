## The fourth plot file

# Create the plot folder if it doesn't exist
if (!file.exists('Plots')) {
  dir.create('Plots')
}

# Load the clean data
source('get_and_clean_data.R')

# Open the device
png(filename='Plots/plot4.png', width=480, height=480, units='px')

# Make four plots
par(mfrow=c(2,2))

# The first plot (4th quadrant)
plot(consume$DateTime, consume$GlobalActivePower, ylab='Global Active Power', xlab='', type='l')

# The second plot (1st quadrant)
plot(consume$DateTime, consume$Voltage, xlab='datetime', ylab='Voltage', type='l')

# The third plot (3rd quadrant)
line_color <- c('black', 'red', 'blue')
graph_labels <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
plot(consume$DateTime, consume$SubMetering1, type='l', col=line_color[1], xlab='', ylab='Energy sub metering')
lines(consume$DateTime, consume$SubMetering2, col=line_color[2])
lines(consume$DateTime, consume$SubMetering3, col=line_color[3])

# The fourth plot (2nd quadrant)
plot(consume$DateTime, consume$GlobalReactivePower, xlab='datetime', ylab='Global_reactive_power', type='l')

# Turn off the device
x <- dev.off()