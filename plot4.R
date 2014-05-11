#extract the gz file and then read it, if you don't want to extract it then read it
data <- read.csv('./household_power_consumption.txt', sep=";", na.strings="?")

#make subset by discarding all rows but those of days 1/2/2007 and 2/2/2007
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# build datatimes vector
datetimes <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plot graph in a 2x2 grid
png("plot4.png")
par(mfrow = c(2,2))
plot(datetimes, data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(datetimes, data$Voltage, type="l", col="black", ylab="Voltage", xlab="datetime")
plot(datetimes, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
points(datetimes, data$Sub_metering_2, type="l", col="red")
points(datetimes, data$Sub_metering_3, type="l", col="blue")

# set legend
legend("topright", lwd=c(1, 1, 1), col=c("black","red","blue"), border=c(1,1,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
plot(datetimes, data$Global_reactive_power, type="l", col="black", xlab="datetime", 
     ylab="Global_reactive_power")

# copy to file in png format
dev.off()