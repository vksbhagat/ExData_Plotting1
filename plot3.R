#extract the gz file and then read it, if you don't want to extract it then read it
data <- read.csv('./household_power_consumption.txt', sep=";", na.strings="?")

#make subset by discarding all rows but those of days 1/2/2007 and 2/2/2007
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# build datatimes vector
datetimes <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plot graph
png("plot3.png")
plot(datetimes, data$Sub_metering_1, type="l", ylab="Energy sub metering")
points(datetimes, data$Sub_metering_2, type="l", col="red")
points(datetimes, data$Sub_metering_3, type="l", col="blue")

# set legend
legend("topright", lwd=c(1, 1, 1), col=c("black","red","blue"), border=c(1,4,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# copy to file in png format
dev.off()