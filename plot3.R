##
## Goal: examine how household energy usage varies over a 2-day period in Feb 2007
## 
## Plot 3: 4 plots against dattime over two days in February 2007


# open Household Power Consumption table: HPC
HPC = read.delim("household_power_consumption.txt",header= TRUE, sep = ";")

# subset for the two relevant dates
HPCfeb = subset(HPC, Date=="1/2/2007" | Date =="2/2/2007")

# extract date and time in suitable format for plotting
x =paste(HPCfeb$Date, HPCfeb$Time)
z <- strptime(x, "%d/%m/%Y %H:%M:%S")

# convert class to numeric
s1 = as.numeric(as.character(HPCfeb$Sub_metering_1))
s2 = as.numeric(as.character(HPCfeb$Sub_metering_2))
s3 = as.numeric(as.character(HPCfeb$Sub_metering_3))

# open ,png file
png(file = "plot3.png")

# how long is the common y-axis for all four plots
sMax = max(c(max(s1), max(s2), max(s3)))

# now plot the graphs
plot(z,s1,type="l", col = "black",ylim=c(0,sMax),xlab="",ylab="Energy sub metering")
par(new=T)
plot(z,s2,type="l",col="red",ylim=c(0,sMax), xlab="",ylab ="")
par(new=T)
plot(z,s3,type="l",col="blue",ylim=c(0,sMax),xlab="",ylab= "")
par(new=F)
legend("topright",pch = 20,col = c("black","red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off() 
