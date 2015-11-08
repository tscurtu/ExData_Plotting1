
data <- read.csv(file="household_power_consumption.txt", na.strings="?", sep=";", stringsAsFactors=FALSE)
data <- transform(data, Date=as.Date(Date, "%d/%m/%Y"), Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
start.date <- as.Date("01/02/2007", "%d/%m/%Y")
stop.date <- as.Date("02/02/2007", "%d/%m/%Y")
data <- subset(data, Date >= start.date)
data <- subset(data, Date <= stop.date)

png("plot2.png", width = 480, height = 480)
plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
