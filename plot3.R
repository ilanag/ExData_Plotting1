df <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE)
newdata <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

newdata$CombinedTime <- paste(newdata$Date, newdata$Time, sep=" ")
newdata$CombinedTime <- strptime(newdata$CombinedTime, format="%d/%m/%Y %H:%M:%S")

png(file="plot3.png")

with(newdata, plot(newdata$CombinedTime, newdata$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
lines(newdata$CombinedTime, newdata$Sub_metering_1)
lines(newdata$CombinedTime, newdata$Sub_metering_2, col="red")
lines(newdata$CombinedTime, newdata$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", 'Sub_metering_3'))

dev.off()