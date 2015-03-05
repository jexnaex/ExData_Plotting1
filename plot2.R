#Download and extract the data from 
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02",]
dat$dt <- as.POSIXct(paste(as.character(dat$Date), as.character(dat$Time)))
quartz()
dev.cur()
dev.copy(png, file = paste(getwd(),"plot2.png", sep = "/"), width = 480, height = 480, units = "px")
plot(dat$dt, dat$Global_active_power, ylab = "Global Active Power(kilowatts)", xlab = "", type = "n")
lines(dat$dt, dat$Global_active_power)
dev.off()
