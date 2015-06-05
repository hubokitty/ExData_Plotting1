### Plot 3

## Read data  
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
subSetData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Retrieve values
globalActivePower <- as.numeric(subSetData$Global_active_power)
dateTime<-strptime(paste(subSetData$Date,subSetData$Time, sep= " "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## Plot
png("plot3.png", width=480, height=480)
plot(dateTime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2, col = c("black","red","blue"))
dev.off()
