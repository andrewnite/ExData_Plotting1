
# Read the csv data from text file
powerConsumptionData<-read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)

# Filter by the data by date
filterDates <- as.Date(c('2007-02-01', '2007-02-02'))
filteredPowerConsumptionData <- powerConsumptionData[as.Date(powerConsumptionData$Date, "%d/%m/%Y") %in% filterDates,]

# Create a histogram plot and save as png
png(filename="plot1.png", width=480, height=480, units="px")
hist(as.numeric(filteredPowerConsumptionData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()