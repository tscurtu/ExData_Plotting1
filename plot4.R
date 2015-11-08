
data <- read.csv(file="household_power_consumption.txt", na.strings="?", sep=";", stringsAsFactors=FALSE)
data <- transform(data, Date=as.Date(Date, "%d/%m/%Y"), Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
start.date <- as.Date("01/02/2007", "%d/%m/%Y")
stop.date <- as.Date("02/02/2007", "%d/%m/%Y")
data <- subset(data, Date >= start.date)
data <- subset(data, Date <= stop.date)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), cex=0.8, lwd=0.1)

plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(data$Time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data$Time, with(data, pmax(Sub_metering_1, Sub_metering_2, Sub_metering_3)), type="n", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_1, col="black")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(1,1,1),col=c("black","red","blue"))

plot(data$Time, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
