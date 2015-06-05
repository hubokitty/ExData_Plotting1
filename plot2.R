### Plot 2

## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
subSetData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Get values 
globalActivePower <- as.numeric(subSetData$Global_active_power)
dateTime<-strptime(paste(subSetData$Date,subSetData$Time, sep= " "), "%d/%m/%Y %H:%M:%S")

## Plot
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
