#Download and extract the data from 
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

#loading the data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

#extracting the used data
dat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02",]
dat$dt <- as.POSIXct(paste(as.character(dat$Date), as.character(dat$Time)))
quartz()
dev.cur()
dev.copy(png, file = paste(getwd(),"plot4.png", sep = "/"), width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

#plotting
plot(dat$dt, dat$Global_active_power, ylab = "Global Active Power", xlab = "", type = "n")
lines(dat$dt, dat$Global_active_power)
plot(dat$dt, dat$Voltage, ylab = "Voltage", xlab = "datetime", type = "n")
lines(dat$dt, dat$Voltage)
plot(dat$dt, dat$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
lines(dat$dt, dat$Sub_metering_1)
lines(dat$dt, dat$Sub_metering_2, col="red")
lines(dat$dt, dat$Sub_metering_3, col = "blue")
plot(dat$dt, dat$Global_reactive_power, xlab = "datetime", type = "n")
lines(dat$dt, dat$Global_reactive_power)
dev.off()
