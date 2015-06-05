### Plot 4
## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
subSetData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Get values
globalActivePower <- as.numeric(subSetData$Global_active_power)
dateTime<-strptime(paste(subSetData$Date,subSetData$Time, sep= " "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
Voltage <-as.numeric(subSetData$Voltage)
globelReactivePower <-as.numeric(subSetData$Global_reactive_power)

## Plot figures
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(dateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dateTime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2, col = c("black","red","blue"))
plot(dateTime, globelReactivePower, type="l",xlab="datetime",  ylab="Global_reactive_power")
dev.off()
