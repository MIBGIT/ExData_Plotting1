##
## Goal: examine how household energy usage varies over a 2-day period in Feb 2007
## 
## Plot 4: Multiple plots over two days in February 2007

# open Household Power Consumption table: HPC
HPC = read.delim("household_power_consumption.txt",header= TRUE, sep = ";")

# subset for the two relevant dates
HPCfeb = subset(HPC, Date=="1/2/2007" | Date =="2/2/2007")

# extract date and time in suitable format for plotting
x =paste(HPCfeb$Date, HPCfeb$Time)
z <- strptime(x, "%d/%m/%Y %H:%M:%S")

# convert class to numeric
GAP = as.numeric(as.character(HPCfeb$Global_active_power))
Voltage = as.numeric(as.character(HPCfeb$Voltage))
GRP = as.numeric(as.character(HPCfeb$Global_reactive_power))
s1 = as.numeric(as.character(HPCfeb$Sub_metering_1))
s2 = as.numeric(as.character(HPCfeb$Sub_metering_2))
s3 = as.numeric(as.character(HPCfeb$Sub_metering_3))

# now plot and save to .png file
png(file = "plot4.png")
sMax = max(c(max(s1), max(s2), max(s3)))
par(mfrow=c(2,2))
plot(z,GAP,type="l", xlab = "", ylab= "Global Active Power (kilowatts)")
plot(z,Voltage, type="l", ylab= "Voltage", xlab= "datetime")
plot(z,s1,type="l", col = "black",ylim=c(0,sMax),xlab="",ylab="Energy sub metering")
par(new = T)
plot(z,s2,type="l",col="red",ylim=c(0,sMax), xlab="",ylab ="")
par(new = T)
plot(z,s3,type="l",col="blue",ylim=c(0,sMax),xlab="",ylab= "")
par(new = F)
plot(z,GRP,type="l", xlab="Datetime",ylab= "Global_reactive_power")
dev.off() 
