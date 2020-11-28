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

#creating a histogram in png file device
png(file = "plot1.png", width=480, height=480)
with(powerdata, hist(as.numeric(Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)"))
dev.off()