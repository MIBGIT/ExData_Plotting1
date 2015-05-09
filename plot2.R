##
## Goal: examine how household energy usage varies over a 2-day period in Feb 2007
## 
## Plot 2: Line graph of global active power over two days in February 2007

# open Household Power Consumption table: HPC
HPC = read.delim("household_power_consumption.txt",header= TRUE, sep = ";")

# subset for the two relevant dates
HPCfeb = subset(HPC, Date=="1/2/2007" | Date =="2/2/2007")

# convert class to numeric
HPCfeb$Global_active_power = as.numeric(as.character(HPCfeb$Global_active_power))

# plot graph and save to a .png file
png(file = "plot2.png") 
x =paste(HPCfeb$Date, HPCfeb$Time)
z <- strptime(x, "%d/%m/%Y %H:%M:%S")
plot(z,HPCfeb$Global_active_power, type="l", xlab="",ylab= "Global Active Power (kilowatts")
dev.off() 
