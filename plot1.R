df <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE)
newdata <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

png(file="plot1.png")

with(newdata, hist(newdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency"))

dev.off() 