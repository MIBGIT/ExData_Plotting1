##
## Goal: examine how household energy usage varies over a 2-day period in Feb 2007
## 
## Plot 1: Histogram of Global Active Power

# open Household Power Consumption table: HPC
HPC = read.delim("household_power_consumption.txt",header= TRUE, sep = ";")

# subset for the two relevant dates
HPCfeb = subset(HPC, Date=="1/2/2007" | Date =="2/2/2007")

# convert class to numeric
HPCfeb$Global_active_power = as.numeric(as.character(HPCfeb$Global_active_power))

# draw histogram and save to a .png file
png(file = "plot1.png") ## open PDF device, create 'plot1.pdf'
hist(HPCfeb$Global_active_power,col="red",main= "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off() ## close the PNG file device


