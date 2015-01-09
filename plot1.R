
# powerConsumptionData<-read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)

filterDates <- as.Date(c('2007-02-01', '2007-02-02'))
filteredPowerConsumptionData <- powerConsumptionData[as.Date(powerConsumptionData$Date, "%d/%m/%Y") %in% filterDates,]

