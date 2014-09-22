df <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE)
newdata <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

newdata$CombinedTime <- paste(newdata$Date, newdata$Time, sep=" ")
newdata$CombinedTime <- strptime(newdata$CombinedTime, format="%d/%m/%Y %H:%M:%S")

png(file="plot4.png")

par(mfrow = c(2, 2))
with(newdata, {
  #plot, top left
  plot(newdata$CombinedTime, newdata$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n")
  lines(newdata$CombinedTime, newdata$Global_active_power)
  
  #plot, top right
  plot(newdata$CombinedTime, newdata$Voltage, xlab="datetime", ylab="Voltage", type="n")
  lines(newdata$CombinedTime, newdata$Voltage)  
  
  #plot, lower left
  with(newdata, plot(newdata$CombinedTime, newdata$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
  lines(newdata$CombinedTime, newdata$Sub_metering_1)
  lines(newdata$CombinedTime, newdata$Sub_metering_2, col="red")
  lines(newdata$CombinedTime, newdata$Sub_metering_3, col="blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #plot, lower right
  plot(newdata$CombinedTime, newdata$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="n")
  lines(newdata$CombinedTime, newdata$Global_reactive_power) 
})

dev.off()