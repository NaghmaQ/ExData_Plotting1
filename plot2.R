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

#creating a plot of line graph type in png file device
png(file = "plot2.png")
with(powerdata, plot(x = datetime, y = Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
