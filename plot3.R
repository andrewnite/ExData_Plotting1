
# Read the csv data from text file
powerConsumptionData<-read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

# Filter by the data by date
filterDates <- as.Date(c('2007-02-01', '2007-02-02'))
filteredPowerConsumptionData <- powerConsumptionData[as.Date(powerConsumptionData$Date, "%d/%m/%Y") %in% filterDates,]

# Create a date/time variable which concatenates the date and time into one
filteredPowerConsumptionData$Date_time <- strptime(paste(filteredPowerConsumptionData$Date,filteredPowerConsumptionData$Time), "%d/%m/%Y %H:%M:%S")

# Create a plot and save as png
png(filename="plot3.png", width=480, height=480, units="px")
plot(filteredPowerConsumptionData$Date_time, as.numeric(filteredPowerConsumptionData$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
lines(filteredPowerConsumptionData$Date_time, as.numeric(filteredPowerConsumptionData$Sub_metering_2), col="red")
lines(filteredPowerConsumptionData$Date_time, as.numeric(filteredPowerConsumptionData$Sub_metering_3), col="blue")

# Add a legend
legend("topright", lty = c(1,1),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"))

dev.off()
