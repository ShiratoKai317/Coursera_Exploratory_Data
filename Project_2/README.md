## Exploratory Data Project 2

The second project of the Exploratory Data class. The goal is to examine the National Emission Inventory (NEI) and create plots to answer specific questions posed as follows:
  1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
  2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
  3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
  4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
  5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
  6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

The created plots are viewable in the "Plots" folder. Furthermore, "get_data.R" was written to download, unzip and clean the data set for easier use by the individual scripts. It creates a few global variables which are used by the scripts to plot the relevant graphs.

