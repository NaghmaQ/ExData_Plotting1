# reading the data file
powerFile <- read.csv2("household_power_consumption.txt", na.strings = "?")

# checking classes of variables
str(powerFile)

# subsetting data according to the dates 1/2/2007 and 2/2/2007
powerdata <- subset(powerFile, Date == "1/2/2007" | Date == "2/2/2007", select=Date:Sub_metering_3)

#converting the variables date and time from character to POSIXlt
powerdata$datetime <- paste(powerdata$Date, powerdata$Time, sep = " ")
powerdata$datetime <- strptime(powerdata$datetime, "%d/%m/%Y %H:%M:%S")
str(powerdata)

#creating a line graph plot showing three variables and a legend in png file device
png(file = "plot3.png")
with(powerdata, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(powerdata, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(powerdata, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1)
dev.off()