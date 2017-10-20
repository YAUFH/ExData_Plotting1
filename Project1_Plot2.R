download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power.zip")
unzip("power.zip")
powerconsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

powerconsumption$Date <- as.Date(powerconsumption$Date, format= "%d/%m/%Y")
subsetpower <- subset(powerconsumption, powerconsumption$Date=="2007-02-01"|powerconsumption$Date=="2007-02-02")

subsetpower <- transform(subsetpower, timestamp = as.POSIXct(paste(Date,Time)), "%d/%m/%Y %H:%M:%S")

#subsetpower$Date <- as.Date(subsetpower$Date, format= "%d/%m/%Y")
#subsetpower$Time <- strptime(subsetpower$Time, format= "%H:%M:%S")

#initiate plot
plot(subsetpower$timestamp, as.numeric(as.character(subsetpower$Global_active_power)), type ="l", xlab ="", ylab = "Global Active Power(Kilowatts)")

#annotate plot
title(main =  "global active power vs time")

#export file to PNG
dev.copy(png, file = "Plot2.png", width = 480, height = 480)
dev.off()

