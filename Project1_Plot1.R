download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power.zip")
unzip("power.zip")
powerconsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

powerconsumption$Date <- as.Date(powerconsumption$Date, format= "%d/%m/%Y")
subsetpower <- subset(powerconsumption, powerconsumption$Date=="2007-02-01"|powerconsumption$Date=="2007-02-02")

#initiate plot
hist(as.numeric(as.character(subsetpower$Global_active_power)), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

#annotate plot
title(main = "Global Active Power")

#export file to PNG
dev.copy(png, file = "Plot1.png", width = 480, height = 480)
dev.off()
