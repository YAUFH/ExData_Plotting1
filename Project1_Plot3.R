download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power.zip")
unzip("power.zip")
powerconsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

powerconsumption$Date <- as.Date(powerconsumption$Date, format= "%d/%m/%Y")
subsetpower <- subset(powerconsumption, powerconsumption$Date=="2007-02-01"|powerconsumption$Date=="2007-02-02")

subsetpower <- transform(subsetpower, timestamp = as.POSIXct(paste(Date,Time)), "%d/%m/%Y %H:%M:%S")

#initate plot
plot(subsetpower$timestamp,as.numeric(as.character(subsetpower$Sub_metering_1)), type = "l", xlab = "", ylab="Energy Sub Metering")
lines(subsetpower$timestamp,as.numeric(as.character(subsetpower$Sub_metering_2)), col="red")
lines(subsetpower$timestamp,as.numeric(as.character(subsetpower$Sub_metering_3)), col="blue")

#annotate plot
legend("topright", lty=1, col = c("black","red","blue"), c("Sub_metering1","Sub_metering2","Sub_metering3"))
title(main= "Energy Sub-Metering vs Time")

#export file to PNG
dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()