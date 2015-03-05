#Download and extract the data from 
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat <- dat$Global_active_power[dat$Date == "2007-02-01" | dat$Date == "2007-02-02"]
quartz()
dev.cur()
dev.copy(png, file = paste(getwd(),"plot1.png", sep = "/"), width = 480, height = 480, units = "px")
hist(dat, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()

