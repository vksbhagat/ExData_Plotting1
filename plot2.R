#extract the gz file and then read it, if you don't want to extract it then read it
data <- read.csv('./household_power_consumption.txt', sep=";", na.strings="?")

#make subset by discarding all rows but those of days 1/2/2007 and 2/2/2007
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# build datatimes vector
datetimes <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plot data
png("plot2.png")
plot(datetimes, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")

# copy to file in png format
dev.off()